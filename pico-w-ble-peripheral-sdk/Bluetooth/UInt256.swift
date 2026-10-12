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

/// A 256 bit number stored according to host endianness.
@frozen
public struct UInt256: ByteValue, Comparable, Sendable {
    
    public typealias ByteValue = (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8)
    
    public static var bitWidth: Int { 256 }
    
    public var bytes: ByteValue
    
    public init(bytes: ByteValue = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)) {
        self.bytes = bytes
    }
}

public extension UInt256 {
    
    /// The minimum representable value in this type.
    static var min: UInt256 { return UInt256(bytes: (.min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min)) }
    
    /// The maximum representable value in this type.
    static var max: UInt256 { return UInt256(bytes: (.max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max)) }
    
    /// The value with all bits set to zero.
    static var zero: UInt256 { return .min }
}

// MARK: - Hashable

extension UInt256: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        Swift.withUnsafeBytes(of: bytes) { hasher.combine(bytes: $0) }
    }
}

// MARK: - Data Convertible

extension UInt256: DataConvertible {
        
    public init?<Data: DataContainer>(data: Data) {
        guard data.count == Self.length else { return nil }
        self.init(bytes: (data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7], data[8], data[9], data[10], data[11], data[12], data[13], data[14], data[15], data[16], data[17], data[18], data[19], data[20], data[21], data[22], data[23], data[24], data[25], data[26], data[27], data[28], data[29], data[30], data[31]))
    }
}

// MARK: - Byte Swap

extension UInt256: ByteSwap {
    
    /// A representation of this integer with the byte order swapped.
    public var byteSwapped: UInt256 {
        
        return UInt256(bytes: (bytes.31,
                               bytes.30,
                               bytes.29,
                               bytes.28,
                               bytes.27,
                               bytes.26,
                               bytes.25,
                               bytes.24,
                               bytes.23,
                               bytes.22,
                               bytes.21,
                               bytes.20,
                               bytes.19,
                               bytes.18,
                               bytes.17,
                               bytes.16,
                               bytes.15,
                               bytes.14,
                               bytes.13,
                               bytes.12,
                               bytes.11,
                               bytes.10,
                               bytes.9,
                               bytes.8,
                               bytes.7,
                               bytes.6,
                               bytes.5,
                               bytes.4,
                               bytes.3,
                               bytes.2,
                               bytes.1,
                               bytes.0))
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension UInt256: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt64) {
        // TODO: Implement `StaticBigInt`
        let bytes = value.bigEndian.bytes
        self = UInt256(bigEndian: UInt256(bytes: (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, bytes.0, bytes.1, bytes.2, bytes.3, bytes.4, bytes.5, bytes.6, bytes.7)))
    }
}

// MARK: - CustomStringConvertible

extension UInt256: CustomStringConvertible { }
