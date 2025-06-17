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
