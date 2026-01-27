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
import MMIO

// GPIO config (LED via SIO)
func configureLedPinSIO(_ pin: UInt32) {
  // Pad electrical properties
  pads_bank0.gpio[pin].modify { rw in
    rw.raw.od = 0        // outputs enabled
    rw.raw.ie = 0        // input disabled
    rw.raw.pue = 0       // no pull-up
    rw.raw.pde = 0       // no pull-down
    rw.raw.schmitt = 1
    rw.raw.slewfast = 0
  }

  // Mux to SIO
  io_bank0.gpio[pin].gpio_ctrl.modify { rw in
    rw.raw.funcsel = 0x5
  }

  // Remove pad isolation
  pads_bank0.gpio[pin].modify { rw in
    rw.raw.iso = 0
  }

  // Enable output
  sio.gpio_oe_set.write { w in
    w.storage = 1 << pin
  }
}

@inline(__always)
func ledSet(_ on: Bool) {
  if on {
    sio.gpio_out_set.write { w in w.storage = 1 << LED_PIN }
  } else {
    sio.gpio_out_clr.write { w in w.storage = 1 << LED_PIN }
  }
}
