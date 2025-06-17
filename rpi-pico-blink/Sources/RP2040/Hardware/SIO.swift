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
  public var sio: SIO {
    SIO(unsafeAddress: 0xd0000000)
  }

  public struct SIO {
    let unsafeAddress: UInt

    init(unsafeAddress: UInt) {
      self.unsafeAddress = unsafeAddress 
    }

    public func setOutput(_ bits: UInt32) {
      RP2040Hardware.write(bits & 0x3FFFFFFF, to: unsafeAddress, offset: 0x0014)
    }

    public func clearOutput(_ bits: UInt32) {
      RP2040Hardware.write(bits & 0x3FFFFFFF, to: unsafeAddress, offset: 0x0018) 
    }

    public func enableOutput(_ bits: UInt32) {
      RP2040Hardware.write(bits & 0x3FFFFFFF, to: unsafeAddress, offset: 0x0024)
    }

    public func disableOutput(_ bits: UInt32) {
      RP2040Hardware.write(bits & 0x3FFFFFFF, to: unsafeAddress, offset: 0x0028) 
    }
  }
}