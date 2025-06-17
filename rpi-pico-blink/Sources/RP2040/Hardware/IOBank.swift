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
  public var ioBank0: IOBank {
    IOBank(unsafeAddress: 0x40014000)
  }

  public struct IOBank {
    let unsafeAddress: UInt

    init(unsafeAddress: UInt) {
      self.unsafeAddress = unsafeAddress 
    }

    public struct GPIOControlList {
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

      public subscript(index: UInt32) -> GPIOControl {
        precondition(index < count)
        let addr = unsafeAddress + UInt(index) * stride + startOffset
        return GPIOControl(unsafeAddress: addr)
      }
    }

    public var gpioControl: GPIOControlList {
      GPIOControlList(unsafeAddress: unsafeAddress, startOffset: 0x0004, stride: 0x8, count: 30)
    }

    public struct GPIOControl {
      let unsafeAddress: UInt

      init(unsafeAddress: UInt) {
        self.unsafeAddress = unsafeAddress 
      }

      public struct Projection {
        public enum IRQ: UInt32 {
          case normal = 0
          case invert = 1
          case low = 2
          case high = 3

          init(decoding value: UInt32) {
            self.init(rawValue: (value & 0x30000000) >> 28)!
          }

          var encoded: UInt32 {
            (self.rawValue << 28) & 0x30000000
          }
        }

        public enum Input: UInt32 {
          case normal = 0
          case inverted = 1
          case low = 2
          case high = 3

          init(decoding value: UInt32) {
            self.init(rawValue: (value & 0x30000) >> 16)!
          }

          var encoded: UInt32 {
            (self.rawValue << 16) & 0x30000
          }
        }

        public enum OutputEnable: UInt32 {
          case normal = 0
          case inverted = 1
          case disabled = 2
          case enabled = 3

          init(decoding value: UInt32) {
            self.init(rawValue: (value & 0x3000) >> 12)!
          }

          var encoded: UInt32 {
            (self.rawValue << 12) & 0x3000
          }
        }

        public enum Output: UInt32 {
          case normal = 0
          case inverted = 1
          case low = 2
          case high = 3

          init(decoding value: UInt32) {
            self.init(rawValue: (value & 0x300) >> 8)!
          }

          var encoded: UInt32 {
            (self.rawValue << 8) & 0x300
          }
        }

        public enum FuncSel: UInt32 {
          case jtagTCK = 0
          case spiRx = 1
          case uart0Tx = 2
          case i20SDA = 3
          case pwmA0 = 4
          case sio0 = 5
          case pio0 = 6
          case pio1 = 7
          case usbMuxingOvercurrentDetect = 9
          case null = 31

          init(decoding value: UInt32) {
            self.init(rawValue: (value & 0x1F) >> 0)!
          }

          var encoded: UInt32 {
            (self.rawValue << 0) & 0x1F
          }
        }

        public var irq: IRQ
        public var input: Input
        public var outputEnable: OutputEnable
        public var output: Output
        public var functionSelection: FuncSel

        init(decoding value: UInt32) {
          irq = IRQ(decoding: value)
          input = Input(decoding: value)
          outputEnable = OutputEnable(decoding: value)
          output = Output(decoding: value)
          functionSelection = FuncSel(decoding: value)
        }

        var encoded: UInt32 {
          irq.encoded | 
          input.encoded |
          outputEnable.encoded |
          output.encoded |
          functionSelection.encoded
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
