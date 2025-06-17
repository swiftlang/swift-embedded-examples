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
  public var watchdog: Watchdog {
    Watchdog(unsafeAddress: 0x40058000) 
  }

  public struct Watchdog {
    let unsafeAddress: UInt

    init(unsafeAddress: UInt) {
      self.unsafeAddress = unsafeAddress 
    }

    public var tick: Tick {
      Tick(unsafeAddress: unsafeAddress + 0x002c)
    }

    public struct Tick {
      let unsafeAddress: UInt

      init(unsafeAddress: UInt) {
        self.unsafeAddress = unsafeAddress
      }

      public struct Projection {
        public var count: UInt16
        public var running: Bool
        public var enabled: Bool
        public var cycles: UInt16

        init(decoding value: UInt32) {
          count = UInt16((value & 0xFF800) >> 11)
          running = value & (1 << 10) != 0
          enabled = value & (1 << 9) != 0
          cycles = UInt16((value & 0x1FF) >> 0)
        }

        var encoded: UInt32 {
          UInt32(count & 0x1FF) << 11 |
          (running ? 1 << 10 : 0x0) |
          (enabled ? 1 << 9 : 0x0) |
          UInt32(cycles & 0x1FF) << 0
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