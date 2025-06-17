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

struct AnalyzedAudioBuffer: ~Copyable {
  var enableMagnet: Bool
  var buffer: AudioBuffer
}

struct AudioAnalyzer: ~Copyable {
  // FIXME: add soft limit for time magnet can be enabled

  var fft_instance: arm_rfft_instance_q15
  // Used for both sample input and fft magnitude output
  var dataBuffer0: UnsafeMutableBufferPointer<q15_t>
  // Used for fft output
  var dataBuffer1: UnsafeMutableBufferPointer<q15_t>

  init() {
    let audioBufferCapacity = BUFFER_SAMPLE_CAPACITY
    let fftOutputBufferCapacity = BUFFER_SAMPLE_CAPACITY * 2 // real + complex
  
    self.fft_instance = arm_rfft_instance_q15()
    self.dataBuffer0 = .allocate(capacity: audioBufferCapacity)
    self.dataBuffer1 = .allocate(capacity: fftOutputBufferCapacity)
    // IMPORTANT: `bitReverseFlag` must be set. I don't understand why based on
    // the documentation
    arm_rfft_init_q15(&fft_instance, UInt32(audioBufferCapacity), 0, 1)
  }

  deinit {
    self.dataBuffer1.deallocate()
    self.dataBuffer0.deallocate()
  }

  mutating func run() {
    while true {
      guard let buffer = Application.shared.audioEngine.buffers.popFullBuffer() else { continue }

      /// Copy data from buffer to dataBuffer0 (because the fft will modify the data)
      precondition(self.dataBuffer0.update(from: buffer.storage).index == self.dataBuffer0.count)
      // Perform the fft using the data in dataBuffer0 and store the result in dataBuffer1
      arm_rfft_q15(&self.fft_instance, self.dataBuffer0.baseAddress, self.dataBuffer1.baseAddress)
      // Calculate the magnitude of the fft output in dataBuffer1 and store the result in dataBuffer0
      arm_cmplx_mag_q15(self.dataBuffer1.baseAddress, self.dataBuffer0.baseAddress, UInt32(self.dataBuffer0.count))

      // NOTE: This is probably wrong becasue buffer.storage is stereo data

      // Given we take an fft of audio data at 44100 Hz with a window of 512
      // samples, each output bin of the fft represents a 172 Hz range
      // (44100 Hz / 2 / 512 = ~172Hz)

      // 1 Khz 
      let lowend = 
        self.dataBuffer0[00] +
        self.dataBuffer0[01] +
        self.dataBuffer0[02] + 
        self.dataBuffer0[03] + 
        self.dataBuffer0[04] +
        self.dataBuffer0[05] +
        self.dataBuffer0[06] +
        self.dataBuffer0[07] +
        self.dataBuffer0[08] + 
        self.dataBuffer0[09] + 
        self.dataBuffer0[10] +
        self.dataBuffer0[10] +
        self.dataBuffer0[11] +
        self.dataBuffer0[12] + 
        self.dataBuffer0[13] + 
        self.dataBuffer0[14] +
        self.dataBuffer0[15] +
        self.dataBuffer0[16] +
        self.dataBuffer0[17] +
        self.dataBuffer0[18] + 
        self.dataBuffer0[19]



      let avg = lowend / 20

      let analyzedBuffer = AnalyzedAudioBuffer(
        enableMagnet: avg > (1 << 8),
        buffer: buffer)
      Application.shared.audioEngine.buffers.pushAnalyzedBuffer(analyzedBuffer)
    }
  }
}
