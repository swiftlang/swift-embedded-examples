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

/// Read Response
///
/// The *Read Response* is sent in reply to a received *Read Request* and contains
/// the value of the attribute that has been read.
///
/// - Note: The *Read Blob Request* would be used to read the remaining octets of a long attribute value.
@frozen
public struct ATTReadResponse<Value: DataContainer>: ATTProtocolDataUnit, Equatable {
    
    public static var attributeOpcode: ATTOpcode { return .readResponse }
    
    /// The value of the attribute with the handle given.
    public var attributeValue: Value
    
    public init(attributeValue: Value) {
        self.attributeValue = attributeValue
    }
}

// MARK: - DataConvertible

extension ATTReadResponse: DataConvertible {
    
    public init?<Data: DataContainer>(data: Data) {
        guard data.count >= 1,
            Self.validateOpcode(data)
            else { return nil }
        self.attributeValue = data.suffixCheckingBounds(from: 1)
    }
    
    public func append<Data>(to data: inout Data) where Data : DataContainer {
        data += Self.attributeOpcode.rawValue
        data += self.attributeValue
    }
    
    public var dataLength: Int {
        return 1 + attributeValue.count
    }
}
