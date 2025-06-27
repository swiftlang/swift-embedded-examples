//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift open source project
//
// Copyright (c) 2025 Apple Inc. and the Swift project authors.
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
//
//===----------------------------------------------------------------------===//

public typealias ArduinoString = String

extension ArduinoString: CustomStringConvertible {
  public var description: Swift.String {
    let size = self.length() + 1
    let buffer = UnsafeMutablePointer<CChar>.allocate(capacity: Int(size))
    self.getBytes(buffer, size)
    let result = Swift.String(cString: UnsafePointer<CChar>(buffer))
    buffer.deallocate()
    return result
  }
}
