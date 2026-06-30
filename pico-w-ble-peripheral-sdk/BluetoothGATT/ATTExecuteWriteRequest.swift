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

/// Execute Write Request
///
/// The *Execute Write Request* is used to request the server to write or cancel the write
/// of all the prepared values currently held in the prepare queue from this client.
/// This request shall be handled by the server as an atomic operation.
@frozen
public enum ATTExecuteWriteRequest: UInt8, ATTProtocolDataUnit, Sendable, CaseIterable {
    
    public static var attributeOpcode: ATTOpcode {  .executeWriteRequest }
    
    /// Cancel all prepared writes.
    case cancel = 0x00
    
    /// Immediately write all pending prepared values.
    case write  = 0x01
}

extension ATTExecuteWriteRequest: DataConvertible {
    
    public static var length: Int { 2 }
    
    public init?<Data: DataContainer>(data: Data) {
        
        guard data.count == 2,
            Self.validateOpcode(data)
            else { return nil }
        
        self.init(rawValue: data[1])
    }
    
    public func append<Data>(to data: inout Data) where Data : DataContainer {
        data += [Self.attributeOpcode.rawValue, rawValue]
    }
    
    public var dataLength: Int {
        Self.length
    }
}
