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

// MARK: - ByteValue

extension UInt128: ByteValue {
    
    public typealias ByteValue = (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8)
        
    public var bytes: ByteValue {
      @_transparent
      get {
          unsafeBitCast(self, to: ByteValue.self)
      }
    
      @_transparent
      set {
          self = .init(bytes: newValue)
      }
    }
    
    public init(bytes: ByteValue) {
        self = unsafeBitCast(bytes, to: Self.self)
    }
}

// MARK: - Data Convertible

extension UInt128: DataConvertible {
        
    public init?<Data: DataContainer>(data: Data) {
        guard data.count == UInt128.length
            else { return nil }
        self.init(bytes: (data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7], data[8], data[9], data[10], data[11], data[12], data[13], data[14], data[15]))
    }
    
    public func append<Data: DataContainer>(to data: inout Data) {
        unsafeAppend(to: &data)
    }
    
    /// Length of value when encoded into data.
    public var dataLength: Int { Self.length }
}

// MARK: - UUID

public extension UInt128 {
    
    init(uuid: UUID) {
        /// UUID is always big endian
        let bigEndian = UInt128(bytes: uuid.uuid)
        self.init(bigEndian: bigEndian)
    }
}

public extension UUID {
    
    init(_ value: UInt128) {
        
        // UUID is always stored in big endian bytes
        let bytes = value.bigEndian.bytes
        
        self.init(bytes: (bytes.0,
                          bytes.1,
                          bytes.2,
                          bytes.3,
                          bytes.4,
                          bytes.5,
                          bytes.6,
                          bytes.7,
                          bytes.8,
                          bytes.9,
                          bytes.10,
                          bytes.11,
                          bytes.12,
                          bytes.13,
                          bytes.14,
                          bytes.15))
    }
}

// MARK: - Backwards compatibility

internal extension UInt128 {
    
    var hexadecimal: String {
        let bytes = self.bigEndian.bytes
        return bytes.0.toHexadecimal()
            + bytes.1.toHexadecimal()
            + bytes.2.toHexadecimal()
            + bytes.3.toHexadecimal()
            + bytes.4.toHexadecimal()
            + bytes.5.toHexadecimal()
            + bytes.6.toHexadecimal()
            + bytes.7.toHexadecimal()
            + bytes.8.toHexadecimal()
            + bytes.9.toHexadecimal()
            + bytes.10.toHexadecimal()
            + bytes.11.toHexadecimal()
            + bytes.12.toHexadecimal()
            + bytes.13.toHexadecimal()
            + bytes.14.toHexadecimal()
            + bytes.15.toHexadecimal()
    }
}

#if canImport(Darwin)
/// A 128-bit signed integer value type.
@frozen
public struct UInt128: Sendable {
    
#if _endian(little)
  public var _low: UInt64
  public var _high: UInt64
#else
  public var _high: UInt64
  public var _low: UInt64
#endif

  @_transparent
  public init(_low: UInt64, _high: UInt64) {
    self._low = _low
    self._high = _high
  }
  
  // Allow conversion if type is available.
  @available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *)
  public var _value: Int128 {
    @_transparent
    get {
      unsafeBitCast(self, to: Int128.self)
    }

    @_transparent
    set {
      self = Self(newValue)
    }
  }
  
  @available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *)
  @_transparent
  public init(_ _value: Int128) {
    self = unsafeBitCast(_value, to: Self.self)
  }

  /// Creates a new instance with the same memory representation as the given
  /// value.
  ///
  /// This initializer does not perform any range or overflow checking. The
  /// resulting instance may not have the same numeric value as
  /// `bitPattern`---it is only guaranteed to use the same pattern of bits in
  /// its binary representation.
  ///
  /// - Parameter bitPattern: A value to use as the source of the new instance's
  ///   binary representation.
  @available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *)
  @_transparent
  public init(bitPattern: Int128) {
    self.init(bitPattern)
  }
}

@available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *)
public extension Bluetooth.UInt128 {
    
    init(_ value: Swift.UInt128) {
        self.init(_low: value._low, _high: value._high)
    }
}

@available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *)
public extension Swift.UInt128 {
    
    init(_ value: Bluetooth.UInt128) {
        self.init(bitPattern: value._value)
    }
}

// MARK: - Constants

extension Bluetooth.UInt128 {
  @_transparent
  public static var zero: Self {
      Self(_low: .min, _high: .min)
  }

  @_transparent
  public static var min: Self {
    zero
  }

  @_transparent
  public static var max: Self {
    Self(_low: .max, _high: .max)
  }
}

// MARK: - ExpressibleByIntegerLiteral

@available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *)
extension Bluetooth.UInt128: ExpressibleByIntegerLiteral {
    
    public typealias IntegerLiteralType = Swift.UInt128
    
    public init(integerLiteral value: Swift.UInt128) {
        self.init(_low: value._low, _high: value._high)
    }
}

// MARK: - Conversions

extension Bluetooth.UInt128 {

  @inlinable
  public init?<T>(exactly source: T) where T: BinaryInteger {
    guard let high = UInt64(exactly: source >> 64) else { return nil }
    let low = UInt64(truncatingIfNeeded: source)
    self.init(_low: low, _high: high)
  }

