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

/// Read Request
///
/// The *Read Request* is used to request the server to read the value of an attribute
/// and return its value in a *Read Response*.
@frozen
public struct ATTReadRequest: ATTProtocolDataUnit, Equatable, Hashable, Sendable {
    
    public static var attributeOpcode: ATTOpcode { .readRequest }
    
    /// The handle of the attribute to read.
    public var handle: UInt16
    
    public init(handle: UInt16) {
        self.handle = handle
    }
}

// MARK: - DataConvertible

extension ATTReadRequest: DataConvertible {
    
    public static var length: Int { 3 }
    
    public init?<Data: DataContainer>(data: Data) {
        
        guard data.count == Self.length,
            Self.validateOpcode(data)
            else { return nil }
        
        self.handle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
    }
    
    public func append<Data>(to data: inout Data) where Data : DataContainer {
        data += Self.attributeOpcode.rawValue
        data += self.handle.littleEndian
    }
    
    public var dataLength: Int {
        Self.length
    }
}
