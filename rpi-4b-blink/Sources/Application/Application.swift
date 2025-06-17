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
struct GPSET1 {
  @ReadWrite(bits: 10..<11, as: Bool.self)
  var set: SET
}

@Register(bitWidth: 32)
struct GPCLR1 {
  @ReadWrite(bits: 10..<11, as: Bool.self)
  var clear: CLEAR
}

@Register(bitWidth: 32)
struct GPFSEL4 {
  @ReadWrite(bits: 6..<7, as: Bool.self)
  var fsel42b1: FSEL42b1
  @ReadWrite(bits: 7..<8, as: Bool.self)
  var fsel42b2: FSEL42b2
  @ReadWrite(bits: 8..<9, as: Bool.self)
  var fsel42b3: FSEL42b3
}

@RegisterBlock
struct GPIO {
  @RegisterBlock(offset: 0x200020)
  var gpset1: Register<GPSET1>
  @RegisterBlock(offset: 0x20002c)
  var gpclr1: Register<GPCLR1>
  @RegisterBlock(offset: 0x200010)
  var gpfsel4: Register<GPFSEL4>
}

let gpio = GPIO(unsafeAddress: 0xFE00_0000)

func setLedOutput() {
  gpio.gpfsel4.modify {
    // setFunction Select 42 (fsel42) to 001
    $0.fsel42b1 = true
    $0.fsel42b2 = false
    $0.fsel42b3 = false
  }
}

func ledOn() {
  gpio.gpset1.modify {
    $0.set = true
  }
}

func ledOff() {
  gpio.gpclr1.modify {
    $0.clear = true
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
