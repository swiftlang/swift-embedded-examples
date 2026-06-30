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

/// GATT Characteristic Properties Bitfield valuess
public struct GATTCharacteristicProperties: OptionSet, Hashable, Sendable {
    
    public var rawValue: UInt8
    
    public init(rawValue: UInt8) {
        self.rawValue = rawValue
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension GATTCharacteristicProperties: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt8) {
        self.rawValue = value
    }
}

// MARK: CustomStringConvertible

extension GATTCharacteristicProperties: CustomStringConvertible, CustomDebugStringConvertible {
    
    public var description: String {
        "0x" + rawValue.toHexadecimal()
    }

    /// A textual representation of the file permissions, suitable for debugging.
    public var debugDescription: String { self.description }
}

// MARK: - Options

public extension GATTCharacteristicProperties {
    
    static var broadcast: GATTCharacteristicProperties            { 0x01 }
    static var read: GATTCharacteristicProperties                 { 0x02 }
    static var writeWithoutResponse: GATTCharacteristicProperties { 0x04 }
    static var write: GATTCharacteristicProperties                { 0x08 }
    static var notify: GATTCharacteristicProperties               { 0x10 }
    static var indicate: GATTCharacteristicProperties             { 0x20 }
    
    /// Characteristic supports write with signature
    static var signedWrite: GATTCharacteristicProperties          { 0x40 } // BT_GATT_CHRC_PROP_AUTH
    
    static var extendedProperties: GATTCharacteristicProperties   { 0x80 }
}
