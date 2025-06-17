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

struct Resampler: ~Copyable {
  var channels: Int
  var context: btstack_resample_t

  init(channels: Int) {
    self.channels = channels
    self.context = btstack_resample_t()
    btstack_resample_init(&self.context, Int32(channels))
  }

  mutating func set(channels: Int) {
    self.channels = channels
    btstack_resample_init(&self.context, Int32(channels))
  }

  mutating func set(factor: UInt32) {
    btstack_resample_set_factor(&self.context, factor)
  }

  /// Resamples the given samples using the previously set resampling factor.
  ///
  /// Returns a slice of the temporary buffer that contains the resampled audio.
  mutating func resample(
    samples: UnsafeBufferPointer<Int16>,
    usingTemporaryBuffer buffer: UnsafeMutableBufferPointer<Int16>
  ) -> UnsafeMutableBufferPointer<Int16> {
    precondition(samples.count.isMultiple(of: self.channels))

    // FIXME: understand why this is not `samples.count / self.channels`
    // The documentation just calls this parameter `numFrames` which implies
    // the sample count should be divided by the channel count.
    let inputFrameCount = samples.count
    let resampledFrameCount = btstack_resample_block(
      &self.context,
      samples.baseAddress,
      UInt32(inputFrameCount),
      buffer.baseAddress)
    let resampledSampleCount = Int(resampledFrameCount) * self.channels
    return buffer.extracting(..<resampledSampleCount)
  }
}
