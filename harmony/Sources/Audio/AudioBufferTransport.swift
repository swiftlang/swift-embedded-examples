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

struct AudioBufferTransport: ~Copyable {
  var emptyBuffers: Ring<AudioBuffer>
  var fullBuffers: Ring<AudioBuffer>
  var analyzedBuffers: Ring<AnalyzedAudioBuffer>

  init(bufferCount: Int, bufferCapacity: Int) {
    // Ring buffer needs one extra slot to distinguish between empty and full.
    self.emptyBuffers = Ring<AudioBuffer>(capacity: bufferCount + 1)
    self.fullBuffers = Ring<AudioBuffer>(capacity: bufferCount + 1)
    self.analyzedBuffers = Ring<AnalyzedAudioBuffer>(capacity: bufferCount + 1)

    for _ in 0..<bufferCount {
      let buffer = AudioBuffer(capacity: bufferCapacity)
      self.pushEmptyBuffer(buffer)
    }
  }
}

extension AudioBufferTransport {
  mutating func pushEmptyBuffer(_ buffer: consuming AudioBuffer) {
    self.emptyBuffers.push(buffer)
  }

  mutating func popEmptyBuffer() -> AudioBuffer? {
    self.emptyBuffers.pop()
  }

  mutating func pushFullBuffer(_ buffer: consuming AudioBuffer) {
    self.fullBuffers.push(buffer)
  }

  mutating func popFullBuffer() -> AudioBuffer? {
    self.fullBuffers.pop()
  }

  mutating func pushAnalyzedBuffer(_ buffer: consuming AnalyzedAudioBuffer) {
    self.analyzedBuffers.push(buffer)
  }

  mutating func popAnalyzedBuffer() -> AnalyzedAudioBuffer? {
    self.analyzedBuffers.pop()
  }
}
