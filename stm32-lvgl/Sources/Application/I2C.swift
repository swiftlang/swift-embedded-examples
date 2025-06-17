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
import Registers
import Support

struct I2C {
  let i2c: I2C1
  let deviceAddress: UInt8

  enum Interface: Int {
    case i2c1 = 0
    case i2c2
    case i2c3
    case i2c4
  }

  init(interface: Interface, deviceAddress: UInt8) {
    self.deviceAddress = deviceAddress

    switch interface {
    case .i2c1:
      self.i2c = i2c1
      rcc.apb1enr.modify { $0.raw.i2c1en = 1 }  // Enable clock
    case .i2c2:
      self.i2c = i2c2
      rcc.apb1enr.modify { $0.raw.i2c2en = 1 }  // Enable clock
    case .i2c3:
      self.i2c = i2c3
      rcc.apb1enr.modify { $0.raw.i2c3en = 1 }  // Enable clock
    case .i2c4:
      self.i2c = i2c4
      rcc.apb1enr.modify { $0.raw.i2c4en = 1 }  // Enable clock
    }

    // Reset I2C peripheral
    i2c.cr1.write { $0.raw.pe = 0 }

    // Configure I2C timing for 100KHz (based on 50MHz APB1 clock)
    i2c.timingr.write {
      $0.raw.presc = 0x09  // Prescaler
      $0.raw.scldel = 0x04  // Data setup time
      $0.raw.sdadel = 0x02  // Data hold time
      $0.raw.sclh = 0x0F  // SCL high period
      $0.raw.scll = 0x13  // SCL low period
    }

    // Enable I2C peripheral
    i2c.cr1.modify {
      $0.raw.pe = 1  // Enable peripheral
      $0.raw.anfoff = 0  // Analog filter enabled
      $0.raw.dnf = 0  // Digital filter disabled
    }
  }

  func write(data: [UInt8]) -> Bool {
    // Wait until I2C is not busy
    while i2c.isr.read().raw.busy == 1 { /* busy wait */  }

    // Set slave address
    i2c.cr2.write {
      $0.raw.sadd = UInt32(deviceAddress) << 1  // 7-bit address, shifted left by 1
      $0.raw.nbytes = UInt32(data.count)
      $0.raw.autoend = 1  // Automatic end mode
      $0.raw.start = 1  // Generate start condition
      $0.raw.rd_wrn = 0  // Write transfer
    }

    // Send data bytes
    for byte in data {
      // Wait until TXIS is set (transmit register empty)
      while i2c.isr.read().raw.txis == 0 {
        // Check for errors
        let isr = i2c.isr.read().raw
        if isr.nackf == 1 {
          // NACK received
          i2c.icr.write { $0.raw.nackcf = 1 }  // Clear NACK flag
          return false
        }
      }

      // Write data to TXDR
      i2c.txdr.write { $0.raw.txdata = UInt32(byte) }
    }

    // Wait for transfer complete
    while i2c.isr.read().raw.tc == 0 && i2c.isr.read().raw.tcr == 0 && i2c.isr.read().raw.stopf == 0 {
      // Check for errors
      if i2c.isr.read().raw.nackf == 1 {
        i2c.icr.write { $0.raw.nackcf = 1 }  // Clear NACK flag
        return false
      }
    }

    // Clear flags
    let isr = i2c.isr.read().raw
    i2c.icr.write {
      $0.raw.stopcf = isr.stopf
      $0.raw.nackcf = isr.nackf
    }

    return true
  }

  func read(buffer: inout [UInt8], length: Int) -> Bool {
    // Wait until I2C is not busy
    while i2c.isr.read().raw.busy == 1 { /* busy wait */  }

    // Set slave address and read operation
    i2c.cr2.write {
      $0.raw.sadd = UInt32(deviceAddress) << 1  // 7-bit address, shifted left by 1
      $0.raw.nbytes = UInt32(length)
      $0.raw.autoend = 1  // Automatic end mode
      $0.raw.rd_wrn = 1  // Read transfer
      $0.raw.start = 1  // Generate start condition
    }

    // Read data
    for i in 0..<length {
      // Wait until RXNE is set (receive register not empty)
      while i2c.isr.read().raw.rxne == 0 {
        // Check for errors
        let isr = i2c.isr.read().raw
        if isr.nackf == 1 {
          // NACK received
          i2c.icr.write { $0.raw.nackcf = 1 }  // Clear NACK flag
          return false
        }
      }

      // Read data from RXDR
      buffer[i] = UInt8(i2c.rxdr.read().raw.rxdata & 0xFF)
    }

    // Wait for transfer complete
    while i2c.isr.read().raw.tc == 0 && i2c.isr.read().raw.stopf == 0 { /* busy wait */  }

    // Clear flags
    let isr = i2c.isr.read().raw
    i2c.icr.write {
      $0.raw.stopcf = isr.stopf
      $0.raw.nackcf = isr.nackf
    }

    return true
  }
}
