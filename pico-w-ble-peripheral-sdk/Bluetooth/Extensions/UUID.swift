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

internal extension UUID {
    
    static var stringLength: Int { return 36 }
    static var unformattedStringLength: Int { return 32 }
}

extension UUID: ByteValue {
        
    public static var bitWidth: Int { return 128 }
    
    public init(bytes: ByteValue) {
        self.init(uuid: bytes)
    }
    
    public var bytes: ByteValue {
        get { return uuid }
        set { self = UUID(uuid: newValue) }
    }
}

// MARK: - DataConvertible

extension UUID: DataConvertible {
    
    public init?<Data: DataContainer>(data: Data) {
        guard data.count == UUID.length
            else { return nil }
        self.init(bytes: (data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7], data[8], data[9], data[10], data[11], data[12], data[13], data[14], data[15]))
    }
}

#if canImport(Foundation)
public extension Foundation.UUID {
    
    typealias ByteValue = uuid_t
}

/// Internal UUID type.
internal struct _UUID: Sendable {
    
    public typealias ByteValue = (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8)
    
    public let uuid: ByteValue
    
    /// Create a UUID from a `uuid_t`.
    public init(uuid: ByteValue) {
        self.uuid = uuid
    }
}

#else

// MARK: - Embedded Swift Support

/// Represents UUID strings, which can be used to uniquely identify types, interfaces, and other items.
public struct UUID: Sendable {
    
    public typealias ByteValue = (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8)
    
    public let uuid: ByteValue
    
    /// Create a UUID from a `uuid_t`.
    public init(uuid: ByteValue) {
        self.uuid = uuid
    }
}

public typealias _UUID = UUID // Built-in UUID type

#endif

extension _UUID {
    
    /// Create a new UUID with RFC 4122 version 4 random bytes.
    public init() {
        var uuidBytes: ByteValue = (
            .random(in: 0...255),
            .random(in: 0...255),
            .random(in: 0...255),
            .random(in: 0...255),
            .random(in: 0...255),
            .random(in: 0...255),
            .random(in: 0...255),
            .random(in: 0...255),
            .random(in: 0...255),
            .random(in: 0...255),
            .random(in: 0...255),
            .random(in: 0...255),
            .random(in: 0...255),
            .random(in: 0...255),
            .random(in: 0...255),
            .random(in: 0...255)
        )
        
        // Set the version to 4 (random UUID)
        uuidBytes.6 = (uuidBytes.6 & 0x0F) | 0x40
        
        // Set the variant to RFC 4122
        uuidBytes.8 = (uuidBytes.8 & 0x3F) | 0x80
        
        self.init(uuid: uuidBytes)
    }
    
    @inline(__always)
    internal func withUUIDBytes<R>(_ work: (UnsafeBufferPointer<UInt8>) throws -> R) rethrows -> R {
        return try withExtendedLifetime(self) {
            try Swift.withUnsafeBytes(of: uuid) { rawBuffer in
                return try rawBuffer.withMemoryRebound(to: UInt8.self) { buffer in
                    return try work(buffer)
                }
            }
        }
    }
    
    /// Create a UUID from a string such as "E621E1F8-C36C-495A-93FC-0C247A3E6E5F".
    ///
    /// Returns nil for invalid strings.
    public init?(uuidString string: String) {
        guard let value = UInt128.bigEndian(uuidString: string) else {
            return nil
        }
        self.init(uuid: value.bytes)
    }
    
    /// Returns a string created from the UUID, such as "E621E1F8-C36C-495A-93FC-0C247A3E6E5F"
    public var uuidString: String {
        UInt128(bytes: uuid).bigEndianUUIDString
    }
}

extension _UUID: Equatable {
    
    public static func ==(lhs: _UUID, rhs: _UUID) -> Bool {
        Swift.withUnsafeBytes(of: lhs) { lhsPtr in
            Swift.withUnsafeBytes(of: rhs) { rhsPtr in
                let lhsTuple = lhsPtr.loadUnaligned(as: (UInt64, UInt64).self)
                let rhsTuple = rhsPtr.loadUnaligned(as: (UInt64, UInt64).self)
                return (lhsTuple.0 ^ rhsTuple.0) | (lhsTuple.1 ^ rhsTuple.1) == 0
            }
        }
    }
}

extension _UUID: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        Swift.withUnsafeBytes(of: uuid) { buffer in
            hasher.combine(bytes: buffer)
        }
    }
}

extension _UUID: CustomStringConvertible, CustomDebugStringConvertible {
    
    public var description: String {
        return uuidString
    }

    public var debugDescription: String {
        return description
    }
}

#if !hasFeature(Embedded)
@available(macOS 10.8, iOS 6.0, tvOS 9.0, watchOS 2.0, *)
extension _UUID : CustomReflectable {
    public var customMirror: Mirror {
        let c : [(label: String?, value: Any)] = []
        let m = Mirror(self, children:c, displayStyle: .struct)
        return m
    }
}

