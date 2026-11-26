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

/// Find By Type Value Request
///
/// The *Find By Type Value Request* is used to obtain the handles of attributes that
/// have a 16-bit UUID attribute type and attribute value.
/// This allows the range of handles associated with a given attribute to be discovered when
/// the attribute type determines the grouping of a set of attributes.
///
/// - Note: Generic Attribute Profile defines grouping of attributes by attribute type.
@frozen
public struct ATTFindByTypeRequest<Value: DataContainer>: ATTProtocolDataUnit, Equatable, Hashable, Sendable {
    
    public static var attributeOpcode: ATTOpcode { .findByTypeRequest }
    
    /// First requested handle number
    public var startHandle: UInt16
    
    /// Last requested handle number
    public var endHandle: UInt16
    
    /// 2 octet UUID to find.
    public var attributeType: UInt16
    
    /// Attribute value to find.
    public var attributeValue: Value
    
    public init(
        startHandle: UInt16,
        endHandle: UInt16,
        attributeType: UInt16,
        attributeValue: Value
    ) {
        self.startHandle = startHandle
        self.endHandle = endHandle
        self.attributeType = attributeType
        self.attributeValue = attributeValue
    }
}

// MARK: - DataConvertible

extension ATTFindByTypeRequest: DataConvertible {
    
    public init?<Data: DataContainer>(data: Data) {
        
        guard data.count >= 7,
            Self.validateOpcode(data)
            else { return nil }
        
        let startHandle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        let endHandle = UInt16(littleEndian: UInt16(bytes: (data[3], data[4])))
        let attributeType = UInt16(littleEndian: UInt16(bytes: (data[5], data[6])))
        let attributeValue: Value = data.suffixCheckingBounds(from: 7)
        
        self.init(
            startHandle: startHandle,
            endHandle: endHandle,
            attributeType: attributeType,
            attributeValue: attributeValue
        )
    }
    
    public func append<Data>(to data: inout Data) where Data : DataContainer {
        data += Self.attributeOpcode.rawValue
        data += self.startHandle.littleEndian
        data += self.endHandle.littleEndian
        data += self.attributeType.littleEndian
        data += self.attributeValue
    }
    
    public var dataLength: Int {
        return 7 + attributeValue.count
    }
}