  @inlinable
  public init<T>(_ source: T) where T: BinaryInteger {
    guard let value = Self(exactly: source) else {
      fatalError("value cannot be converted to UInt128 because it is outside the representable range")
    }
    self = value
  }

  @inlinable
  public init<T>(clamping source: T) where T: BinaryInteger {
    guard let value = Self(exactly: source) else {
      self = source < .zero ? .zero : .max
      return
    }
    self = value
  }

  @inlinable
  public init<T>(truncatingIfNeeded source: T) where T: BinaryInteger {
    let high = UInt64(truncatingIfNeeded: source >> 64)
    let low = UInt64(truncatingIfNeeded: source)
    self.init(_low: low, _high: high)
  }

  @_transparent
  public init(_truncatingBits source: UInt) {
    self.init(_low: UInt64(source), _high: .zero)
  }
}

extension UInt128 {
  @inlinable
  public init?<T>(exactly source: T) where T: BinaryFloatingPoint {
    let highAsFloat = (source * 0x1.0p-64).rounded(.towardZero)
    guard let high = UInt64(exactly: highAsFloat) else { return nil }
    guard let low = UInt64(
      exactly: high == 0 ? source : source - 0x1.0p64*highAsFloat
    ) else { return nil }
    self.init(_low: low, _high: high)
  }

  @inlinable
  public init<T>(_ source: T) where T: BinaryFloatingPoint {
    guard let value = Self(exactly: source.rounded(.towardZero)) else {
      fatalError("value cannot be converted to UInt128 because it is outside the representable range")
    }
    self = value
  }
}

// MARK: - Equatable

extension Bluetooth.UInt128: Equatable {
    
    public static func == (lhs: UInt128, rhs: UInt128) -> Bool {
        return lhs._low == rhs._low
            && lhs._high == rhs._high
    }
}

// MARK: - Hashable

extension Bluetooth.UInt128: Hashable {
    
    @inlinable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(_low)
        hasher.combine(_high)
    }
}

// MARK: - Comparable

@available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *)
extension Bluetooth.UInt128: Comparable {
    
    @_transparent
    public static func < (lhs: Self, rhs: Self) -> Bool {
        Swift.UInt128(lhs) < Swift.UInt128(rhs)
    }
}

// MARK: - CustomStringConvertible

extension Bluetooth.UInt128: CustomStringConvertible {
    
    public var description: String {
        if #available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *) {
            return Swift.UInt128(self).description
        } else {
            return "0x" + hexadecimal
        }
    }
}

// MARK: - Numeric

@available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *)
extension UInt128: Numeric {
  public typealias Magnitude = Self

  @_transparent
  public var magnitude: Self {
    self
  }
}

// MARK: - AdditiveArithmetic

@available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *)
extension UInt128: AdditiveArithmetic {
  @_transparent
  public static func + (a: Self, b: Self) -> Self {
      Bluetooth.UInt128(Swift.UInt128(a) + Swift.UInt128(b))
  }

  @_transparent
  public static func - (a: Self, b: Self) -> Self {
      Bluetooth.UInt128(Swift.UInt128(a) - Swift.UInt128(b))
  }
}

// MARK: - Multiplication and division

@available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *)
extension UInt128 {
  @_transparent
  public static func * (a: Self, b: Self) -> Self {
      Bluetooth.UInt128(Swift.UInt128(a) * Swift.UInt128(b))
  }

  @_transparent
  public static func *= (a: inout Self, b: Self) {
    a = a * b
  }

  @_transparent
  public static func /(a: Self, b: Self) -> Self {
    a.dividedReportingOverflow(by: b).partialValue
  }

  @_transparent
  public static func /=(a: inout Self, b: Self) {
    a = a / b
  }

  @_transparent
  public static func %(a: Self, b: Self) -> Self {
    a.remainderReportingOverflow(dividingBy: b).partialValue
  }

  @_transparent
  public static func %=(a: inout Self, b: Self) {
    a = a % b
  }
}

// MARK: - Overflow-reporting arithmetic

@available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *)
extension UInt128 {
  @_transparent
  public func addingReportingOverflow(
    _ other: Self
  ) -> (partialValue: Self, overflow: Bool) {
      let (partialValue, overflow) = Swift.UInt128(self).addingReportingOverflow(.init(other))
      return (Self(partialValue), overflow)
  }

  @_transparent
  public func subtractingReportingOverflow(
    _ other: Self
  ) -> (partialValue: Self, overflow: Bool) {
      let (partialValue, overflow) = Swift.UInt128(self).subtractingReportingOverflow(.init(other))
      return (Self(partialValue), overflow)
  }

  @_transparent
  public func multipliedReportingOverflow(
    by other: Self
  ) -> (partialValue: Self, overflow: Bool) {
      let (partialValue, overflow) = Swift.UInt128(self).multipliedReportingOverflow(by: .init(other))
      return (Self(partialValue), overflow)
  }

