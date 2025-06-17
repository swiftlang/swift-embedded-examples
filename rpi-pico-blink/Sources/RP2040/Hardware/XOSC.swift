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

import Support

extension RP2040Hardware {
  public var xosc: XOSC {
    XOSC(unsafeAddress: 0x40024000)
  }

  public struct XOSC {
    let unsafeAddress: UInt

    init(unsafeAddress: UInt) {
      self.unsafeAddress = unsafeAddress
    }

    public var control: Control {
      Control(unsafeAddress: unsafeAddress + 0x0000)
    }

    public struct Control {
      let unsafeAddress: UInt

      init(unsafeAddress: UInt) {
        self.unsafeAddress = unsafeAddress
      }

      public struct Projection {
        public enum Enable: UInt32 {
          case enabled = 4011
          case disabled = 3358

          init?(decoding value: UInt32) {
            self.init(rawValue: value)
          }

          var encoded: UInt32 {
            self.rawValue
          }
        }

        public var enable: Enable?

        public enum FrequencyRange: UInt32 {
          case oneToFifteenMHz = 0xaa0
          case reserved1       = 0xaa1
          case reserved2       = 0xaa2
          case reserved3       = 0xaa3
          case unknown         = 0xfa5 // somehow this is a value?

          init(decoding value: UInt32) {
            self.init(rawValue: value)!
          }

          var encoded: UInt32 {
            self.rawValue
          }
        }

        public var frequencyRange: FrequencyRange

        init(decoding value: UInt32) {
          enable = Enable(decoding: (value >> 12) & 0xFFF)
          frequencyRange = FrequencyRange(decoding: (value >> 0) & 0xFFF)
        }

        var encoded: UInt32 {
          var value = UInt32(0)
          if let enable {
            value |= enable.encoded << 12
          }
          value |= frequencyRange.encoded << 0
          return value
        }
      }

      public func modify<T>(_ apply: (inout Projection) -> T) -> T {
        let value = RP2040Hardware.read(UInt32.self, from: unsafeAddress)
        var projection = Projection(decoding: value)
        let result = apply(&projection)
        RP2040Hardware.write(projection.encoded, to: unsafeAddress)
        return result
      }

      public func set<T>(_ apply: (inout Projection) -> T) -> T {
        let value = RP2040Hardware.read(UInt32.self, from: unsafeAddress)
        var projection = Projection(decoding: value)
        let result = apply(&projection)
        RP2040Hardware.write(projection.encoded, to: unsafeAddress | RP2040Hardware.setAliasMask)
        return result
      }
    }

    public var status: Status {
      Status(unsafeAddress: unsafeAddress + 0x0004)
    }

    public struct Status {
      let unsafeAddress: UInt

      init(unsafeAddress: UInt) {
        self.unsafeAddress = unsafeAddress
      }

      public struct Projection {
        public let stable: Bool
        public var clearBadWrite: Bool
        public let enabled: Bool

        public enum FrequencyRange: UInt32 {
          case oneToFifteenMHz = 0
          case reserved1 = 1
          case reserved2 = 2
          case reserved3 = 3

          init(decoding value: UInt32) {
            self.init(rawValue: value)!
          }

          var encoded: UInt32 {
            self.rawValue
          }
        }

        public let frequencyRange: FrequencyRange

        init(decoding value: UInt32) {
          stable = (value >> 31) & 0x1 != 0
          clearBadWrite = (value >> 24) & 0x1 != 0
          enabled = (value >> 12) & 0x1 != 0
          frequencyRange = FrequencyRange(decoding: (value >> 0) & 0x3)
        }

        var encoded: UInt32 {
          var value = UInt32(0)
          value |= stable ? 1 << 31 : 0x0
          value |= clearBadWrite ? 1 << 24 : 0x0
          value |= enabled ? 1 << 12 : 0x0
          value |= frequencyRange.rawValue << 0
          return value
        }
      }

      public var value: Projection {
        Projection(decoding: RP2040Hardware.read(UInt32.self, from: unsafeAddress))
      }
    }

    public var dormant: UInt32 {
      get {
        RP2040Hardware.read(UInt32.self, from: unsafeAddress, offset: 0x0008)
      }
      set {
        RP2040Hardware.write(newValue, to: unsafeAddress, offset: 0x0008)
      }
    }

    public var startup: Startup {
      Startup(unsafeAddress: unsafeAddress + 0x000c)
    }

    public struct Startup {
      let unsafeAddress: UInt

      init(unsafeAddress: UInt) {
        self.unsafeAddress = unsafeAddress
      }

      public struct Projection {
        public var x4: Bool
        public var delay: UInt16

        init(decoding value: UInt32) {
          x4 = (value >> 20) & 0x1 != 0
          delay = UInt16((value >> 0) & 0x3FFF)
        }

        var encoded: UInt32 {
          var value = UInt32(0)
          value |= x4 ? 1 << 20 : 0x0
          value |= UInt32(delay) << 0
          return value
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