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

import STM32F7X6

extension RCC {
  func enableGPIOPortClock(_ port: GPIOA.Port) {
    switch port {
    case .a: self.ahb1enr.modify { $0.raw.gpioaen = 1 }
    case .b: self.ahb1enr.modify { $0.raw.gpioben = 1 }
    case .c: self.ahb1enr.modify { $0.raw.gpiocen = 1 }
    case .d: self.ahb1enr.modify { $0.raw.gpioden = 1 }
    case .e: self.ahb1enr.modify { $0.raw.gpioeen = 1 }
    case .f: self.ahb1enr.modify { $0.raw.gpiofen = 1 }
    case .g: self.ahb1enr.modify { $0.raw.gpiogen = 1 }
    case .h: self.ahb1enr.modify { $0.raw.gpiohen = 1 }
    case .i: self.ahb1enr.modify { $0.raw.gpioien = 1 }
    case .j: self.ahb1enr.modify { $0.raw.gpiojen = 1 }
    case .k: self.ahb1enr.modify { $0.raw.gpioken = 1 }
    }
  }

  func enableUARTClock(_ uartNum: UInt8) {
    switch uartNum {
    case 1: self.apb2enr.modify { $0.raw.usart1en = 1 }
    case 2: self.apb1enr.modify { $0.raw.usart2en = 1 }
    case 3: self.apb1enr.modify { $0.raw.usart3en = 1 }
    case 4: self.apb1enr.modify { $0.raw.uart4en = 1 }
    case 5: self.apb1enr.modify { $0.raw.uart5en = 1 }
    case 6: self.apb2enr.modify { $0.raw.usart6en = 1 }
    case 7: self.apb1enr.modify { $0.raw.uart7en = 1 }
    case 8: self.apb1enr.modify { $0.raw.uart8en = 1 }
    default: fatalError("Invalid UART number")
    }
  }

  func enableI2CClock(_ i2cNum: UInt8) {
    switch i2cNum {
    case 1: self.apb1enr.modify { $0.raw.i2c1en = 1 }
    case 2: self.apb1enr.modify { $0.raw.i2c2en = 1 }
    case 3: self.apb1enr.modify { $0.raw.i2c3en = 1 }
    case 4: self.apb1enr.modify { $0.raw.i2c4en = 1 }
    default: fatalError("Invalid I2C number")
    }
  }

  func enableSPIClock(_ spiNum: UInt8) {
    switch spiNum {
    case 1: self.apb2enr.modify { $0.raw.spi1en = 1 }
    case 2: self.apb1enr.modify { $0.raw.spi2en = 1 }
    case 3: self.apb1enr.modify { $0.raw.spi3en = 1 }
    case 4: self.apb2enr.modify { $0.raw.spi4en = 1 }
    case 5: self.apb2enr.modify { $0.raw.spi5en = 1 }
    case 6: self.apb2enr.modify { $0.raw.spi6en = 1 }
    default: fatalError("Invalid SPI number")
    }
  }
}
