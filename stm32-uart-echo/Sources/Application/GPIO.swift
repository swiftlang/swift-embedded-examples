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

extension GPIOA {
  enum Mode: UInt32 {
    case input = 0x0
    case output = 0x1
    case alternateFunction = 0x2
    case analog = 0x3
  }

  enum OutputType: UInt32 {
    case pushPull = 0x0
    case openDrain = 0x1
  }

  enum OutputSpeed: UInt32 {
    case low = 0x0
    case medium = 0x1
    case high = 0x2
    case max = 0x3
  }

  enum Pull: UInt32 {
    case `none` = 0x0
    case up = 0x1
    case down = 0x2
  }

  struct Configuration {
    var mode: Mode
    var outputType: OutputType
    var outputSpeed: OutputSpeed
    var pull: Pull
    var alternateFunction: UInt32
  }

  func configure(pin: Int, as configuration: Configuration) {
    self.moder.modify { rw in
      rw.raw.storage.set(
        value: configuration.mode.rawValue,
        mask: 0b11,
        offset: pin * 2)
    }

    // Comprised of 16 x 1 bit fields.
    self.otyper.modify { rw in
      rw.raw.storage.set(
        value: configuration.outputType.rawValue,
        mask: 0b1,
        offset: pin)
    }

    // Comprised of 16 x 2 bit fields.
    self.ospeedr.modify { rw in
      rw.raw.storage.set(
        value: configuration.outputSpeed.rawValue,
        mask: 0b11,
        offset: pin * 2)
    }

    // Comprised of 16 x 2 bit fields.
    self.pupdr.modify { rw in
      rw.raw.storage.set(
        value: configuration.pull.rawValue,
        mask: 0b11,
        offset: pin * 2)
    }

    // Comprised of 16 x 4 bit fields, split across 2 registers.
    if pin < 8 {
      self.afrl.modify { rw in
        rw.raw.storage.set(
          value: configuration.alternateFunction,
          mask: 0b1111,
          offset: pin * 4)
      }
    } else {
      self.afrh.modify { rw in
        rw.raw.storage.set(
          value: configuration.alternateFunction,
          mask: 0b1111,
          offset: (pin - 8) * 4)
      }
    }
  }
}

extension UInt32 {
  fileprivate func get(mask: Self, offset: UInt8) -> Self {
    let mask = mask &<< offset
    return (self & mask) &>> offset
  }

  fileprivate mutating func set(value: Self, mask: Self, offset: Int) {
    let mask = mask &<< offset
    let oldValue: UInt32 = self & ~mask
    let newValue: UInt32 = (value &<< offset) & mask
    self = oldValue | newValue
  }
}
