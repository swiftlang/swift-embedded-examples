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

/// The *Execute Write Response* is sent in response to a received *Execute Write Request*.
@frozen
public struct ATTExecuteWriteResponse: ATTProtocolDataUnit, Sendable {
    
    public static var attributeOpcode: ATTOpcode { .executeWriteResponse }
    
    public init() { }
}

extension ATTExecuteWriteResponse: DataConvertible {
    
    public init?<Data: DataContainer>(data: Data) {
        
        guard data.count == 1,
            Self.validateOpcode(data)
            else { return nil }
    }
    
    public func append<Data>(to data: inout Data) where Data : DataContainer {
        data += Self.attributeOpcode.rawValue
    }
    
    public var dataLength: Int {
        1
    }
}
