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

struct RGB8Pixel {
  var red: UInt8
  var green: UInt8
  var blue: UInt8
}

extension RGB8Pixel {
  init(_ pixel: SPINeoPixelGRB64Pixel) {
    self.red = .rawChannel(neoPixelChannel: pixel.red)
    self.green = .rawChannel(neoPixelChannel: pixel.green)
    self.blue = .rawChannel(neoPixelChannel: pixel.blue)
  }
}

extension RGB8Pixel {
  @inline(never)
  init(_ pixel: HSV8Pixel) {
    // Fast path: gray scale.
    guard pixel.saturation != 0 else {
      self.red = pixel.value
      self.green = pixel.value
      self.blue = pixel.value
      return
    }

    // Slow path: compute each color component.
    var hue = Float32(pixel.hue) / Float32(UInt8.max)
    let saturation = Float32(pixel.saturation) / Float32(UInt8.max)
    let value = Float32(pixel.value) / Float32(UInt8.max)

    let clampedHue = max(0, min(1 - .ulpOfOne, hue))
    let scaledHue = clampedHue * 6
    let sector = UInt8(scaledHue)
    hue = scaledHue - Float32(sector)

    let fractionalChannel1 = value * (1.0 - (saturation * (1.0 - 0.0)))
    let fractionalChannel2 = value * (1.0 - (saturation * (hue - 0.0)))
    let fractionalChannel3 = value * (1.0 - (saturation * (1.0 - hue)))

    let channel1 = UInt8(fractionalChannel1 * Float32(UInt8.max))
    let channel2 = UInt8(fractionalChannel2 * Float32(UInt8.max))
    let channel3 = UInt8(fractionalChannel3 * Float32(UInt8.max))

    switch sector {
    case 0:
      self.red = pixel.value
      self.green = channel3
      self.blue = channel1
    case 1:
      self.red = channel2
      self.green = pixel.value
      self.blue = channel1
    case 2:
      self.red = channel1
      self.green = pixel.value
      self.blue = channel3
    case 3:
      self.red = channel1
      self.green = channel2
      self.blue = pixel.value
    case 4:
      self.red = channel3
      self.green = channel1
      self.blue = pixel.value
    case 5:
      self.red = pixel.value
      self.green = channel1
      self.blue = channel2
    default:
      fatalError("Unreachable")
    }
  }
}

extension RGB8Pixel {
  static let gammaCorrection: [UInt8] = [
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2,
    2, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 5, 5, 5,
    5, 6, 6, 6, 6, 7, 7, 7, 7, 8, 8, 8, 9, 9, 9, 10,
    10, 10, 11, 11, 11, 12, 12, 13, 13, 13, 14, 14, 15, 15, 16, 16,
    17, 17, 18, 18, 19, 19, 20, 20, 21, 21, 22, 22, 23, 24, 24, 25,
    25, 26, 27, 27, 28, 29, 29, 30, 31, 32, 32, 33, 34, 35, 35, 36,
    37, 38, 39, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 50,
    51, 52, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 66, 67, 68,
    69, 70, 72, 73, 74, 75, 77, 78, 79, 81, 82, 83, 85, 86, 87, 89,
    90, 92, 93, 95, 96, 98, 99, 101, 102, 104, 105, 107, 109, 110, 112, 114,
    115, 117, 119, 120, 122, 124, 126, 127, 129, 131, 133, 135, 137, 138, 140,
    142,
    144, 146, 148, 150, 152, 154, 156, 158, 160, 162, 164, 167, 169, 171, 173,
    175,
    177, 180, 182, 184, 186, 189, 191, 193, 196, 198, 200, 203, 205, 208, 210,
    213,
    215, 218, 220, 223, 225, 228, 231, 233, 236, 239, 241, 244, 247, 249, 252,
    255,
  ]

  var gammaCorrected: Self {
    RGB8Pixel(
      red: Self.gammaCorrection[Int(self.red)],
      green: Self.gammaCorrection[Int(self.green)],
      blue: Self.gammaCorrection[Int(self.blue)])
  }
}

extension RGB8Pixel: Equatable {}
