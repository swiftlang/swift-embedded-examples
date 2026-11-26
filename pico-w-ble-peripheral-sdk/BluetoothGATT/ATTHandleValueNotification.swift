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

/// Handle Value Notification
///
/// A server can send a notification of an attribute’s value at any time.
@frozen
public struct ATTHandleValueNotification<Value: DataContainer>: ATTProtocolDataUnit, Equatable, Hashable, Sendable {
    
    public static var attributeOpcode: ATTOpcode { .handleValueNotification }
    
    /// The handle of the attribute.
    public var handle: UInt16
    
    /// The handle of the attribute.
    public var value: Value
    
    public init(handle: UInt16, value: Value) {
        self.handle = handle
        self.value = value
    }
}

public extension ATTHandleValueNotification {
    
    init(attribute: GATTDatabase<Value>.Attribute, maximumTransmissionUnit: ATTMaximumTransmissionUnit) {
        
        // If the attribue value is longer than (ATT_MTU-3) octets,
        // then only the first (ATT_MTU-3) octets of this attribute value
        // can be sent in a notification.
        let dataSize = Int(maximumTransmissionUnit.rawValue) - 3
        
        let value: Value
        
        if attribute.value.count > dataSize {
            value = Value(attribute.value.prefix(dataSize))
        } else {
            value = attribute.value
        }
        
        self.init(handle: attribute.handle, value: value)
    }
}

// MARK: - DataConvertible

extension ATTHandleValueNotification: DataConvertible {
    
    public init?<Data: DataContainer>(data: Data) {
    
        guard data.count >= 3,
              Self.validateOpcode(data)
            else { return nil }
    
        self.handle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        self.value = data.suffixCheckingBounds(from: 3)
    }
    
    public func append<Data>(to data: inout Data) where Data : DataContainer {
        data += Self.attributeOpcode.rawValue
        data += self.handle.littleEndian
        data += self.value
    }
    
    public var dataLength: Int {
        3 + value.count
    }
}
