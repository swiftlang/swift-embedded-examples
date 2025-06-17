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

struct QuadratureEncoder: ~Copyable {
  private var previousValue: Int32

  var pinA: UInt32
  var pinB: UInt32

  var pio: UInt32
  var pioSm: UInt32
  var pioHw: PIO
  var pioOffset: UInt32

  init(
    pinA: UInt32,
    pinB: UInt32,
    // FIXME: change to `PIO`
    pio: UInt32,
    pioSm: UInt32
  ) {
    self.previousValue = 0
    precondition(pinA + 1 == pinB, "A and B pins must be sequential")
    self.pinA = pinA
    self.pinB = pinB
    self.pio = pio
    self.pioSm = pioSm
    self.pioHw =
      switch self.pio {
      case 0: _pio0()
      case 1: _pio1()
      default: fatalError("Invalid PIO index")
      }
    self.pioOffset = 0

    // FIXME: lower quadrature_encoder_program_init max_step_rate
    pio_sm_claim(self.pioHw, self.pioSm)
    self.pioOffset = withUnsafePointer(to: quadrature_encoder_program) {
      UInt32(pio_add_program(self.pioHw, $0))
    }
    quadrature_encoder_program_init(self.pioHw, self.pioSm, self.pinA, 0)
  }

  deinit {
    withUnsafePointer(to: quadrature_encoder_program) {
      pio_remove_program_and_unclaim_sm($0, self.pioHw, self.pioSm, self.pioOffset)
    }

    gpio_deinit(self.pinA)
    gpio_deinit(self.pinB)
  }
}

extension QuadratureEncoder {
  mutating func value() -> Int32 {
    let value = quadrature_encoder_get_count(self.pioHw, self.pioSm)
    self.previousValue = value
    return value
  }

  mutating func delta() -> Int32 {
    let value = quadrature_encoder_get_count(self.pioHw, self.pioSm)
    // NOTE: Thanks to two's complement arithmetic `delta`` will always be
    // correct even when `value`` wraps around `Int32.max` / `Int32.min`.
    let delta = value &- self.previousValue
    self.previousValue = value
    return delta
  }
}
