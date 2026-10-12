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

#if canImport(Foundation)
import Foundation
#endif

/// Bluetooth UUID
@frozen
public enum BluetoothUUID: Hashable, Sendable {
    
    case bit16(UInt16)
    case bit32(UInt32)
    case bit128(UInt128)
}

public extension BluetoothUUID {
    
    /// Creates a random 128-bit Bluetooth UUID.
    init() {
        self.init(uuid: UUID())
    }
}

// MARK: - Equatable

extension BluetoothUUID: Equatable {
    
    public static func == (lhs: BluetoothUUID, rhs: BluetoothUUID) -> Bool {
        switch (lhs, rhs) {
        case let (.bit16(lhsValue), .bit16(rhsValue)):
            return lhsValue == rhsValue
        case let (.bit32(lhsValue), .bit32(rhsValue)):
            return lhsValue == rhsValue
        case let (.bit128(lhsValue), .bit128(rhsValue)):
            return lhsValue == rhsValue
        default:
            return false
        }
    }
}

// MARK: - CustomStringConvertible

extension BluetoothUUID: CustomStringConvertible {
    
    public var description: String {
        #if !os(WASI) && !hasFeature(Embedded)
        if let name = self.name {
            return "\(rawValue) (\(name))"
        } else {
            return rawValue
        }
        #else
        return rawValue
        #endif
    }
}

// MARK: - LosslessStringConvertible

extension BluetoothUUID: LosslessStringConvertible {
    
    public init?(_ string: String) {
        #if !os(WASI) && !hasFeature(Embedded)
        var rawValue = string
        var name: String?
        // Find UUID name
        let components = string.split(
            maxSplits: 1,
            omittingEmptySubsequences: true,
            whereSeparator: { $0 == " " }
        )
        if components.count == 2 {
            rawValue = String(components[0])
            name = String(components[1])
            // remove parenthesis
            if name?.first == "(", name?.last == ")" {
                name?.removeFirst()
                name?.removeLast()
            }
        }
        self.init(rawValue: rawValue)
        // validate name
        if let name {
            guard name == self.name else {
                return nil
            }
        }
        #else
        self.init(rawValue: string)
        #endif
    }
}

// MARK: - RawRepresentable

extension BluetoothUUID: RawRepresentable {
    
    /// Initialize from a UUID string (in big endian representation).
    ///
    /// - Example: "60F14FE2-F972-11E5-B84F-23E070D5A8C7", "000000A8", "00A8"
    public init?(rawValue: String) {
        
        switch rawValue.utf8.count {
            
        case 4:
            
            guard let value = UInt16(hexadecimal: rawValue)
                else { return nil }
            self = .bit16(value)
            
        case 8:
            
            guard let value = UInt32(hexadecimal: rawValue)
                else { return nil }
            self = .bit32(value)
            
        case 36:
            
            guard let uuid = UInt128(uuidString: rawValue)
                else { return nil }
            self = .bit128(uuid)
            
        default:
            return nil
        }
    }
    
    public var rawValue: String {
        switch self {
        case let .bit16(value):
            return value.toHexadecimal()
        case let .bit32(value):
            return value.toHexadecimal()
        case let .bit128(value):
            return value.uuidString
        }
    }
}

// MARK: - Data

extension BluetoothUUID: DataConvertible {
    
    public init?<Data: DataContainer>(data: Data) {
    
        guard let length = Length(rawValue: data.count)
            else { return nil }
        
        switch length {
            
        // 16 bit
        case .bit16:
            
            let value = UInt16(bytes: (data[0], data[1]))
            self = .bit16(value)
            
        // 32 bit
        case .bit32:
            
            let value = UInt32(bytes: (data[0], data[1], data[2], data[3]))
            self = .bit32(value)
            
        // 128 bit
        case .bit128:
            
            let value = UInt128(bytes: (data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7], data[8], data[9], data[10], data[11], data[12], data[13], data[14], data[15]))
            self = .bit128(value)
        }
    }
    
    public var dataLength: Int {
        length.rawValue
    }
    
    public func append<Data>(to data: inout Data) where Data : DataContainer {
        switch self {
        case let .bit16(value):
            data += value
        case let .bit32(value):
            data += value
        case let .bit128(value):
            data += value
        }
    }
}

internal extension BluetoothUUID {
    
    /// Number of bytes to represent Bluetooth UUID.
    enum Length: Int {
        
        case bit16 = 2
        case bit32 = 4
        case bit128 = 16
    }
    
    private var length: Length {
        
        switch self {
        case .bit16: return .bit16
        case .bit32: return .bit32
        case .bit128: return .bit128
        }
    }
}

// MARK: - Codable

#if !hasFeature(Embedded)
extension BluetoothUUID: Codable { }
#endif

// MARK: - Byte Swap

