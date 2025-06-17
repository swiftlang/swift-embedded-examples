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
  public var clocks: Clocks {
    Clocks(unsafeAddress: 0x40008000)
  }

  public struct Clocks {
    let unsafeAddress: UInt

    init(unsafeAddress: UInt) {
      self.unsafeAddress = unsafeAddress
    }

    public var reference: Reference {
      Reference(unsafeAddress: unsafeAddress)
    }

    public struct Reference {
      let unsafeAddress: UInt

      init(unsafeAddress: UInt) {
        self.unsafeAddress = unsafeAddress
      }

      public var control: Control {
        Control(unsafeAddress: unsafeAddress + 0x0030)
      }

      public struct Control {
        let unsafeAddress: UInt

        init(unsafeAddress: UInt) {
          self.unsafeAddress = unsafeAddress
        }

        public struct Projection {
          public enum AuxiliarySource: UInt8 {
            case clksrc_pll_usb = 0
            case clksrc_gpin0 = 1
            case clksrc_gpin1 = 2

            init(decoding value: UInt32) {
              self.init(rawValue: UInt8(value))!
            }

            var encoded: UInt32 {
              UInt32(rawValue)
            }
          }

          public var auxiliarySource: AuxiliarySource

          public enum Source: UInt8 {
            case rosc_clksrc_ph = 0
            case clksrc_clk_ref_aux = 1
            case xosc_clksrc = 2

            init(decoding value: UInt32) {
              self.init(rawValue: UInt8(value))!
            }

            var encoded: UInt32 {
              UInt32(rawValue)
            }
          }

          public var source: Source 

          init(decoding value: UInt32) {
            auxiliarySource = AuxiliarySource(decoding: (value >> 5) & 0x3)
            source = Source(decoding: (value >> 0) & 0x3)
          }

          var encoded: UInt32 {
            var value = UInt32(0)
            value |= auxiliarySource.encoded << 5
            value |= source.encoded << 0
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

        public func set(_ projection: Projection) {
          RP2040Hardware.write(projection.encoded, to: unsafeAddress | RP2040Hardware.setAliasMask)
        }

        public var value: Projection {
          Projection(decoding: RP2040Hardware.read(UInt32.self, from: unsafeAddress))
        }

        public func clearSource() {
          RP2040Hardware.write(UInt32(0x00000001), to: unsafeAddress | RP2040Hardware.clearAliasMask) 
        }

        public func clearReference() {
          RP2040Hardware.write(UInt32(0x00000800), to: unsafeAddress | RP2040Hardware.clearAliasMask) 
        }
      }

      public var divisor: Divisor {
        Divisor(unsafeAddress: unsafeAddress + 0x0034)
      }

      public struct Divisor {
        let unsafeAddress: UInt

        init(unsafeAddress: UInt) {
          self.unsafeAddress = unsafeAddress
        }

        public struct Projection {
          public var integer: UInt32

          init(decoding value: UInt32) {
            integer = (value >> 8) & 0x3
          }

          var encoded: UInt32 {
            var value = UInt32(0)
            value |= (integer & 0x3) << 8
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

        public func setRawValue(_ value: UInt32) {
          RP2040Hardware.write(value, to: unsafeAddress)
        }
      }

      public var selected: Bool {
        RP2040Hardware.read(UInt32.self, from: unsafeAddress + 0x0038) != 0
      }
    }
    
    public var system: System {
      System(unsafeAddress: unsafeAddress)
    }

    public struct System {
      let unsafeAddress: UInt

      init(unsafeAddress: UInt) {
        self.unsafeAddress = unsafeAddress
      }

      public var control: Control {
        Control(unsafeAddress: unsafeAddress + 0x003c)
      }

      public struct Control {
        let unsafeAddress: UInt

        init(unsafeAddress: UInt) {
          self.unsafeAddress = unsafeAddress
        }

        public struct Projection {
          public enum AuxiliarySource: UInt8 {
            case clksrc_pll_sys = 0
            case clksrc_pll_usb = 1
            case rosc_clksrc = 2
            case xosc_clksrc = 3
            case clksrc_gpin0 = 4
            case clksrc_gpin1 = 5

            init(decoding value: UInt32) {
              self.init(rawValue: UInt8(value))!
            }

            var encoded: UInt32 {
              UInt32(rawValue)
            }
          }

          public var auxiliarySource: AuxiliarySource

          public enum Source: UInt8 {
            case clk_ref = 0
            case clksrc_clk_sys_aux = 1

            init(decoding value: UInt32) {
              self.init(rawValue: UInt8(value))!
            }

            var encoded: UInt32 {
              UInt32(rawValue)
            }
          }

          public var source: Source 

          init(decoding value: UInt32) {
            auxiliarySource = AuxiliarySource(decoding: (value >> 5) & 0x7)
            source = Source(decoding: (value >> 0) & 0x3)
          }

          var encoded: UInt32 {
            var value = UInt32(0)
            value |= auxiliarySource.encoded << 5
            value |= source.encoded << 0
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

        public func set(_ projection: Projection) {
          RP2040Hardware.write(projection.encoded, to: unsafeAddress | RP2040Hardware.setAliasMask)
        }

        public var value: Projection {
          Projection(decoding: RP2040Hardware.read(UInt32.self, from: unsafeAddress))
        }

        public func clearSource() {
          RP2040Hardware.write(UInt32(0x00000001), to: unsafeAddress | RP2040Hardware.clearAliasMask) 
        }
      }

      public var divisor: Divisor {
        Divisor(unsafeAddress: unsafeAddress + 0x0040)
      }

      public struct Divisor {
        let unsafeAddress: UInt

        init(unsafeAddress: UInt) {
          self.unsafeAddress = unsafeAddress
        }

        public struct Projection {
          public var integer: UInt32
          public var fraction: UInt32

          init(decoding value: UInt32) {
            integer = (value >> 8) & 0xFFFFFF
            fraction = (value >> 0) & 0xFF
          }

          var encoded: UInt32 {
            var value = UInt32(0)
            value |= (integer & 0xFFFFFF) << 8
            value |= (fraction & 0xFF) << 0
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

        public func setRawValue(_ value: UInt32) {
          RP2040Hardware.write(value, to: unsafeAddress)
        }
      }

      public var selected: Bool {
        RP2040Hardware.read(UInt32.self, from: unsafeAddress + 0x0044) != 0
      }
    }

    public var resus: Resus {
      Resus(unsafeAddress: unsafeAddress + 0x0038)
    }

    public struct Resus {
      let unsafeAddress: UInt

      init(unsafeAddress: UInt) {
        self.unsafeAddress = unsafeAddress
      }

      public struct Projection {
        public var clear: Bool
        public var force: Bool
        public var enable: Bool
        public var timeout: UInt8

        init(decoding value: UInt32) {
          clear = (value >> 16) & 0x1 != 0
          force = (value >> 12) & 0x1 != 0
          enable = (value >> 8) & 0x1 != 0
          timeout = UInt8((value >> 0) & 0xFF)
        }

        var encoded: UInt32 {
          var value = UInt32(0)
          value |= clear ? 1 << 16 : 0x0
          value |= force ? 1 << 12 : 0x0
          value |= enable ? 1 << 8 : 0x0
          value |= UInt32(timeout << 0)
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
    }
  }
}