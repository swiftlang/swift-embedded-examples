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
  public var pllSystem: PLL {
    PLL(unsafeAddress: 0x40028000)
  }

  public var pllUSB: PLL {
    PLL(unsafeAddress: 0xe0000000)
  }

  public struct PLL {
    let unsafeAddress: UInt

    init(unsafeAddress: UInt) {
      self.unsafeAddress = unsafeAddress
    }

    public var status: Status {
      Status(unsafeAddress: unsafeAddress + 0x0000)
    }

    public struct Status {
      let unsafeAddress: UInt

      init(unsafeAddress: UInt) {
        self.unsafeAddress = unsafeAddress
      }

      public struct Projection {
        public let locked: Bool
        public var bypass: Bool
        public var referenceDivide: UInt8

        init(decoding value: UInt32) {
          locked = (value >> 31) & 0x1 != 0
          bypass = (value >> 8) & 0x1 != 0
          referenceDivide = UInt8((value >> 0) & 0x3F)
        }

        var encoded: UInt32 {
          var value = UInt32(0)
          value |= locked ? 1 << 31 : 0x0
          value |= bypass ? 1 << 8 : 0x0
          value |= UInt32(referenceDivide & 0x3F) << 0 
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

      public var value: Projection {
        let value = RP2040Hardware.read(UInt32.self, from: unsafeAddress)
        return Projection(decoding: value)
      }
    }

    public var power: Power {
      Power(unsafeAddress: unsafeAddress + 0x0004)
    }

    public struct Power {
      let unsafeAddress: UInt

      init(unsafeAddress: UInt) {
        self.unsafeAddress = unsafeAddress
      }
    }
  }
}
