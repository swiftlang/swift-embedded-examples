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
  public var timer: Timer {
    Timer(unsafeAddress: 0x40054000)
  }

  public struct Timer {
    let unsafeAddress: UInt

    init(unsafeAddress: UInt) {
      self.unsafeAddress = unsafeAddress 
    }

    public var awh: UInt32 {
      RP2040Hardware.read(UInt32.self, from: unsafeAddress, offset: 0x0024)
    }

    public var awl: UInt32 {
      RP2040Hardware.read(UInt32.self, from: unsafeAddress, offset: 0x0028)
    }
  }
}