extension BluetoothUUID: ByteSwap {
    
    /// A representation of this Bluetooth UUID with the byte order swapped.
    public var byteSwapped: BluetoothUUID {
        
        switch self {
        case let .bit16(value): return .bit16(value.byteSwapped)
        case let .bit32(value): return .bit32(value.byteSwapped)
        case let .bit128(value): return .bit128(value.byteSwapped)
        }
    }
}

// MARK: - UInt128 Conversion

public extension BluetoothUUID {
    
    /// Bluetooth Base UUID (big endian)
    internal static var baseUUID: UInt128 { return UInt128(bytes: (0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00,
                                                                   0x80, 0x00, 0x00, 0x80, 0x5F, 0x9B, 0x34, 0xFB)) }
    
}

public extension UInt128 {
    
    /// Forceably convert `BluetoothUUID` to `UInt128` value.
    init(_ bluetoothUUID: BluetoothUUID) {
        
        switch bluetoothUUID {
            
        case let .bit16(value):
            
            let bytes = value.bigEndian.bytes
            var bigEndianValue = BluetoothUUID.baseUUID
            
            bigEndianValue.bytes.2 = bytes.0
            bigEndianValue.bytes.3 = bytes.1
            
            self = UInt128(bigEndian: bigEndianValue)
            
        case let .bit32(value):
            
            let bytes = value.bigEndian.bytes
            var bigEndianValue = BluetoothUUID.baseUUID
            
            bigEndianValue.bytes.0 = bytes.0
            bigEndianValue.bytes.1 = bytes.1
            bigEndianValue.bytes.2 = bytes.2
            bigEndianValue.bytes.3 = bytes.3
            
            self = UInt128(bigEndian: bigEndianValue)
            
        case let .bit128(value):
            
            self = value
        }
    }
}

public extension BluetoothUUID {
    
    /// Forceably convert `BluetoothUUID` to `UInt128` value.
    var bit128: BluetoothUUID {
        let value = UInt128(self)
        return .bit128(value)
    }
}

internal extension UUID {
    
    @inline(__always)
    func bluetoothPrefix() -> (UInt8, UInt8, UInt8, UInt8)? {
        
        // big endian
        let baseUUID = BluetoothUUID.baseUUID.bytes
        
        guard bytes.4 == baseUUID.4,
            bytes.5 == baseUUID.5,
            bytes.6 == baseUUID.6,
            bytes.7 == baseUUID.7,
            bytes.8 == baseUUID.8,
            bytes.9 == baseUUID.9,
            bytes.10 == baseUUID.10,
            bytes.11 == baseUUID.11,
            bytes.12 == baseUUID.12,
            bytes.13 == baseUUID.13,
            bytes.14 == baseUUID.14,
            bytes.15 == baseUUID.15
            else { return nil }
        
        return (bytes.0, bytes.1, bytes.2, bytes.3)
    }
}

public extension UInt16 {
    
    /// Attempt to extract Bluetooth 16-bit UUID from standard 128-bit UUID.
    init?(bluetooth uuid: UUID) {
        
        guard let prefixBytes = uuid.bluetoothPrefix(),
            prefixBytes.0 == 0,
            prefixBytes.1 == 0
            else { return nil }
        
        self.init(bigEndian: UInt16(bytes: (prefixBytes.2, prefixBytes.3)))
    }
}

public extension UInt32 {
    
    /// Attempt to extract Bluetooth 32-bit UUID from standard 128-bit UUID.
    init?(bluetooth uuid: UUID) {
        
        guard let prefixBytes = uuid.bluetoothPrefix()
            else { return nil }
        
        self.init(bigEndian: UInt32(bytes: (prefixBytes.0, prefixBytes.1, prefixBytes.2, prefixBytes.3)))
    }
}

// MARK: - NSUUID Conversion

public extension BluetoothUUID {
    
    /// Initialize from a `Foundation.UUID`.
    init(uuid: UUID) {
        self = .bit128(UInt128(uuid: uuid))
    }
}

public extension UUID {
    
    /// Initialize and convert from a Bluetooth UUID.
    init(bluetooth uuid: BluetoothUUID) {
        self.init(UInt128(uuid))
    }
}

// MARK: - CoreBluetooth

#if canImport(CoreBluetooth)
import CoreBluetooth

public extension BluetoothUUID {
    
    init(_ coreBluetooth: CBUUID) {
        
        guard let uuid = BluetoothUUID(data: coreBluetooth.data)
            else { fatalError("Could not create Bluetooth UUID from \(coreBluetooth)") }
        
        // CBUUID is always big endian
        self.init(bigEndian: uuid)
    }
}

public extension CBUUID {
    
    convenience init(_ bluetoothUUID: BluetoothUUID) {
        self.init(data: Data(bluetoothUUID.bigEndian))
    }
}

#endif
