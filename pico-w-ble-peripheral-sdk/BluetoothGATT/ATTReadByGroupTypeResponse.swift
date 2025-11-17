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

/// Read By Group Type Response
///
/// The *Read By Group Type Response* is sent in reply to a received *Read By Group Type Request*
/// and contains the handles and values of the attributes that have been read.
///
/// - Note: The *Read Blob Request* would be used to read the remaining octets of a long attribute value.
@frozen
public struct ATTReadByGroupTypeResponse<Value: DataContainer>: ATTProtocolDataUnit, Equatable, Hashable, Sendable {
    
    public static var attributeOpcode: ATTOpcode { .readByGroupTypeResponse }
    
    /// A list of Attribute Data
    public let attributeData: [AttributeData]
    
    public init?(attributeData: [AttributeData]) {
        guard Self.validate(attributeData)
            else { return nil }
        self.attributeData = attributeData
    }
    
    internal init(_ unsafe: [AttributeData]) {
        self.attributeData = unsafe
    }
}

extension ATTReadByGroupTypeResponse: ATTAttributeDataList { }

// MARK: - DataConvertible

extension ATTReadByGroupTypeResponse: DataConvertible {
        
    public init?<Data: DataContainer>(data: Data) {
        guard let attributeData = ATTReadByGroupTypeResponse.from(data: data)
            else { return nil }
        self.attributeData = attributeData
    }
    
    public func append<Data>(to data: inout Data) where Data : DataContainer {
        Self.append(&data, self.attributeData)
    }
    
    public var dataLength: Int {
        Self.dataLength(for: attributeData)
    }
}

// MARK: - Supporting Types

public extension ATTReadByGroupTypeResponse {
    
    struct AttributeData: Equatable, Hashable, Sendable, ATTAttributeData {
        
        /// Attribute Handle
        public var attributeHandle: UInt16
        
        /// End Group Handle
        public var endGroupHandle: UInt16
        
        /// Attribute Value
        public var value: Value
        
        public init(
            attributeHandle: UInt16,
            endGroupHandle: UInt16,
            value: Value
        ) {
            self.attributeHandle = attributeHandle
            self.endGroupHandle = endGroupHandle
            self.value = value
        }
    }
}

extension ATTReadByGroupTypeResponse.AttributeData: DataConvertible {
    
    public init?<Data: DataContainer>(data: Data) {
        
        guard data.count >= 4
            else { return nil }
        
        self.attributeHandle = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        self.endGroupHandle = UInt16(littleEndian: UInt16(bytes: (data[2], data[3])))
        self.value = data.suffixCheckingBounds(from: 4)
    }
    
    public func append<Data>(to data: inout Data) where Data : DataContainer {
        data += attributeHandle.littleEndian
        data += endGroupHandle.littleEndian
        data += value
    }
    
    public var dataLength: Int {
        4 + value.count
    }
}
