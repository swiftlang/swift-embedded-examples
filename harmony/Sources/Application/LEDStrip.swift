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

struct LEDStrip: ~Copyable {
  var dataPin: UInt32
  var ledCount: Int

  var pio: UInt32
  var pioSm: UInt32
  var pioHw: PIO
  var pioOffset: UInt32

  init(
    dataPin: UInt32,
    ledCount: Int,
    // FIXME: change to `PIO`
    pio: UInt32,
    pioSm: UInt32
  ) {
    self.dataPin = dataPin
    self.ledCount = ledCount
    self.pio = pio
    self.pioSm = pioSm
    self.pioHw =
      switch self.pio {
      case 0: _pio0()
      case 1: _pio1()
      default: fatalError("Invalid PIO index")
      }
    self.pioOffset = 0

    pio_gpio_init(self.pioHw, self.dataPin)

    // FIXME: lower quadrature_encoder_program_init max_step_rate
    pio_sm_claim(self.pioHw, self.pioSm)
    self.pioOffset = withUnsafePointer(to: ws2812_program) {
      UInt32(pio_add_program(self.pioHw, $0))
    }
    ws2812_program_init(self.pioHw, self.pioSm, self.pioOffset, self.dataPin, 800000, false)
  }

  deinit {
    withUnsafePointer(to: ws2812_program) {
      pio_remove_program_and_unclaim_sm($0, self.pioHw, self.pioSm, self.pioOffset)
    }

    gpio_deinit(self.dataPin)
  }
}

extension LEDStrip {
  // mutating func putPixel(pixelGRB: UInt32) {
  //   pio_sm_put_blocking(self.pioHw, self.pioSm, pixelGRB << 8)
  // }

  // func urgb_u32(_ r: UInt8, _ g: UInt8, _ b: UInt8) -> UInt32 {
  //   (UInt32(r) << 8) | (UInt32(g) << 16) | UInt32(b)
  // }

  // mutating func patternSnakes(t: UInt32) {
  //   for i in 0..<UInt32(self.ledCount) {
  //     let x = (i + (t >> 1)) % 64
  //     if x < 10 {
  //       putPixel(pixelGRB: urgb_u32(0xff, 0, 0))
  //     } else if x >= 15 && x < 25 {
  //       putPixel(pixelGRB: urgb_u32(0, 0xff, 0))
  //     } else if x >= 30 && x < 40 {
  //       putPixel(pixelGRB: urgb_u32(0, 0, 0xff))
  //     } else {
  //       putPixel(pixelGRB: 0)
  //     }
  //   }
  // }

  mutating func setColor(red: UInt8, green: UInt8, blue: UInt8) {
    for _ in 0..<self.ledCount {
      let pixelValue = 
        (UInt32(red) << 16) |
        (UInt32(green) << 24) |
        (UInt32(blue) << 32)
      pio_sm_put_blocking(self.pioHw, self.pioSm, pixelValue)
    }
  }
}
