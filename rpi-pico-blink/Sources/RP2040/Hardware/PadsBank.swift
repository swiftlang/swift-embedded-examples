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

// swift-format-ignore-file

extension RP2040Hardware {
  public var padsBank0: PadsBank {
    PadsBank(unsafeAddress: 0x4001c000)
  }

  public struct PadsBank {
    let unsafeAddress: UInt

    init(unsafeAddress: UInt) {
      self.unsafeAddress = unsafeAddress 
    }

    public var voltageSelect: VoltageSelect {
      VoltageSelect(unsafeAddress: unsafeAddress + 0x0000)
    }

    public struct VoltageSelect {
      let unsafeAddress: UInt

      init(unsafeAddress: UInt) {
        self.unsafeAddress = unsafeAddress 
      }

      public enum Value: UInt8 {
        case voltage3_3 = 0
        case voltage1_8 = 1

        init(decoding value: UInt32) {
          self.init(rawValue: UInt8(value & (1 << 0)))!
        }

        var encoded: UInt32 {
          UInt32(self.rawValue)
        }
      }

      public var value: Value {
        get {
          Value(decoding: RP2040Hardware.read(UInt32.self, from: unsafeAddress))
        }
        set {
          RP2040Hardware.write(newValue.encoded, to: unsafeAddress)
        }
      }
    }

    public struct GPIOList {
      let unsafeAddress: UInt
      let startOffset: UInt
      let stride: UInt
      let count: Int
      init(unsafeAddress: UInt, startOffset: UInt, stride: UInt, count: Int) {
        self.unsafeAddress = unsafeAddress
        self.startOffset = startOffset
        self.stride = stride
        self.count = count
      }

      public subscript(index: UInt32) -> GPIO {
        precondition(index < count)
        let addr = unsafeAddress + UInt(index) * stride + startOffset
        return GPIO(unsafeAddress: addr)
      }
    }

    public var gpio: GPIOList {
      GPIOList(unsafeAddress: unsafeAddress, startOffset: 0x4, stride: 0x4, count: 30)
    }

    public struct GPIO {
      let unsafeAddress: UInt

      init(unsafeAddress: UInt) {
        self.unsafeAddress = unsafeAddress 
      }

      public struct Projection {
        public enum DriveStrength: UInt32 {
          case level2mA = 0
          case level4mA = 1
          case level8mA = 2
          case level12mA = 3

          init(decoding value: UInt32) {
            self.init(rawValue: (value & 0x30) >> 4)!
          }

          var encoded: UInt32 {
            (self.rawValue << 4) & 0x30
          }
        }
        public enum SlewRateControl: UInt32 {
          case slow = 0
          case fast = 1

          init(decoding value: UInt32) {
            self.init(rawValue: (value & 0x1) >> 0)!
          }

          var encoded: UInt32 {
            (self.rawValue << 0) & 0x1
          }
        }
        public var outputDisable: Bool 
        public var inputEnable: Bool
        public var driveStrength: DriveStrength
        public var pullUpEnable: Bool
        public var pullDownEnable: Bool
        public var schmittTriggerEnable: Bool
        public var slewRateControl: SlewRateControl

        init(decoding value: UInt32) {
          outputDisable = value & (1 << 7) != 0
          inputEnable = value & (1 << 6) != 0
          driveStrength = DriveStrength(decoding: value)
          pullUpEnable = value & (1 << 3) != 0
          pullDownEnable = value & (1 << 2) != 0
          schmittTriggerEnable = value & (1 << 1) != 0
          slewRateControl = SlewRateControl(decoding: value)
        }

        var encoded: UInt32 {
          (outputDisable ? 1 << 7 : 0x0) |
          (inputEnable ? 1 << 6 : 0x0) |
          driveStrength.encoded |
          (pullUpEnable ? 1 << 3 : 0x0) |
          (pullDownEnable ? 1 << 2 : 0x0) |
          (schmittTriggerEnable ? 1 << 1 : 0x0) |
          slewRateControl.encoded
        }
      }

      public func modify<T>(_ apply: (inout Projection) -> T) -> T {
        let value = RP2040Hardware.read(UInt32.self, from: unsafeAddress)
        var projection = Projection(decoding: value)
        let result = apply(&projection)
        RP2040Hardware.write(projection.encoded, to: unsafeAddress)
        return result
      }
    }

    public var swclk: SWCLK {
      SWCLK(unsafeAddress: unsafeAddress + 0x000000da)
    }

    public struct SWCLK {
      let unsafeAddress: UInt

      init(unsafeAddress: UInt) {
        self.unsafeAddress = unsafeAddress 
      }

