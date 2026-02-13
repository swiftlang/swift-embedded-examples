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

/// Find Information Request
///
/// The *Find Information Request* is used to obtain the mapping of attribute handles with their associated types.
/// This allows a client to discover the list of attributes and their types on a server.
@frozen
public struct ATTFindInformationRequest: ATTProtocolDataUnit, Equatable, Hashable, Sendable {
    
    public static var attributeOpcode: ATTOpcode { .findInformationRequest }
    
    public var startHandle: UInt16
    
    public var endHandle: UInt16
    
    public init(
        startHandle: UInt16,
        endHandle: UInt16
    ) {
        self.startHandle = startHandle
        self.endHandle = endHandle
    }
}

// MARK: - DataConvertible

extension ATTFindInformationRequest: DataConvertible {
    
    public static var length: Int { 5 }
    
    public init?<Data: DataContainer>(data: Data) {
        
        guard data.count == Self.length,
            Self.validateOpcode(data)
            else { return nil }
        
        self.startHandle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        self.endHandle = UInt16(littleEndian: UInt16(bytes: (data[3], data[4])))
    }
    
    public func append<Data>(to data: inout Data) where Data : DataContainer {
        data += Self.attributeOpcode.rawValue
        data += self.startHandle.littleEndian
        data += self.endHandle.littleEndian
    }
    
    public var dataLength: Int {
        Self.length
    }
}
