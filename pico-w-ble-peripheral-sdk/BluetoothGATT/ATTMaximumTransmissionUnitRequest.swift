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

/// Exchange MTU Request
///
/// The *Exchange MTU Request* is used by the client to inform the server of the client’s maximum receive MTU
/// size and request the server to respond with its maximum receive MTU size.
///
/// - Note: This request shall only be sent once during a connection by the client.
/// The *Client Rx MTU* parameter shall be set to the maximum size of the attribute protocol PDU that the client can receive.
@frozen
public struct ATTMaximumTransmissionUnitRequest: ATTProtocolDataUnit, Equatable, Hashable, Sendable {
    
    /// 0x02 = Exchange MTU Request
    public static var attributeOpcode: ATTOpcode { .maximumTransmissionUnitRequest }
    
    /// Client Rx MTU
    ///
    /// Client receive MTU size
    public var clientMTU: UInt16
    
    public init(clientMTU: UInt16) {
        self.clientMTU = clientMTU
    }
}

// MARK: - DataConvertible

extension ATTMaximumTransmissionUnitRequest: DataConvertible {
    
    public static var length: Int { 3 }
    
    public init?<Data: DataContainer>(data: Data) {
        
        guard data.count == Self.length,
            Self.validateOpcode(data)
            else { return nil }
        
        self.clientMTU = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
    }
    
    public func append<Data>(to data: inout Data) where Data : DataContainer {
        data += Self.attributeOpcode.rawValue
        data += self.clientMTU.littleEndian
    }
    
    public var dataLength: Int {
        Self.length
    }
}
