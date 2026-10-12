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

@frozen
public struct UInt48: ByteValue, Comparable, Sendable {
 
    public typealias ByteValue = (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8)
    
    public static var bitWidth: Int { 48 }
    
    public var bytes: ByteValue
    
    public init(bytes: ByteValue = (0, 0, 0, 0, 0, 0)) {
        self.bytes = bytes
    }
}

public extension UInt48 {
    
    /// The minimum representable value in this type.
    static var min: UInt48 { return UInt48(bytes: (.min, .min, .min, .min, .min, .min)) }
    
    /// The maximum representable value in this type.
    static var max: UInt48 { return UInt48(bytes: (.max, .max, .max, .max, .max, .max)) }
    
    /// The value with all bits set to zero.
    static var zero: UInt48 { return .min }
}

// MARK: - Hashable

extension UInt48: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        Swift.withUnsafeBytes(of: bytes) { hasher.combine(bytes: $0) }
    }
}

// MARK: - Data Convertible

extension UInt48: DataConvertible {
        
    public init?<Data: DataContainer>(data: Data) {
        guard data.count == Self.length else { return nil }
        self.init(bytes: (data[0], data[1], data[2], data[3], data[4], data[5]))
    }
}

// MARK: - Byte Swap

extension UInt48: ByteSwap {
    
    /// A representation of this integer with the byte order swapped.
    public var byteSwapped: UInt48 {
        return UInt48(bytes: (bytes.5, bytes.4, bytes.3, bytes.2, bytes.1, bytes.0))
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension UInt48: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt64) {
        self = UInt48(value)
    }
}

// MARK: - CustomStringConvertible

extension UInt48: CustomStringConvertible {
    
    public var description: String {
        UInt64(self).description
    }
}

// MARK: - Integer Conversion

public extension UInt48 {
    
    /// Initialize from a unsigned 64-bit integer.
    init(_ value: UInt64) {
        
        guard value <= UInt64(UInt48.max)
            else { fatalError("Integer overflow") }
        
        let bytes = value.bigEndian.bytes
        
        self = UInt48(bigEndian: UInt48(bytes: (bytes.2, bytes.3, bytes.4, bytes.5, bytes.6, bytes.7)))
    }
}

public extension UInt64 {
    
    /// Initialize from a unsigned 40-bit integer.
    init(_ value: UInt48) {
        
        let bytes = value.bigEndian.bytes
        self = UInt64(bigEndian: UInt64(bytes: (0, 0, bytes.0, bytes.1, bytes.2, bytes.3, bytes.4, bytes.5)))
    }
}