  @_transparent
  public func dividedReportingOverflow(
    by other: Self
  ) -> (partialValue: Self, overflow: Bool) {
    precondition(other != .zero, "Division by zero")
      let (partialValue, overflow) = Swift.UInt128(self).dividedReportingOverflow(by: .init(other))
      return (Self(partialValue), overflow)
  }

  @_transparent
  public func remainderReportingOverflow(
    dividingBy other: Self
  ) -> (partialValue: Self, overflow: Bool) {
    precondition(other != .zero, "Division by zero in remainder operation")
      let (partialValue, overflow) = Swift.UInt128(self).remainderReportingOverflow(dividingBy: .init(other))
      return (Self(partialValue), overflow)
  }
}

// MARK: - BinaryInteger conformance

@available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *)
extension Bluetooth.UInt128: BinaryInteger {
    
    public typealias Words = Swift.UInt128.Words

  @_transparent
  public var words: Words {
      Words(_value: .init(self))
  }

  @_transparent
  public static func &=(a: inout Self, b: Self) {
      a = Bluetooth.UInt128(Swift.UInt128(a) & Swift.UInt128(b))
  }

  @_transparent
  public static func |=(a: inout Self, b: Self) {
      a = Bluetooth.UInt128(Swift.UInt128(a) | Swift.UInt128(b))
  }

  @_transparent
  public static func ^=(a: inout Self, b: Self) {
      a = Bluetooth.UInt128(Swift.UInt128(a) ^ Swift.UInt128(b))
  }

  @_transparent
  public static func &>>=(a: inout Self, b: Self) {
      a = Bluetooth.UInt128(Swift.UInt128(a) &>> Swift.UInt128(b))
  }

  @_transparent
  public static func &<<=(a: inout Self, b: Self) {
      a = Bluetooth.UInt128(Swift.UInt128(a) &<< Swift.UInt128(b))
  }

  @_transparent
  public var trailingZeroBitCount: Int {
    _low == 0 ? 64 + _high.trailingZeroBitCount : _low.trailingZeroBitCount
  }

  @_transparent
  public var _lowWord: UInt {
      Swift.UInt128(self)._lowWord
  }
}

// MARK: - FixedWidthInteger conformance

@available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *)
extension UInt128: FixedWidthInteger, UnsignedInteger { }

public extension UInt128 {
    
    @_transparent
    static var bitWidth: Int { 128 }
    
    @_transparent
    var nonzeroBitCount: Int {
      _high.nonzeroBitCount &+ _low.nonzeroBitCount
    }

    @_transparent
    var leadingZeroBitCount: Int {
      _high == 0 ? 64 + _low.leadingZeroBitCount : _high.leadingZeroBitCount
    }
    
    @_transparent
    var byteSwapped: Self {
      return Self(_low: _high.byteSwapped, _high: _low.byteSwapped)
    }
    
    /// Creates an instance from its little-endian representation, changing the
    /// byte order if necessary.
    ///
    /// - Parameter value: A value to use as the little-endian representation of
    ///   the new instance.
    init(littleEndian value: Self) {
        #if _endian(little)
        self = value
        #else
        self = value.byteSwapped
        #endif
    }
    
    /// Creates an instance from its big-endian representation, changing the byte
    /// order if necessary.
    ///
    /// - Parameter value: A value to use as the big-endian representation of the
    ///   new instance.
    init(bigEndian value: Self) {
        #if _endian(big)
        self = value
        #else
        self = value.byteSwapped
        #endif
    }
    
    /// The little-endian representation of this value.
    ///
    /// If necessary, the byte order of this value is reversed from the typical
    /// byte order of this address. On a little-endian platform, for any
    /// address `x`, `x == x.littleEndian`.
    var littleEndian: Self {
        #if _endian(little)
        return self
        #else
        return byteSwapped
        #endif
    }
    
    /// The big-endian representation of this value.
    ///
    /// If necessary, the byte order of this value is reversed from the typical
    /// byte order of this address. On a big-endian platform, for any
    /// address `x`, `x == x.bigEndian`.
    var bigEndian: Self {
        #if _endian(big)
        return self
        #else
        return byteSwapped
        #endif
    }
}

// MARK: - Integer comparison type inference

extension UInt128 {
  // IMPORTANT: The following four apparently unnecessary overloads of
  // comparison operations are necessary for literal comparands to be
  // inferred as the desired type.
  @_transparent @_alwaysEmitIntoClient
  public static func != (lhs: Self, rhs: Self) -> Bool {
    return !(lhs == rhs)
  }

    @available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *)
  @_transparent @_alwaysEmitIntoClient
  public static func <= (lhs: Self, rhs: Self) -> Bool {
    return !(rhs < lhs)
  }

    @available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *)
  @_transparent @_alwaysEmitIntoClient
  public static func >= (lhs: Self, rhs: Self) -> Bool {
    return !(lhs < rhs)
  }

    @available(macOS 15, iOS 18, watchOS 11, tvOS 18, visionOS 2, *)
  @_transparent @_alwaysEmitIntoClient
  public static func > (lhs: Self, rhs: Self) -> Bool {
    return rhs < lhs
  }
}

#else
public typealias UInt128 = Swift.UInt128
#endif
