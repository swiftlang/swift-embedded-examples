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

#if STM32F746G_DISCOVERY

// I1 pin aka "Arduino D13" pin on STM32F746 Discovery Board
// https://www.st.com/resource/en/schematic_pack/mb1191-f746ngh6-c01_schematic.pdf
let ledConfig: (GPIOBank, GPIOPin) = (.i, 1)

#elseif NUCLEO_F103RB

// A5 pin aka "Arduino D13" pin on Nucleo-64 boards
// https://www.st.com/resource/en/user_manual/um1724-stm32-nucleo64-boards-mb1136-stmicroelectronics.pdf
let ledConfig: (GPIOBank, GPIOPin) = (.a, 5)

#else

#error("Unknown board")

#endif

@main
struct Main {
  static func main() {
    Board.initialize()

    while true {
      Board.ledOn()
      Board.delay(milliseconds: 100)
      Board.ledOff()
      Board.delay(milliseconds: 300)
    }
  }
}
