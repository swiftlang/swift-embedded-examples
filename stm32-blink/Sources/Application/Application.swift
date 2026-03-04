//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift open source project
//
// Copyright (c) 2023 Apple Inc. and the Swift project authors.
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
//
//===----------------------------------------------------------------------===//

import STM32F7X6
import Support

// I1 pin aka "Arduino D13" pin on STM32F746 Discovery Board
// https://www.st.com/resource/en/schematic_pack/mb1191-f746ngh6-c01_schematic.pdf
// let ledConfig: (GPIOBank, GPIOPin) = (.i, 1)

@main
struct Application {
  static func main() {
    // MARK: Clock configuration
    rcc.ahb1enr.modify { rw in
      // Enable AHB clock to port I
      rw.raw.gpioien = 1
    }

    // MARK: Peripheral Configuration
    // Configure I1 as GPIO Out
    // Put Pin I1 into output mode
    gpioi.moder.modify { $0.raw.moder1 = 0b1 }
    // Put Pin I1 into push pull
    gpioi.otyper.modify { $0.raw.ot1 = 0b0 }
    // Put Pin I1 into low speed
    gpioi.ospeedr.modify { $0.raw.ospeedr1 = 0b00 }
    // Enable pull down on Pin I1
    gpioi.pupdr.modify { $0.raw.pupdr1 = 0b10 }

    var enable = false
    while true {
      // Enable/Disable LED
      gpioi.odr.modify { rw in
        rw.raw.odr1 = enable ? 1 : 0
      }
      enable.toggle()
      delay(milliseconds: 100)
    }
  }
}

func delay(milliseconds: Int) {
  for _ in 0..<10_000 * milliseconds {
    nop()
  }
}
