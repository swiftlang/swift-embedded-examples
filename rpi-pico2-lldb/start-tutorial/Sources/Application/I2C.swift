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

import RP2350
import Support
import MMIO

// I2C pin mux + pad config
func configureI2CPin(_ pin: UInt32, enableInternalPullUp: Bool) {
  pads_bank0.gpio[pin].modify { rw in
    rw.raw.od = 0
    rw.raw.ie = 1
    rw.raw.pue = enableInternalPullUp ? 1 : 0
    rw.raw.pde = 0
    rw.raw.schmitt = 1
    rw.raw.slewfast = 0
  }

  // Mux to I2C (funcsel 0x3)
  io_bank0.gpio[pin].gpio_ctrl.modify { rw in
    rw.raw.funcsel = 0x3
  }

  pads_bank0.gpio[pin].modify { rw in
    rw.raw.iso = 0
  }
}


// Wait for a condition to become true (blocking; may block forever)
@inline(__always)
func waitForCondition(_ cond: () -> Bool) {
  while true {
    if cond() { return }
    nop()
  }
}
