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

/// Signed Write Command
///
/// The Signed Write Command is used to request the server to write the value of an attribute with an authentication signature,
/// typically into a control-point attribute.
@frozen
public struct ATTSignedWriteCommand<Value: DataContainer>: ATTProtocolDataUnit {
    
    public typealias Signature = (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8)
    
    public static var attributeOpcode: ATTOpcode { .signedWriteCommand }
    
    /// The handle of the attribute to be set.
    public var handle: UInt16
    
    /// The value to be written to the attribute
    public var value: Value
    
    /// Authentication signature for the Attribute Upload, Attribute Handle and Attribute Value Parameters.
    public var signature: Signature
    
    public init(
        handle: UInt16,
        value: Value,
        signature: Signature
    ) {
        self.handle = handle
        self.value = value
        self.signature = signature
    }
}

extension ATTSignedWriteCommand: DataConvertible {
    
    /// Minimum length
    internal static var minimumLength: Int { 15 }
    
    public init?<Data: DataContainer>(data: Data) {
        
        guard data.count >= Self.minimumLength,
            Self.validateOpcode(data)
            else { return nil }
        
        self.handle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        
        if data.count > Self.minimumLength {
            self.value = Value(data[3 ..< data.count - 12])
            
        } else {
            self.value = Value()
        }
        
        self.signature = (data[data.count - 12],
                          data[data.count - 11],
                          data[data.count - 10],
                          data[data.count - 9],
                          data[data.count - 8],
                          data[data.count - 7],
                          data[data.count - 6],
                          data[data.count - 5],
                          data[data.count - 4],
                          data[data.count - 3],
                          data[data.count - 2],
                          data[data.count - 1])
    }
    
    public func append<Data>(to data: inout Data) where Data : DataContainer {
        data += Self.attributeOpcode.rawValue
        data += handle.littleEndian
        data += value
        data += signature
    }
    
    public var dataLength: Int {
        Self.minimumLength + value.count
    }
}
