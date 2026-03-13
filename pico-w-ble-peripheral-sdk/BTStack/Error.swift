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

/// BTstack Error Code
public struct BTStackError: Error, RawRepresentable, Equatable, Hashable, Sendable {
    
    public let rawValue: Int32
    
    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }
}

public extension BTStackError {
    
    init(_ hci: HCIError) {
        self.init(rawValue: Int32(hci.rawValue))
    }
}

public extension HCIError {
    
    init?(_ error: BTStackError) {
        guard error.rawValue <= UInt8.max else {
            return nil
        }
        self.init(rawValue: UInt8(error.rawValue))
    }
}

internal extension CInt {
    
    func throwsError() throws(BTStackError) {
        guard self == 0 else {
            throw BTStackError(rawValue: self)
        }
    }
}

internal extension UInt8 {
    
    func throwsError() throws(BTStackError) {
        guard self == 0 else {
            throw BTStackError(rawValue: numericCast(self))
        }
    }
}
