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

/// Read Blob Response
///
/// The *Read Blob Response* is sent in reply to a received *Read Blob Request*
/// and contains part of the value of the attribute that has been read.
@frozen
public struct ATTReadBlobResponse<Value: DataContainer>: ATTProtocolDataUnit, Equatable, Hashable, Sendable {
    
    public static var attributeOpcode: ATTOpcode { .readBlobResponse }
    
    /// Part of the value of the attribute with the handle given.
    ///
    ///
    /// The part attribute value shall be set to part of the value of the attribute identified
    /// by the attribute handle and the value offset in the request.
    public var partAttributeValue: Value
    
    public init(partAttributeValue: Value) {
        self.partAttributeValue = partAttributeValue
    }
}

// MARK: - DataConvertible

extension ATTReadBlobResponse: DataConvertible {
    
    public init?<Data: DataContainer>(data: Data) {
        guard data.count >= 1,
            Self.validateOpcode(data)
            else { return nil }
        self.partAttributeValue = data.suffixCheckingBounds(from: 1)
    }
    
    public func append<Data>(to data: inout Data) where Data : DataContainer {
        data += Self.attributeOpcode.rawValue
        data += self.partAttributeValue
    }
    
    public var dataLength: Int {
        1 + partAttributeValue.count
    }
}
