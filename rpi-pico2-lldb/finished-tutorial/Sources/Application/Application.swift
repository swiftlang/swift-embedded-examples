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
import Support

// Board LED
let LED_PIN: UInt32 = 25

// I2C pins
let I2C0_SDA: UInt32 = 16
let I2C0_SCL: UInt32 = 17
let I2C1_SDA: UInt32 = 26
let I2C1_SCL: UInt32 = 27

@inline(__always)
private func delay(_ n: UInt32) {
  var i = n
  while i > 0 {
    nop()
    i &-= 1
  }
}

@_cdecl("putchar")
public func putchar(_ value: CInt) -> CInt {
  nop()
  return 0
}

// On-board LED turned on continuously on success
private func ledSuccess() {
  ledSet(true)
  while true {
    nop()
  }
}

private func blinkFailForever(_ code: UInt32) -> Never {
  let n = max(1, min(code, 20))
  while true {
    var i: UInt32 = 0
    while i < n {
      ledSet(true)
      delay(600_000)
      ledSet(false)
      delay(600_000)
      i &+= 1
    }
    delay(4_000_000)
  }
}

private func enableInterfaces() {
    // Take required peripherals out of reset
    //
    // RP2350 datasheet section 7.5 Subsystem resets:
    //    "When reset, components are held in reset at power-up.
    //    To use the component, software must deassert the reset."
    resets.reset.modify { rw in
      rw.raw.pads_bank0 = 0
      rw.raw.io_bank0 = 0
      rw.raw.i2c0 = 0
      rw.raw.i2c1 = 0
    }

    // Wait until reset_done shows they’re out of reset
    while resets.reset_done.read().raw.pads_bank0 == 0 {}
    while resets.reset_done.read().raw.io_bank0 == 0 {}
    while resets.reset_done.read().raw.i2c0 == 0 {}
    while resets.reset_done.read().raw.i2c1 == 0 {}

    // LED pin init
    configureLedPinSIO(LED_PIN)
    ledSet(false)

    // I2C pins config
    // In this config, we use external pull-ups
    let useInternalPullUps = false
    configureI2CPin(I2C0_SDA, enableInternalPullUp: useInternalPullUps)
    configureI2CPin(I2C0_SCL, enableInternalPullUp: useInternalPullUps)
}

@main
struct Application {
  static func main() {
    enableInterfaces()
    let controller = I2CController(I2C0_SCL: I2C0_SCL, I2C0_SDA: I2C0_SDA)
    let memory = MemoryI2CDevice(I2C1_SCL: I2C1_SCL, I2C1_SDA: I2C1_SDA)

    // We first save a byte in our I2C memory.
    // Then, we read the saved byte, to check that everything works.

    // Configure I2C target (address of memory)
    controller.configBus(targetPeripheral: 0x42)

    // Controller sends byte to I2C memory
    let txByte: UInt8 = 0xA5
    controller.writeByte(txByte)

    // Memory I2C peripheral reads & saves byte, incremented
    memory.receiveBytesToMemory()

    // Controller requests byte from I2C Memory
    controller.requestByteFromMemory()

    // Memory serves the incremented byte
    memory.serveBytesFromMemory()

    // Controller receives the byte
    let readValue = controller.receiveRequestedBytesFromMemory()

    // Validate the transmission
    if readValue != nil && readValue! == txByte + 1 {
      ledSuccess()
    } else {
      blinkFailForever(2)
    }
  }
}