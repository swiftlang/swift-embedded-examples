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

struct AudioEngine: ~Copyable {
  var running: Bool
  var mute: Bool
  var volume: UInt8
  var rawVolume: UInt8

  var audio_pico: AudioPico
  var audio_i2s: AudioI2S
  var buffers: AudioBufferTransport
  var amp: MAX9744

  init() {
    self.running = false
    self.mute = false
    self.volume = 0
    self.rawVolume = 30

    self.audio_pico = AudioPico()
    self.audio_i2s = AudioI2S(
      data_pin: PICO_AUDIO_I2S_DATA_PIN,
      clock_pin_base: PICO_AUDIO_I2S_CLOCK_PIN_BASE,
      pio: 0,
      pio_sm: 0,
      // FIXME: Dont claim on each `media_processing_init`??
      dma_channel: UInt32(dma_claim_unused_channel(true)))
    self.buffers = AudioBufferTransport(bufferCount: 8, bufferCapacity: BUFFER_SAMPLE_CAPACITY)
    self.amp = MAX9744(i2c: i2c0_inst)

    self.set(volume: 0)
  }
}

extension AudioEngine {
  mutating func `init`(_ configuration: MediaCodecConfigurationSBC) {
    log(#function)
    SBCDecoder.configure(mode: SBC_MODE_STANDARD)

    // setup audio playback
    // FIXME: update channel count in resampler
    // FIXME: update output sample-rate

    self.audio_i2s.update_pio_frequency(
      UInt32(configuration.sampling_frequency))

    self.running = false
  }

  mutating func toggleMute() {
    self.mute.toggle()
    if self.mute {
      self.amp.set(rawVolume: 0)
    } else {
      self.amp.set(rawVolume: rawVolume)
    }
  }

  mutating func set(volume: UInt8) {
    guard self.volume != volume else { return }
    self.volume = volume
    // FIXME: 
    avrcp_target_volume_changed(avrcp_connection.avrcp_cid, volume >> 1)

    // Map volume (0-255) to gain (0-63)
    let rawVolume = UInt8((UInt32(volume) * 63) / 255)
    guard self.rawVolume != rawVolume else { return }
    self.rawVolume = rawVolume

    guard !self.mute else { return }
    self.amp.set(rawVolume: rawVolume)
  }

  mutating func adjustVolume(by delta: Int32) {
    guard delta != 0 else { return }
    let volume = Int32(self.volume) + delta
    let clamped = UInt8(clamping: volume)
    log("Adjust volume by \(delta) to \(clamped)")
    self.set(volume: clamped)
  }

  mutating func start() {
    guard !self.running else { return }
    guard self.audio_pico.sbc_frames.count >= OPTIMAL_FRAMES_MIN else { return }
    log(#function)
    // start audio playback
    self.audio_pico.start_stream()
    self.audio_i2s.enable(true)
    self.running = true
  }

  mutating func pause() {
    guard self.running else { return }
    log(#function)
    self.close()
  }

  mutating func close() {
    log(#function)

    // stop audio playback
    self.running = false
    self.audio_pico.stop_stream()
    self.audio_i2s.enable(false)

    // discard pending data
    self.audio_pico.decoded_audio.clear()
    self.audio_pico.sbc_frame_size = 0
    self.audio_pico.sbc_frames.clear()
  }
}
