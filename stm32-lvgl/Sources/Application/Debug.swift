//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift open source project
//
// Copyright (c) 2025 Apple Inc. and the Swift project authors.
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
//
//===----------------------------------------------------------------------===//

import Registers
import Support

extension Main {
  static func initDebug() {
    // Keep clocks going when we WFI
    dbgmcu.cr.modify { $0.raw.dbg_standby = 1 }
  }

  static func initUartOutput() {
    // A9 is UART1 TX, which is relayed by ST-LINK over USB

    // Clock configuration
    rcc.ahb1enr.modify { $0.raw.gpioaen = 1 }  // Enable AHB clock to port A
    rcc.apb2enr.modify { $0.raw.usart1en = 1 }  // Enable APB clock to usart 1

    // Configure A9 as UART1 TX
    gpioa.moder.modify { $0.raw.moder9 = 0b10 }  // Put Pin A9 into alternate function mode
    gpioa.otyper.modify { $0.raw.ot9 = 0b0 }  // Put Pin A9 into push pull
    gpioa.ospeedr.modify { $0.raw.ospeedr9 = 0b00 }  // Put Pin A9 into low speed
    gpioa.pupdr.modify { $0.raw.pupdr9 = 0b00 }  // Disable pull up/down on Pin A9
    gpioa.afrh.modify { $0.raw.afrh9 = 0b0111 }  // Set alternate function usart1 on Pin A9

    // Configure UART1, set the baud rate to 115200 (we boot at 16 MHz)
    usart1.brr.modify { $0.raw.storage = 16_000_000 / 115_200 }

    usart1.cr1.modify {
      $0.raw.ue = 1  // Enable USART 1
      $0.raw.te = 1  // Enable TX
    }
  }
}

func waitTxBufferEmpty() {
  // Spin while tx buffer not empty
  while usart1.isr.read().raw.txe == 0 {}
}

func tx(value: UInt8) {
  usart1.tdr.write { $0.raw.tdr_field = UInt32(value) }
}

@_cdecl("putchar")
public func putchar(_ value: CInt) -> CInt {
  waitTxBufferEmpty()
  tx(value: UInt8(value))
  waitTxBufferEmpty()
  return 0
}

func log(_ s: String) {
  let n = uptimeInMs / 1000
  var m = String(uptimeInMs % 1000)
  while m.utf8.count < 3 { m = "0" + m }
  print("[\(n).\(m)] " + s)
}
