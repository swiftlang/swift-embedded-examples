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

/// Read Blob Request
///
/// The *Read Blob Request* is used to request the server to read part of the value of an attribute
/// at a given offset and return a specific part of the value in a *Read Blob Response*.
@frozen
public struct ATTReadBlobRequest: ATTProtocolDataUnit, Equatable, Hashable, Sendable {
    
    public static var attributeOpcode: ATTOpcode { .readBlobRequest }
    
    /// The handle of the attribute to be read.
    public var handle: UInt16
    
    /// The offset of the first octet to be read.
    public var offset: UInt16
    
    public init(handle: UInt16,
                offset: UInt16) {
        
        self.handle = handle
        self.offset = offset
    }
}

// MARK: - DataConvertible

extension ATTReadBlobRequest: DataConvertible {
    
    public static var length: Int { 5 }
    
    public init?<Data: DataContainer>(data: Data) {
        
        guard data.count == Self.length,
            Self.validateOpcode(data)
            else { return nil }
        
        self.handle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        self.offset = UInt16(littleEndian: UInt16(bytes: (data[3], data[4])))
    }
    
    public func append<Data>(to data: inout Data) where Data : DataContainer {
        data += Self.attributeOpcode.rawValue
        data += self.handle.littleEndian
        data += self.offset.littleEndian
    }
    
    public var dataLength: Int {
        Self.length
    }
}
