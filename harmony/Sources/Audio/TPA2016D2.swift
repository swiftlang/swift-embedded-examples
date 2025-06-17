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

func i2c_init() {
    i2c_init(&i2c0_inst, 100 * 1000) // 400kHz "Fast Mode"
    gpio_set_function(UInt32(PICO_DEFAULT_I2C_SDA_PIN), GPIO_FUNC_I2C)
    gpio_set_function(UInt32(PICO_DEFAULT_I2C_SCL_PIN), GPIO_FUNC_I2C)
    gpio_pull_up(UInt32(PICO_DEFAULT_I2C_SDA_PIN))
    gpio_pull_up(UInt32(PICO_DEFAULT_I2C_SCL_PIN))

    // I2C reserves some addresses for special purposes. We exclude these from the scan.
    // These are any addresses of the form 000 0xxx or 111 1xxx
    func reserved_addr(_ addr: UInt8) -> Bool{
      return (addr & 0x78) == 0 || (addr & 0x78) == 0x78
    }

    log("\nI2C Bus Scan")
    log("  0 1 2 3 4 5 6 7 8 9 A B C D E F")
    for addr in UInt8(0) ..< (1 << 7) {
      if addr.isMultiple(of: 16) {
        log("\(addr >> 4) ", terminator: "")
      }

      // Perform a 1-byte dummy read from the probe address. If a slave
      // acknowledges this address, the function returns the number of bytes
      // transferred. If the address byte is ignored, the function returns
      // -1.

      // Skip over any reserved addresses.
      var rxdata: UInt8 = 0      
      let ret = if reserved_addr(addr) {
          Int32(PICO_ERROR_GENERIC.rawValue)
        } else {
          i2c_read_blocking(&i2c0_inst, addr, &rxdata, 1, false)
        }

      log(ret < 0 ? "." : "@", terminator: addr % 16 == 15 ? "\n" : " ")
    }
    log("Done.\n")
}

struct TPA2016D2: ~Copyable {
  static let address: UInt8 = 0x58 // 7 bit address
  static let IC_FUNCTION_CONTROL: UInt8 = 0x1
  static let AGC_ATTACK_CONTROL: UInt8 = 0x2
  static let AGC_RELEASE_CONTROL: UInt8 = 0x3
  static let AGC_HOLD_TIME_CONTROL: UInt8 = 0x4
  static let AGC_FIXED_GAIN_CONTROL: UInt8 = 0x5
  static let AGC_CONTROL_0: UInt8 = 0x6
  static let AGC_CONTROL_1: UInt8 = 0x7

  var i2c: i2c_inst_t
  
  init(i2c: i2c_inst_t) {
    self.i2c = i2c

    for r in UInt8(0x1) ... 0x7 {
      log("Register \(hex: r); read \(hex: self.read(address: r))")
    }

    // Immediately configure the amp to our desired defaults.
    // Disable AGC (Automatic Gain Control).
    self.write(address: Self.AGC_CONTROL_1, value: 0x0)
    // Disable Output Limiter
    self.write(address: Self.AGC_CONTROL_0, value: 1 << 7)
    // Set the attack time to the fastest setting (0.1067 ms per step)
    self.write(address: Self.AGC_ATTACK_CONTROL, value: 1)
    // Set the release time to the fastest setting (0.0137 s per step)
    self.write(address: Self.AGC_RELEASE_CONTROL, value: 1)
    // Disable the hold time entirely
    self.write(address: Self.AGC_HOLD_TIME_CONTROL, value: 0)
  }
}

extension TPA2016D2 {
  mutating func write(address: UInt8, value: UInt8) {
    var combined: UInt16 = (UInt16(value) << 8) | UInt16(address)
    let result = i2c_write_blocking(
      &self.i2c,
      Self.address,
      &combined,
      MemoryLayout.size(ofValue: combined),
      false)
    precondition(result == 2, "I2C write failed")
    // log("Register \(hex: address); wrote \(hex: value) - read \(hex: self.read(address: address))")
  }

  mutating func read(address: UInt8) -> UInt8 {
    var data = address
    let writeResult = i2c_write_blocking(&self.i2c, Self.address, &data, 1, false)
    precondition(writeResult == 1, "I2C write failed")
    let readResult = i2c_read_blocking(&self.i2c, Self.address, &data, 1, false)
    precondition(readResult == 1, "I2C read failed")
    return data
  }
}

extension TPA2016D2 {
  // scale from 0 to 255
  mutating func set(gain: UInt8) {
    precondition(0 <= gain && gain <= 30)
    self.write(address: Self.AGC_FIXED_GAIN_CONTROL, value: gain)
  }
 
  mutating func mute(_ mute: Bool) {
    var value = self.read(address: Self.IC_FUNCTION_CONTROL)
    value = mute ? value | (1 << 5) : value & ~(1 << 5)
    self.write(address: Self.IC_FUNCTION_CONTROL, value: value)
  }
}
