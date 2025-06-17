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

import MMIO
import Support

@Register(bitWidth: 32)
struct GIOIODIR {
  @ReadWrite(bits: 9..<10, as: Bool.self)
  var direction: DIRECTION
}

@Register(bitWidth: 32)
struct GIODATA {
  @ReadWrite(bits: 9..<10, as: Bool.self)
  var value: VALUE
}

@RegisterBlock
struct GPIO {
  @RegisterBlock(offset: 0x00008)
  var gioiodir: Register<GIOIODIR>
  @RegisterBlock(offset: 0x00004)
  var giodata: Register<GIODATA>
}

let gpio = GPIO(unsafeAddress: 0x10_7d51_7c00)

func setLedOutput() {
  gpio.gioiodir.modify {
    $0.direction = false  // 0 is output, 1 is input
  }
}

func ledOn() {
  gpio.giodata.modify {
    $0.value = true  // pin on
  }
}

func ledOff() {
  gpio.giodata.modify {
    $0.value = false  // pin off
  }
}

func delay() {
  for _ in 1..<1_000_000 { nop() }
}

@main
struct Application {
  static func main() {
    setLedOutput()
    while true {
      ledOn()
      delay()
      ledOff()
      delay()
    }
  }
}
