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

enum SPINeoPixelBit: UInt8 {
  case reset = 0b0000_0000
  case zero = 0b1100_0000
  case one = 0b1111_1000
}
