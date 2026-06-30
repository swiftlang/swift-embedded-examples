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

/// Find By Type Value Response
///
/// The *Find By Type Value Response* is sent in reply to a received *Find By Type Value Request*
/// and contains information about this server.
@frozen
public struct ATTFindByTypeResponse: ATTProtocolDataUnit, Equatable, Hashable, Sendable {
    
    public static var attributeOpcode: ATTOpcode { .findByTypeResponse }
    
    /// A list of 1 or more Handle Informations.
    public let handles: [HandlesInformation]
    
    public init?(handles: [HandlesInformation]) {
        guard handles.isEmpty == false
            else { return nil }
        self.handles = handles
    }
    
    internal init(_ handles: [HandlesInformation]) {
        assert(handles.isEmpty == false, "Must have at least one element")
        self.handles = handles
    }
}

// MARK: - DataConvertible

extension ATTFindByTypeResponse: DataConvertible {
    
    /// Minimum length.
    internal static var minimumLength: Int { 1 + HandlesInformation.length }
    
    public init?<Data: DataContainer>(data: Data) {
        
        guard data.count >= Self.minimumLength,
            Self.validateOpcode(data)
            else { return nil }
        
        let handleLength = HandlesInformation.length
        
        let handleBytesCount = data.count - 1
        
        guard handleBytesCount % handleLength == 0
            else { return nil }
        
        let handleCount = handleBytesCount / handleLength
        
        let handleIndices = (0 ..< handleCount)
        let handles = handleIndices.map { (index: Int) -> HandlesInformation in
            let byteIndex = 1 + (index * handleLength)
            return HandlesInformation(data.subdata(in: byteIndex ..< byteIndex + handleLength))
        }
        
        self.init(handles: handles)
    }
    
    public func append<Data>(to data: inout Data) where Data : DataContainer {
        data += Self.attributeOpcode.rawValue
        data += self.handles
    }
    
    public var dataLength: Int {
        1 + (handles.count * HandlesInformation.length)
    }
}

// MARK: - Supporting Types

public extension ATTFindByTypeResponse {
    
    /// Handles Information
    ///
    /// For each handle that matches the attribute type and attribute value in the *Find By Type Value Request*
    /// a *Handles Information* shall be returned.
    /// The *Found Attribute Handle* shall be set to the handle of the attribute that has the exact attribute type
    /// and attribute value from the *Find By Type Value Request*.
    struct HandlesInformation: Equatable, Hashable, Sendable {
        
        /// Found Attribute Handle
        public var foundAttribute: UInt16
        
        /// Group End Handle
        public var groupEnd: UInt16
        
        public init(
            foundAttribute: UInt16,
            groupEnd: UInt16
        ) {
            self.foundAttribute = foundAttribute
            self.groupEnd = groupEnd
        }
    }
}

extension ATTFindByTypeResponse.HandlesInformation: DataConvertible {
    
    public static var length: Int { 4 }
    
    public init?<Data: DataContainer>(data: Data) {
        guard data.count == Self.length else {
            return nil
        }
        self.init(data)
    }
    
    internal init<Data: DataContainer>(_ data: Data) {
        assert(data.count == Self.length)
        self.foundAttribute = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        self.groupEnd = UInt16(littleEndian: UInt16(bytes: (data[2], data[3])))
    }
    
    public func append<Data>(to data: inout Data) where Data : DataContainer {
        data += foundAttribute.littleEndian
        data += groupEnd.littleEndian
    }
    
    public var dataLength: Int {
        Self.length
    }
}
