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

/// GATT Client Characteristic Configuration Descriptor
///
/// The Client Characteristic Configuration descriptor defines how the characteristic may be
/// configured by a specific client.
///
/// This descriptor shall be persistent across connections for bonded devices.
/// The Client Characteristic Configuration descriptor is unique for each client.
/// A client may read and write this descriptor to determine and set the configuration for that client.
/// Authentication and authorization may be required by the server to write this descriptor.
/// The default value for the Client Characteristic Configuration descriptor is `0x00`.
/// Upon connection of non-binded clients, this descriptor is set to the default value.
@frozen
public struct GATTClientCharacteristicConfiguration: GATTDescriptor, OptionSet, Hashable, Sendable {
    
    public static var uuid: BluetoothUUID { .clientCharacteristicConfiguration }
    
    public var rawValue: UInt16
    
    public init(rawValue: UInt16) {
        self.rawValue = rawValue
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension GATTClientCharacteristicConfiguration: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral rawValue: RawValue) {
        self.init(rawValue: rawValue)
    }
}

// MARK: - DataConvertible

extension GATTClientCharacteristicConfiguration: DataConvertible {
    
    public static var length: Int { 2 }
    
    public init?<Data: DataContainer>(data: Data) {
        
        guard data.count == Self.length
            else { return nil }
        
        let rawValue = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        self.init(rawValue: rawValue)
    }
    
    public func append<Data>(to data: inout Data) where Data : DataContainer {
        data += rawValue.littleEndian
    }
    
    public var dataLength: Int { Self.length }
}

// MARK: - Options

public extension GATTClientCharacteristicConfiguration {
    
    /// Notifications enabled
    static var notify: GATTClientCharacteristicConfiguration { 0b01 }
    
    /// Indications enabled
    static var indicate: GATTClientCharacteristicConfiguration { 0b10 }
}

// MARK: - CustomStringConvertible

extension GATTClientCharacteristicConfiguration: CustomStringConvertible, CustomDebugStringConvertible {
    
    #if hasFeature(Embedded)
    public var description: String {
        "0x" + rawValue.toHexadecimal()
    }
    #else
    @inline(never)
    public var description: String {
        let descriptions: [(GATTClientCharacteristicConfiguration, StaticString)] = [
            (.notify, ".notify"),
            (.indicate, ".indicate")
        ]
        return buildDescription(descriptions)
    }
    #endif

    /// A textual representation of the file permissions, suitable for debugging.
    public var debugDescription: String { self.description }
}
