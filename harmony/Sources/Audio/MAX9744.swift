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

struct MAX9744: ~Copyable {
  static let i2cAddress: UInt8 = 0x4B // 7 bit address
  static let absoluteVolumeControlRegisterAddress: UInt8 = 0x0
  
  static let modulationControlRegisterAddress: UInt8 = 0x1
  static let filterlessModulationBitPattern: UInt8 = 0x0
  static let pwmModulationBitPattern: UInt8 = 0x1

  static let incrementalVolumeControlRegisterAddress: UInt8 = 0x3
  static let increaseVolumeBitPattern: UInt8 = 0x4
  static let decreaseVolumeBitPattern: UInt8 = 0x5

  var i2c: i2c_inst_t

  init(i2c: i2c_inst_t) {
    self.i2c = i2c
  }
}

extension MAX9744 {
  static func validAddress(_ address: UInt8) -> Bool {
    switch address {
    case Self.absoluteVolumeControlRegisterAddress: true
    case Self.filterlessModulationBitPattern: true
    case Self.incrementalVolumeControlRegisterAddress: true
    default: false
    }
  }

  mutating func write(address: UInt8, value: UInt8) {
    precondition(Self.validAddress(address))
    var data = (address << 6) | value
    log("attempting to write \(hex: data)")
    let size = MemoryLayout.size(ofValue: data)
    let result = i2c_write_blocking(
      &self.i2c,
      Self.i2cAddress,
      &data,
      size,
      false)
    precondition(result == size, "I2C write failed")
  }

  mutating func read(address: UInt8) -> UInt8 {
    precondition(Self.validAddress(address))
    var data = address << 6
    let size = MemoryLayout.size(ofValue: data)
    let readResult = i2c_read_blocking(
      &self.i2c,
      Self.i2cAddress,
      &data,
      size,
      false)
    precondition(readResult == size, "I2C read failed")
    return data
  }
}

extension MAX9744 {
  /// 6 bit value ranging from 0 (mute) to 63 (+ 9.5 dB)
  mutating func set(rawVolume: UInt8) {
    precondition(0 <= rawVolume && rawVolume <= 63)
    self.write(
      address: Self.absoluteVolumeControlRegisterAddress,
      value: rawVolume)
  }

  enum ModulationMode {
    case filterless
    case pwm
  }

  mutating func set(moduluationMode: ModulationMode) {
    let modulationBitPattern = switch moduluationMode {
      case .filterless: Self.filterlessModulationBitPattern
      case .pwm: Self.pwmModulationBitPattern
    }
    self.write(
      address: Self.modulationControlRegisterAddress,
      value: modulationBitPattern)
  }

  mutating func increaseVolume() {
    self.write(
      address: Self.incrementalVolumeControlRegisterAddress,
      value: Self.increaseVolumeBitPattern)
  }

  mutating func decreaseVolume() {
    self.write(
      address: Self.incrementalVolumeControlRegisterAddress,
      value: Self.decreaseVolumeBitPattern)
  }
}
