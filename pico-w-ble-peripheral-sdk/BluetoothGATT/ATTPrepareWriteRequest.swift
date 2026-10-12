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

/// Prepare Write Request
///
/// The *Prepare Write Request* is used to request the server to prepare to write the value of an attribute.
/// The server will respond to this request with a *Prepare Write Response*,
/// so that the client can verify that the value was received correctly.
@frozen
public struct ATTPrepareWriteRequest<Value: DataContainer>: ATTProtocolDataUnit, Equatable, Hashable, Sendable {
    
    public static var attributeOpcode: ATTOpcode { .preparedWriteRequest }
    
    /// The handle of the attribute to be written.
    public var handle: UInt16
    
    /// The offset of the first octet to be written.
    public var offset: UInt16
    
    /// The value of the attribute to be written.
    public var partValue: Value
    
    public init(handle: UInt16,
                offset: UInt16,
                partValue: Value) {
        
        self.handle = handle
        self.offset = offset
        self.partValue = partValue
    }
}

// MARK: - DataConvertible

extension ATTPrepareWriteRequest: DataConvertible {
    
    public init?<Data: DataContainer>(data: Data) {
        
        guard data.count >= 5,
            Self.validateOpcode(data)
            else { return nil }
        
        self.handle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        self.offset = UInt16(littleEndian: UInt16(bytes: (data[3], data[4])))
        self.partValue = data.suffixCheckingBounds(from: 5)
    }
    
    public func append<Data>(to data: inout Data) where Data : DataContainer {
        data += Self.attributeOpcode.rawValue
        data += self.handle.littleEndian
        data += self.offset.littleEndian
        data += self.partValue
    }
    
    public var dataLength: Int {
        return 5 + partValue.count
    }
}
