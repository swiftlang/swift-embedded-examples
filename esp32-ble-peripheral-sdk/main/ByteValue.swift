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

/// Stores a primitive value. 
///
/// Useful for Swift wrappers for primitive byte types. 
public protocol ByteValue: Equatable {
    
    associatedtype ByteValue
    
    /// Returns the the primitive byte type.
    var bytes: ByteValue { get }
    
    /// Initializes with the primitive the primitive byte type.
    init(bytes: ByteValue)
    
    /// The number of bits used for the underlying binary representation of values of this type.
    static var bitWidth: Int { get }
}

// MARK: - Data Convertible

public extension ByteValue {
    
    /// Size of value in bytes.
    static var length: Int { bitWidth / 8 }
    
    @inline(__always)
    func withUnsafeBytes<R>(_ body: (UnsafeBufferPointer<UInt8>) throws -> R) rethrows -> R {
        return try Swift.withExtendedLifetime(self) {
            try Swift.withUnsafeBytes(of: bytes) { rawBuffer in
                return try rawBuffer.withMemoryRebound(to: UInt8.self) { buffer in
                    return try body(buffer)
                }
            }
        }
    }
}

public extension ByteValue where Self: DataConvertible {
    
    /// Append data representation into buffer.
    func append<Data: DataContainer>(to data: inout Data) {
        withUnsafeBytes { buffer in
            data += buffer
        }
    }
    
    var dataLength: Int {
        Self.length
    }
}

// MARK: - Equatable

extension ByteValue where Self: Equatable {
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.withUnsafeBytes { (b1) in
            rhs.withUnsafeBytes { (b2) in
                b1.elementsEqual(b2)
            }
        }
    }
}

// MARK: - Hashable

extension ByteValue where Self: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        Swift.withUnsafeBytes(of: bytes) { hasher.combine(bytes: $0) }
    }
}

// MARK: - Comparable

extension ByteValue where Self: Comparable {
    
    public static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.withUnsafeBytes { (b1) in
            rhs.withUnsafeBytes { (b2) in
                _memcmp(
                    UnsafeRawPointer(b1.baseAddress),
                    UnsafeRawPointer(b2.baseAddress),
                    Self.length
                ) < 0
            }
        }
    }
    
    public static func > (lhs: Self, rhs: Self) -> Bool {
        lhs.withUnsafeBytes { (b1) in
            rhs.withUnsafeBytes { (b2) in
                _memcmp(
                    UnsafeRawPointer(b1.baseAddress),
                    UnsafeRawPointer(b2.baseAddress),
                    Self.length
                ) > 0
            }
        }
    }
}

// MARK: - CustomStringConvertible

extension ByteValue where Self: CustomStringConvertible {
    
    public var description: String {
        withUnsafeBytes {
            "0x" + $0.toHexadecimal()
        }
    }
}
