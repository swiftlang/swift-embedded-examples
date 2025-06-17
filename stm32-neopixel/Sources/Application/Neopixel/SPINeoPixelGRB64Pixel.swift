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

struct SPINeoPixelGRB64Pixel {
  var green: UInt64
  var red: UInt64
  var blue: UInt64
}

extension SPINeoPixelGRB64Pixel {
  static let reset = Self(green: 0, red: 0, blue: 0)
}

extension SPINeoPixelGRB64Pixel {
  init(_ pixel: RGB8Pixel) {
    self.green = .neoPixelChannel(rawChannel: pixel.green)
    self.red = .neoPixelChannel(rawChannel: pixel.red)
    self.blue = .neoPixelChannel(rawChannel: pixel.blue)
  }
}

extension UInt64 {
  static func neoPixelChannel(rawChannel: UInt8) -> Self {
    var rawChannel = rawChannel
    var neoPixelChannel: Self = 0
    for _ in 0..<rawChannel.bitWidth {
      let bit: SPINeoPixelBit = (rawChannel & 0x1) == 1 ? .one : .zero
      rawChannel >>= 1
      neoPixelChannel <<= 8
      neoPixelChannel |= Self(bit.rawValue)
    }
    return neoPixelChannel
  }
}

extension UInt8 {
  static func rawChannel(neoPixelChannel: UInt64) -> Self {
    var neoPixelChannel = neoPixelChannel
    var rawChannel: Self = 0
    for _ in 0..<rawChannel.bitWidth {
      let bit: UInt8
      switch UInt8(neoPixelChannel & 0xff) {
      case SPINeoPixelBit.zero.rawValue: bit = 0
      case SPINeoPixelBit.one.rawValue: bit = 1
      default:
        assertionFailure()
        bit = 0
      }
      neoPixelChannel >>= 8
      rawChannel <<= 1
      rawChannel |= UInt8(bit)
    }
    return rawChannel
  }
}
