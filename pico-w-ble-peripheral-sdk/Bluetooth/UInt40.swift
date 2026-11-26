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

/// A 40 bit number stored according to host endianness.
@frozen
public struct UInt40: ByteValue, Comparable, Sendable {
    
    public typealias ByteValue = (UInt8, UInt8, UInt8, UInt8, UInt8)
    
    public static var bitWidth: Int { 40 }
    
    public var bytes: ByteValue
    
    public init(bytes: ByteValue = (0, 0, 0, 0, 0)) {
        
        self.bytes = bytes
    }
}

public extension UInt40 {
    
    /// The minimum representable value in this type.
    static var min: UInt40 { return UInt40(bytes: (.min, .min, .min, .min, .min)) }
    
    /// The maximum representable value in this type.
    static var max: UInt40 { return UInt40(bytes: (.max, .max, .max, .max, .max)) }
    
    /// The value with all bits set to zero.
    static var zero: UInt40 { return .min }
}

// MARK: - Hashable

extension UInt40: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        Swift.withUnsafeBytes(of: bytes) { hasher.combine(bytes: $0) }
    }
}

// MARK: - Data Convertible

extension UInt40: DataConvertible {
        
    public init?<Data: DataContainer>(data: Data) {
        guard data.count == UInt40.length else { return nil }
        self.init(bytes: (data[0], data[1], data[2], data[3], data[4]))
    }
}

// MARK: - Byte Swap

extension UInt40: ByteSwap {
    
    /// A representation of this integer with the byte order swapped.
    public var byteSwapped: UInt40 {
        return UInt40(bytes: (bytes.4, bytes.3, bytes.2, bytes.1, bytes.0))
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension UInt40: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt64) {
        self = UInt40(value)
    }
}

// MARK: - CustomStringConvertible

extension UInt40: CustomStringConvertible {
    
    public var description: String {
        UInt64(self).description
    }
}

// MARK: - Integer Conversion

public extension UInt40 {
    
    /// Initialize from a unsigned 64-bit integer.
    init(_ value: UInt64) {
        guard value <= UInt64(UInt40.max)
            else { fatalError("Integer overflow") }
        let bytes = value.bigEndian.bytes
        self = UInt40(bigEndian: UInt40(bytes: (bytes.3, bytes.4, bytes.5, bytes.6, bytes.7)))
    }
}

public extension UInt64 {
    
    /// Initialize from a unsigned 40-bit integer.
    init(_ value: UInt40) {
        let bytes = value.bigEndian.bytes
        self = UInt64(bigEndian: UInt64(bytes: (0, 0, 0, bytes.0, bytes.1, bytes.2, bytes.3, bytes.4)))
    }
}
