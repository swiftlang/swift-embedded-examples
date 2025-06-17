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
import Support

@main
public struct Application {
  public static func main() {
    // MARK: Clock configuration
    rcc.ahb1enr.modify { rw in
      // Enable AHB clock to port A
      rw.raw.gpioaen = 1
      // Enable AHB clock to port B
      rw.raw.gpioben = 1
    }
    // Enable APB clock to usart 1
    rcc.apb2enr.modify { $0.raw.usart1en = 1 }

    // MARK: Peripheral Configuration
    // Configure A9 as UART1 TX
    // Put Pin A9 into alternate function mode
    gpioa.moder.modify { $0.raw.moder9 = 0b10 }
    // Put Pin A9 into push pull
    gpioa.otyper.modify { $0.raw.ot9 = 0b0 }
    // Put Pin A9 into low speed
    gpioa.ospeedr.modify { $0.raw.ospeedr9 = 0b00 }
    // Disable pull up/down on Pin A9
    gpioa.pupdr.modify { $0.raw.pupdr9 = 0b00 }
    // Set alternate function usart1 on Pin A9
    gpioa.afrh.modify { $0.raw.afrh9 = 0b0111 }

    // Configure B7 as UART1 RX
    // Put Pin B7 into alternate function mode
    gpiob.moder.modify { $0.raw.moder7 = 0b10 }
    // Put Pin B7 into push pull
    gpiob.otyper.modify { $0.raw.ot7 = 0b0 }
    // Put Pin B7 into low speed
    gpiob.ospeedr.modify { $0.raw.ospeedr7 = 0b00 }
    // Disable pull up/down on Pin B7
    gpiob.pupdr.modify { $0.raw.pupdr7 = 0b00 }
    // Set alternate function usart1 on Pin B7
    gpiob.afrl.modify { $0.raw.afrl7 = 0b0111 }

    // Configure UART1
    // Set the baud rate to 115200 (by computing the divisor based on the 16Mhz
    // default post-reset CPU clock frequency)
    usart1.brr.modify { $0.raw.storage = 16_000_000 / 115200 }

    usart1.cr1.modify { rw in
      // Enable USART 1
      rw.raw.ue = 1
      // Enable RX
      rw.raw.re = 1
      // Enable TX
      rw.raw.te = 1
    }

    // MARK: Main Loop
    print("Hello Swift!")

    while true {
      waitRxBufferFull()
      let byte = rx()
      tx(value: byte)
      waitTxBufferEmpty()
      // My serial console does not cook newlines so pressing "enter" sends a
      // carriage return ('\r') to the device. If we naively echo this byte back
      // to the user, we will move the cursor back to the start of the line and
      // overwrite previous characters. Instead, if we receive a carriage
      // return, send it back followed by a newline ('\n').
      if byte == UInt8(ascii: "\r") {
        tx(value: UInt8(ascii: "\n"))
        waitTxBufferEmpty()
      }
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

func waitRxBufferFull() {
  // Spin while rx buffer empty
  while usart1.isr.read().raw.rxne == 0 {}
}

func rx() -> UInt8 {
  UInt8(usart1.rdr.read().raw.rdr_field)
}

@_cdecl("Default_Handler")
public func defaultHandler() {
  while true {}
}

@_cdecl("putchar")
public func putchar(_ value: CInt) -> CInt {
  waitTxBufferEmpty()
  tx(value: UInt8(value))
  waitTxBufferEmpty()
  return 0
}
