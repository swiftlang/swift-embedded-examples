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

/// Handle Value Confirmation
///
/// The *Handle Value Confirmation* is sent in response to a received *Handle Value Indication*
/// and confirms that the client has received an indication of the given attribute.
@frozen
public struct ATTHandleValueConfirmation: ATTProtocolDataUnit, Sendable {
    
    public static var attributeOpcode: ATTOpcode { .handleValueConfirmation }
    
    public init() { }
}

extension ATTHandleValueConfirmation: DataConvertible {
    
    public init?<Data: DataContainer>(data: Data) {
        
        guard data.count == 1,
            Self.validateOpcode(data)
            else { return nil }
    }
    
    public func append<Data>(to data: inout Data) where Data : DataContainer {
        data += Self.attributeOpcode.rawValue
    }
    
    public var dataLength: Int { 1 }
}
