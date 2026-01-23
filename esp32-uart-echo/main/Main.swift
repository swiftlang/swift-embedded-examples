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

// The code will echo the input from the UART back to the sender.
@_cdecl("app_main")
func main() {
  print("Hello from Swift on ESP32-C6!")  // This will be printed to the console

  // Initialize UART1 with TX on GPIO20 and RX on GPIO19
  let uart = Uart(portNum: 1, txPin: 20, rxPin: 19)

  uart.redirectStdio()

  while let line = readLine(strippingNewline: false) {
    print(line, terminator: "")
  }
}
