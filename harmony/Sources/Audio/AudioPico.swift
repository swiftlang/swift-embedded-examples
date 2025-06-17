//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift open source project
//
// Copyright (c) 2024 Apple Inc. and the Swift project authors.
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
//
//===----------------------------------------------------------------------===//

extension UnsafeMutableBufferPointer where Element: ~Copyable {
  func split(at index: Self.Index) -> (Self, Self) {
    (self.extracting(..<index), self.extracting(index...))
  }
}

let i2s_dma_configure_size = DMA_SIZE_32

// FIXME: dont hard code these 0
let PICO_AUDIO_I2S_PIO: UInt32 = 0
let PICO_AUDIO_I2S_DMA_IRQ: UInt32 = 0
let PICO_AUDIO_I2S_DMA_CHANNEL: UInt32 = 0
let PICO_AUDIO_I2S_SILENCE_BUFFER_SAMPLE_LENGTH: UInt32 = 256
let PICO_AUDIO_I2S_DATA_PIN: UInt32 = 26
let PICO_AUDIO_I2S_CLOCK_PIN_BASE: UInt32 = 27
let DRIVER_POLL_INTERVAL_MS: UInt32 = 5
let SAMPLES_PER_BUFFER: UInt32 = 512

// ring buffer for SBC Frames
// below 30: add samples, 30-40: fine, above 40: drop samples
let MAX_SBC_FRAME_SIZE = 120

let OPTIMAL_FRAMES_MIN = 60
let OPTIMAL_FRAMES_MAX = 80
let ADDITIONAL_FRAMES = 30

struct AudioPico: ~Copyable {
  var fill_timer: btstack_timer_source_t
  var resampler: Resampler

  // buffer for sbc encoded audio
  var sbc_frame_size: Int
  let sbc_frame_buffer: UnsafeMutableBufferPointer<UInt8>
  var sbc_frames: RingBuffer<UInt8>
  var sbc_frames_in_buffer: Int {
    guard sbc_frame_size > 0 else { return 0 }
    return self.sbc_frames.count / self.sbc_frame_size
  }

  // overflow buffer for not fully used sbc frames, with additional frames for resampling
  let decoded_audio_buffer: UnsafeMutableBufferPointer<Int16>
  var decoded_audio: RingBuffer<Int16>

  init() {
    let CHANNELS_PER_FRAME = 2
    let capacity = (128 + 16) * CHANNELS_PER_FRAME

    self.fill_timer = btstack_timer_source_t()
    self.resampler = Resampler(channels: CHANNELS_PER_FRAME)

    self.sbc_frame_size = 0
    self.sbc_frame_buffer = UnsafeMutableBufferPointer<UInt8>.allocate(
      capacity: MAX_SBC_FRAME_SIZE)
    self.sbc_frames = RingBuffer<UInt8>(
      capacity: (OPTIMAL_FRAMES_MAX + ADDITIONAL_FRAMES) * MAX_SBC_FRAME_SIZE)

    self.decoded_audio_buffer = .allocate(capacity: capacity)
    self.decoded_audio = RingBuffer<Int16>(capacity: capacity)
  }

  mutating func enqueue(sbc_frames: UnsafeMutableBufferPointer<UInt8>, frame_size: Int)
  {
    self.sbc_frame_size = frame_size
    if !self.sbc_frames.write(contentsOf: sbc_frames) {
      log("Error: SBC frame buffer overflow")
    }
    self.updateResamplingFactor()
  }

  mutating func updateResamplingFactor() {
    let nominal_factor: UInt32 = 0x10000
    let compensation: UInt32 = 0x00100

    let resampling_factor =
      switch self.sbc_frames_in_buffer {
      case ..<OPTIMAL_FRAMES_MIN:
        nominal_factor - compensation
      case OPTIMAL_FRAMES_MAX...:
        nominal_factor + compensation
      default:
        nominal_factor
      }

    self.resampler.set(factor: resampling_factor)
  }

  mutating func fill_buffers() {
    while let buffer = Application.shared.audioEngine.buffers.popEmptyBuffer() {
      self.fill(buffer.storage)
      Application.shared.audioEngine.buffers.pushFullBuffer(buffer)
    }
  }

  mutating func fill(_ buffer: UnsafeMutableBufferPointer<Int16>) {
    // called from lower-layer but guaranteed to be on main thread
    guard self.sbc_frame_size != 0 else {
      log("Frame size is 0")
      buffer.update(repeating: 0)
      return
    }

    // first fill from resampled audio
    let samplesReadCount = self.decoded_audio.read(into: buffer)
    var buffer = buffer.extracting(samplesReadCount...)

    // then start decoding sbc frames into the buffer
    while buffer.count > 0, self.sbc_frames.count > self.sbc_frame_size {
      // decode frame
      let elementsRead = self.sbc_frames.read(
        into: self.sbc_frame_buffer, count: self.sbc_frame_size)
      precondition(
        elementsRead == self.sbc_frame_size, "sbc frame size mismatch")

      SBCDecoder.decode_signed_16(
        mode: SBC_MODE_STANDARD,
        packet_status_flag: 0,
        buffer: UnsafeRawBufferPointer(self.sbc_frame_buffer)
      ) { samples, num_channels, sample_rate in
        precondition(num_channels == 2, "must be stereo")

        // Resample audio to compensate for the amount of buffered SBC frames
        let samples = self.resampler.resample(
          samples: .init(samples),
          usingTemporaryBuffer: self.decoded_audio_buffer)

        // Store samples in buffer first and excess in the ring buffer.
        let (samples_to_copy, samples_to_store) = samples.split(
          at: min(samples.count, buffer.count))
        let samplesCopiedCount = buffer.moveUpdate(
          fromContentsOf: samples_to_copy)
        buffer = buffer.extracting(samplesCopiedCount...)
        if !self.decoded_audio.write(contentsOf: samples_to_store) {
          log("ERROR: PCM ring buffer full!")
        }
      }
    }
  }

  mutating func fill_timer(
    _ timer: UnsafeMutablePointer<btstack_timer_source_t>?
  ) {
    // refill
    self.fill_buffers()

    // re-set timer
    btstack_run_loop_set_timer(timer, UInt32(DRIVER_POLL_INTERVAL_MS))
    btstack_run_loop_add_timer(timer)
  }

  mutating func start_stream() {
    // pre-fill buffers
    self.fill_buffers()

    // start timer
    // FIXME: Use ctx
    // NOTE: hardcoded to `Self` because the timer callback has no context
    // argument which can be used to pass `self`
    btstack_run_loop_set_timer_handler(
      &self.fill_timer, { Application.shared.audioEngine.audio_pico.fill_timer($0) })
    btstack_run_loop_set_timer_context(&self.fill_timer, nil)
    btstack_run_loop_set_timer(
      &self.fill_timer, UInt32(DRIVER_POLL_INTERVAL_MS))
    btstack_run_loop_add_timer(&self.fill_timer)
  }

  mutating func stop_stream() {
    // stop timer
    btstack_run_loop_remove_timer(&self.fill_timer)
  }
}
