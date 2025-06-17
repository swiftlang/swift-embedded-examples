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

struct ButtonTimes {
  typealias Times = (
    UInt32, UInt32, UInt32, UInt32,
    UInt32, UInt32, UInt32, UInt32,
    UInt32, UInt32, UInt32, UInt32)
  static let count = 12
  static let rawSize = MemoryLayout<Times>.size
  static let reboundSize = Self.count * MemoryLayout<UInt32>.size

  private var times: Times = 
    (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)

  subscript(_ index: some FixedWidthInteger) -> UInt32 {
    get {
      precondition(Self.rawSize == Self.reboundSize)
      return withUnsafePointer(to: self.times) {
        $0.withMemoryRebound(to: UInt32.self, capacity: Self.count) {
          $0[Int(index)]
        }
      }
    } 
    set {
      precondition(Self.rawSize == Self.reboundSize)
      return withUnsafeMutablePointer(to: &self.times) {
        $0.withMemoryRebound(to: UInt32.self, capacity: Self.count) {
          $0[Int(index)] = newValue
        }
      }
    } 
  }
}