@available(macOS 10.8, iOS 6.0, tvOS 9.0, watchOS 2.0, *)
extension _UUID : Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let uuidString = try container.decode(String.self)

        guard let uuid = _UUID(uuidString: uuidString) else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: decoder.codingPath,
                                                                    debugDescription: "Attempted to decode UUID from invalid UUID string."))
        }

        self = uuid
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(self.uuidString)
    }
}
#endif

extension _UUID : Comparable {

    public static func < (lhs: _UUID, rhs: _UUID) -> Bool {
        var leftUUID = lhs.uuid
        var rightUUID = rhs.uuid
        var result: Int = 0
        var diff: Int = 0
        Swift.withUnsafeBytes(of: &leftUUID) { leftPtr in
            Swift.withUnsafeBytes(of: &rightUUID) { rightPtr in
                for offset in (0 ..< MemoryLayout<ByteValue>.size).reversed() {
                    diff = Int(leftPtr.load(fromByteOffset: offset, as: UInt8.self)) -
                        Int(rightPtr.load(fromByteOffset: offset, as: UInt8.self))
                    // Constant time, no branching equivalent of
                    // if (diff != 0) {
                    //     result = diff;
                    // }
                    result = (result & (((diff - 1) & ~diff) >> 8)) | diff
                }
            }
        }

        return result < 0
    }
}

// MARK: - UUID String

fileprivate extension UInt128 {
    
    /// Parse a UUID string and return a value in big endian order.
    static func bigEndian(uuidString string: String) -> UInt128? {
        guard string.utf8.count == 36,
            let separator = "-".utf8.first else {
            return nil
        }
        let characters = string.utf8
        guard characters[characters.index(characters.startIndex, offsetBy: 8)] == separator,
              characters[characters.index(characters.startIndex, offsetBy: 13)] == separator,
              characters[characters.index(characters.startIndex, offsetBy: 18)] == separator,
              characters[characters.index(characters.startIndex, offsetBy: 23)] == separator,
              let a = String(characters[characters.startIndex ..< characters.index(characters.startIndex, offsetBy: 8)]),
              let b = String(characters[characters.index(characters.startIndex, offsetBy: 9) ..< characters.index(characters.startIndex, offsetBy: 13)]),
              let c = String(characters[characters.index(characters.startIndex, offsetBy: 14) ..< characters.index(characters.startIndex, offsetBy: 18)]),
              let d = String(characters[characters.index(characters.startIndex, offsetBy: 19) ..< characters.index(characters.startIndex, offsetBy: 23)]),
              let e = String(characters[characters.index(characters.startIndex, offsetBy: 24) ..< characters.index(characters.startIndex, offsetBy: 36)])
            else { return nil }
        let hexadecimal = (a + b + c + d + e)
        guard hexadecimal.utf8.count == 32 else {
            return nil
        }
        if #available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *) {
            guard let value = UInt128(hexadecimal: hexadecimal) else {
                return nil
            }
            return value.bigEndian
        } else {
            #if hasFeature(Embedded)
            // should never be executed
            assertionFailure()
            return nil
            #else
            guard let bytes = [UInt8](hexadecimal: hexadecimal),
                  let value = UInt128(data: bytes) else {
                return nil
            }
            return value
            #endif
        }
    }
    
    /// Generate UUID string, e.g. `0F4DD6A4-0F71-48EF-98A5-996301B868F9` from a value initialized in its big endian order.
    var bigEndianUUIDString: String {
        
        let a = (bytes.0.toHexadecimal()
            + bytes.1.toHexadecimal()
            + bytes.2.toHexadecimal()
            + bytes.3.toHexadecimal())
            
        let b = (bytes.4.toHexadecimal()
            + bytes.5.toHexadecimal())
        
        let c = (bytes.6.toHexadecimal()
            + bytes.7.toHexadecimal())

        let d = (bytes.8.toHexadecimal()
            + bytes.9.toHexadecimal())

        let e = (bytes.10.toHexadecimal()
            + bytes.11.toHexadecimal()
            + bytes.12.toHexadecimal()
            + bytes.13.toHexadecimal()
            + bytes.14.toHexadecimal()
            + bytes.15.toHexadecimal())
        
        return a + "-" + b + "-" + c + "-" + d + "-" + e
    }
}

internal extension UInt128 {
    
    /// Parse a UUID string.
    init?(uuidString string: String) {
        guard let bigEndian = Self.bigEndian(uuidString: string) else {
            return nil
        }
        self.init(bigEndian: bigEndian)
    }
    
    /// Generate UUID string, e.g. `0F4DD6A4-0F71-48EF-98A5-996301B868F9`.
    var uuidString: String {
        self.bigEndian.bigEndianUUIDString
    }
}