      public struct Projection {
        public enum DriveStrength: UInt32 {
          case level2mA = 0
          case level4mA = 1
          case level8mA = 2
          case level12mA = 3

          init(decoding value: UInt32) {
            self.init(rawValue: (value & 0x30) >> 4)!
          }

          var encoded: UInt32 {
            (self.rawValue << 4) & 0x30
          }
        }
        public enum SlewRateControl: UInt32 {
          case slow = 0
          case fast = 1

          init(decoding value: UInt32) {
            self.init(rawValue: (value & 0x1) >> 0)!
          }

          var encoded: UInt32 {
            (self.rawValue << 0) & 0x1
          }
        }
        public var outputDisable: Bool 
        public var inputEnable: Bool
        public var driveStrength: DriveStrength
        public var pullUpEnable: Bool
        public var pullDownEnable: Bool
        public var schmittTriggerEnable: Bool
        public var slewRateControl: SlewRateControl

        init(decoding value: UInt32) {
          outputDisable = value & (1 << 7) != 0
          inputEnable = value & (1 << 6) != 0
          driveStrength = DriveStrength(decoding: value)
          pullUpEnable = value & (1 << 3) != 0
          pullDownEnable = value & (1 << 2) != 0
          schmittTriggerEnable = value & (1 << 1) != 0
          slewRateControl = SlewRateControl(decoding: value)
        }

        var encoded: UInt32 {
          (outputDisable ? 1 << 7 : 0x0) |
          (inputEnable ? 1 << 6 : 0x0) |
          driveStrength.encoded |
          (pullUpEnable ? 1 << 3 : 0x0) |
          (pullDownEnable ? 1 << 2 : 0x0) |
          (schmittTriggerEnable ? 1 << 1 : 0x0) |
          slewRateControl.encoded
        }
      }

      public func modify<T>(_ apply: (inout Projection) -> T) -> T {
        let value = RP2040Hardware.read(UInt32.self, from: unsafeAddress)
        var projection = Projection(decoding: value)
        let result = apply(&projection)
        RP2040Hardware.write(projection.encoded, to: unsafeAddress)
        return result
      }
    }

    public var swd: SWD {
      SWD(unsafeAddress: unsafeAddress + 0x000000da)
    }

    public struct SWD {
      let unsafeAddress: UInt

      init(unsafeAddress: UInt) {
        self.unsafeAddress = unsafeAddress 
      }

      public struct Projection {
        public enum DriveStrength: UInt32 {
          case level2mA = 0
          case level4mA = 1
          case level8mA = 2
          case level12mA = 3

          init(decoding value: UInt32) {
            self.init(rawValue: (value & 0x30) >> 4)!
          }

          var encoded: UInt32 {
            (self.rawValue << 4) & 0x30
          }
        }
        public enum SlewRateControl: UInt32 {
          case slow = 0
          case fast = 1

          init(decoding value: UInt32) {
            self.init(rawValue: (value & 0x1) >> 0)!
          }

          var encoded: UInt32 {
            (self.rawValue << 0) & 0x1
          }
        }
        public var outputDisable: Bool 
        public var inputEnable: Bool
        public var driveStrength: DriveStrength
        public var pullUpEnable: Bool
        public var pullDownEnable: Bool
        public var schmittTriggerEnable: Bool
        public var slewRateControl: SlewRateControl

        init(decoding value: UInt32) {
          outputDisable = value & (1 << 7) != 0
          inputEnable = value & (1 << 6) != 0
          driveStrength = DriveStrength(decoding: value)
          pullUpEnable = value & (1 << 3) != 0
          pullDownEnable = value & (1 << 2) != 0
          schmittTriggerEnable = value & (1 << 1) != 0
          slewRateControl = SlewRateControl(decoding: value)
        }

        var encoded: UInt32 {
          (outputDisable ? 1 << 7 : 0x0) |
          (inputEnable ? 1 << 6 : 0x0) |
          driveStrength.encoded |
          (pullUpEnable ? 1 << 3 : 0x0) |
          (pullDownEnable ? 1 << 2 : 0x0) |
          (schmittTriggerEnable ? 1 << 1 : 0x0) |
          slewRateControl.encoded
        }
      }

      public func modify<T>(_ apply: (inout Projection) -> T) -> T {
        let value = RP2040Hardware.read(UInt32.self, from: unsafeAddress)
        var projection = Projection(decoding: value)
        let result = apply(&projection)
        RP2040Hardware.write(projection.encoded, to: unsafeAddress | RP2040Hardware.setAliasMask)
        return result
      }
    }
  }
}