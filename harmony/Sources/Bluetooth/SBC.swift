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

enum SBCDecoder {
  typealias Callback = (
    _ data: UnsafeMutableBufferPointer<Int16>,
    _ num_channels: Int32,
    _ sample_rate: Int32
  ) -> Void

  static var context = btstack_sbc_decoder_bluedroid_t()
  static var instance: UnsafePointer<btstack_sbc_decoder_t>? = nil
  static var callback: Callback? = nil

  static func configure(mode: btstack_sbc_mode_t) {
    self.instance = btstack_sbc_decoder_bluedroid_init_instance(&context)

    func decode_callback(
      _ data: UnsafeMutablePointer<Int16>?,
      _ num_samples: Int32,
      _ num_channels: Int32,
      _ sample_rate: Int32,
      _ context: UnsafeMutableRawPointer?
    ) {
      let data = UnsafeMutableBufferPointer(
        start: data, count: Int(num_samples))
      Self.callback?(data, num_channels, sample_rate)
    }

    instance?.pointee.configure(&context, mode, decode_callback, nil)
  }

  static func decode_signed_16(
    mode: btstack_sbc_mode_t,
    packet_status_flag: UInt8,
    buffer: UnsafeRawBufferPointer,
    callback: Callback
  ) {
    guard let instance = Self.instance else {
      preconditionFailure("Must call configure prior to decode_signed_16")
    }

    return withoutActuallyEscaping(callback) {
      Self.callback = $0
      instance.pointee.decode_signed_16(
        &Self.context,
        packet_status_flag,
        buffer.baseAddress,
        UInt16(buffer.count))
      Self.callback = nil
    }
  }
}
