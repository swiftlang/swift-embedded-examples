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

/// Read by Group Type Request
///
/// The *Read By Group Type Request* is used to obtain the values of attributes where the attribute type is known,
/// the type of a grouping attribute as defined by a higher layer specification, but the handle is not known.
@frozen
public struct ATTReadByGroupTypeRequest: ATTProtocolDataUnit, Equatable, Hashable, Sendable {
    
    public static var attributeOpcode: ATTOpcode { .readByGroupTypeRequest }
    
    /// First requested handle number.
    public var startHandle: UInt16
    
    /// Last requested handle number.
    public var endHandle: UInt16
    
    /// Attribute Group Type
    ///
    /// 2 or 16 octet UUID
    public var type: BluetoothUUID
    
    public init(
        startHandle: UInt16,
        endHandle: UInt16,
        type: BluetoothUUID
    ) {
        assert(type.dataLength != 4, "Cannot use 32-bit UUID")
        self.startHandle = startHandle
        self.endHandle = endHandle
        self.type = type
    }
}

// MARK: - DataConvertible

extension ATTReadByGroupTypeRequest: DataConvertible {
    
    public init?<Data: DataContainer>(data: Data) {
        
        guard let length = Length(rawValue: data.count),
            Self.validateOpcode(data)
            else { return nil }
        
        self.startHandle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        self.endHandle = UInt16(littleEndian: UInt16(bytes: (data[3], data[4])))
        
        switch length {
        case .uuid16:
            let value = UInt16(littleEndian: UInt16(bytes: (data[5], data[6])))
            self.type = .bit16(value)
        case .uuid128:
            self.type = BluetoothUUID(littleEndian: BluetoothUUID(data: data.subdata(in: 5 ..< 21))!)
        }
    }
    
    public var dataLength: Int {
        return length.rawValue
    }
    
    public func append<Data>(to data: inout Data) where Data : DataContainer {
        data += Self.attributeOpcode.rawValue
        data += self.startHandle.littleEndian
        data += self.endHandle.littleEndian
        data += self.type.littleEndian
    }
}

// MARK: - Supporting Types

fileprivate extension ATTReadByGroupTypeRequest {
    
    enum Length: Int {
        
        case uuid16     = 7
        case uuid128    = 21
    }
    
    var length: Length {
        
        switch type {
        case .bit16:
            return .uuid16
        case .bit128:
            return .uuid128
        case .bit32:
            assertionFailure("")
            return .uuid128
        }
    }
}
