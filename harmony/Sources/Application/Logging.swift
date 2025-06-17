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

// Log the given string to serial.
//
// Like `print`, this function supports string interpolations, but performs no
// intermediate allocation.
//
// Usage:
//
// ```
// let target: StaticString = "world"
// log("hello, \(target)")
// ```
//
// New types may be supported by implementing the `Loggable` protocol
// or extending the `StreamingInterpolation` struct.
func log(
  _ message: @autoclosure () -> StreamingSerialMessage,
  terminator: StaticString = "\n"
) {
  _ = message()
  SerialPrinter().write(terminator)
}

/// An implementation of `CharacterPrinter` that calls `putchar` to write to serial.
struct SerialPrinter: CharacterPrinter {
  func write(rawByte: UInt8) {
    _ = putchar(CInt(rawByte))
  }

  func write(contentsOf: Self) {
    // Don't need to handle nested SerialPrinter objects: they will have
    // already written out to serial.
  }
}

// String interpolation objects cast to this type will be streamed
// to serial via calls to `putchar`.
typealias StreamingSerialMessage = StreamingMessage<SerialPrinter>

/// This file provides functionality for logging interpolated strings without
/// requiring construction of String types (which are not available in Embedded
/// Swift).

/// Types that implement `Loggable` are able to be logged using the
/// `StreamingInterpolation` mechanisms.
///
/// The `write` function should write a human-readable instance of the object to
/// the passed-in `Printer` type:
///
///     struct MyType: Loggable {
///         func write<Printer: CharacterPrinter>(to printer: Printer) {
///             printer.write("A static string")
///             printer.write(42)
///             printer.write(anyLoggableItem)
///             printer.write("A more \(complex) string \(interpolation)")
///         }
///     }
protocol Loggable: ~Copyable {
  func write<Printer: CharacterPrinter>(to: Printer)
}

/// A type that supports printing individual characters.
///
/// Characters can either be streamed directly out to a log (e.g. stdout), or
/// buffered any manually written out by the user.
protocol CharacterPrinter {
  /// Initialize a new instance.
  ///
  /// Unfortunately, Swift calls this from within the compiler's generated
  /// code, with a fresh object created each time string interpolation is
  /// used, and no chance to have any instance variables.
  init()

  /// Write a single byte to output.
  func write(rawByte: UInt8)

  /// Write the contents of the given `CharacterPrinter` to this
  /// `CharacterPrinter`.
  ///
  /// This method is required to be implemented so that implementors of the
  /// `Loggable` protocol can themselves use String Interpolation.
  ///
  /// Implementations of `CharacterPrinter` that don't buffer anything (for
  /// example, if they just forward characters directly to `stdout`) need not
  /// do anything here. However, implementations of `CharacterPrinter` that
  /// are attempting to buffer the text will need to append the contents of
  /// the child `CharacterPrinter` into the parent `CharacterPrinter`.
  func write(contentsOf: Self)
}

// Convenience functions for writing basic objects to a CharacterPrinter.
//
// Most types should either just implement `Loggable` (preferred), or implement
// their type as an overload to `StreamingInterpolation.appendInterpolation`
// directly (for generic types or types requiring additional parameters).
extension CharacterPrinter {
  /// Write the given object that implements the `Loggable` interface to the
  /// printer.
  func write(_ value: some Loggable) {
    value.write(to: self)
  }

  /// Write an integer to the printer.
  func write(_ value: some FixedWidthInteger) {
    value.write(to: self)
  }

  /// Write the given buffer to the printer.
  ///
  /// This function will print the entire buffer, including NUL bytes and
  /// anything following them. To print NUL-terminated strings, see the
  /// overload `write(nulTerminated)`.
  func write(contentsOf buffer: UnsafeBufferPointer<UInt8>) {
    self.write(contentsOf: UnsafeRawBufferPointer(buffer))
  }

  /// Write the given buffer to the printer.
  ///
  /// This function will print the entire buffer, including NUL bytes and
  /// anything following them. To print NUL-terminated strings, see the
  /// overload `write(nulTerminated)`.
  @inline(never)  // avoid aggressive inlining of non-perf-sensitive code
  func write(contentsOf buffer: UnsafeRawBufferPointer) {
    for c in buffer {
      self.write(rawByte: c)
    }
  }

  /// Write a NULL-terminated (C style) string to the printer.
  @inline(never)  // avoid aggressive inlining of non-perf-sensitive code
  func write(nullTerminated value: UnsafeBufferPointer<CChar>) {
    for c in value {
      if c == 0 {
        break
      }
      self.write(rawByte: UInt8(c))
    }
  }

  // Write the given interpolated string to this character printer.
  //
  // This allows implementations of `Loggable` to themselves use interpolated
  // strings:
  //
  // ```
  // class MyClass: Loggable {
  //     func write<P: CharacterPrinter>(printer: P) {
  //         printer.write("hello, \(self.world)")
  //     }
  // }
  // ```
  @_disfavoredOverload
  func write(_ value: @autoclosure () -> StreamingMessage<Self>) {
    self.write(contentsOf: value().printer)
  }
}

// Loggable implementation for various types.
extension Bool: Loggable {
  func write<Printer: CharacterPrinter>(to printer: Printer) {
    if self {
      printer.write("true")
    } else {
      printer.write("false")
    }
  }
}

extension StaticString: Loggable {
  func write<Printer: CharacterPrinter>(to printer: Printer) {
    self.withUTF8Buffer {
      printer.write(contentsOf: $0)
    }
  }
}

extension UnsafeRawBufferPointer: Loggable {
  func write<Printer: CharacterPrinter>(to printer: Printer) {
    let base = UInt(bitPattern: self.baseAddress)
    printer.write("\(hex: base), count: \(self.count)")
  }
}

extension UnsafeMutableRawBufferPointer: Loggable {
  func write<Printer: CharacterPrinter>(to printer: Printer) {
    printer.write(UnsafeRawBufferPointer(self))
  }
}

extension CharacterPrinter {
  // Write the given UInt64 to a CharacterPrinter.
  //
  // We use this function so that all integer sizes can reuse the same version of
  // the code in the compiled binary.
  @inline(never)
  fileprivate func write(value: UInt64, isNegative: Bool, radix: Int) {
    precondition(radix == 10 || radix == 16)

    // Special case for zero, which otherwise would have no digits printed for
    // it in the algorithm below.
    if value == 0 {
      if radix == 16 {
        self.write("0x0")
      } else {
        self.write("0")
      }
      return
    }

    // Convert the given digit to its ASCII code.
    func _ascii(_ digit: UInt8) -> UInt8 {
      if digit < 10 {
        UInt8(("0" as Unicode.Scalar).value) + digit
      } else {
        UInt8(("a" as Unicode.Scalar).value) + (digit - 10)
      }
    }

    // Render to a temporary buffer.
    //
    // Worst case: 64-bit type and radix 10, requires `ceil(log_10(2**64)) == 20`
    // characters to render. We use another for the negative sign, and another two
    // for the `0x` prefix on base 16.
    withUnsafeTemporaryAllocation(byteCount: 32, alignment: 1) { buffer in
      var index = buffer.count - 1
      var value = value
      while value != 0 {
        let (quotient, remainder) = value.quotientAndRemainder(
          dividingBy: UInt64(radix))
        buffer[index] = _ascii(UInt8(truncatingIfNeeded: remainder))
        index -= 1
        value = quotient
      }
      if radix == 16 {
        buffer[index - 1] = UInt8(("0" as Unicode.Scalar).value)
        buffer[index - 0] = UInt8(("x" as Unicode.Scalar).value)
        index -= 2
      }
      if isNegative {
        buffer[index] = UInt8(("-" as Unicode.Scalar).value)
        index -= 1
      }
      let start = index + 1
      let end = buffer.count - 1
      let count = end - start + 1
      self.write(
        contentsOf:
          UnsafeBufferPointer(
            start: buffer.baseAddress?.advanced(by: start).assumingMemoryBound(
              to: UInt8.self), count: count))
    }
  }
}

// Functionality to write FixedWidthInteger types to a CharacterPrinter.
extension FixedWidthInteger {
  // Write a FixedWidthInteger to the given CharacterPrinter in the given radix.
  func write(to printer: some CharacterPrinter, radix: Int = 10) {
    precondition(radix == 10 || radix == 16)
    precondition(Self.bitWidth <= 64)

    let isNegative = Self.isSigned && self < (0 as Self)
    let value = self.magnitude
    printer.write(value: UInt64(value), isNegative: isNegative, radix: radix)
  }
}

// Write a `StringInterpolation` to the given `CharacterPrinter` type.
//
// That is, given a type `Printer` implementing the protocol
// `CharacterPrinter`, we will convert types used in string interpolations into
// a form that can be written out to the Printer.
//
// See Swift's documentation on `StringInterpolationProtocol` for details.
struct StreamingInterpolation<P: CharacterPrinter>: StringInterpolationProtocol
{
  typealias StringLiteralType = StaticString
  var printer: P = P()

  init(literalCapacity: Int, interpolationCount: Int) {}

  // Write a string literal.
  mutating func appendLiteral(_ literal: StaticString) {
    printer.write(literal)
  }

  // Write a StaticString interpolated variable.
  mutating func appendInterpolation(
    _ value: StaticString
  ) {
    printer.write(value)
  }

  // Write a basic integer type (Int16, UInt64, etc).
  mutating func appendInterpolation(
    _ value: some FixedWidthInteger
  ) {
    printer.write(value)
  }
}

extension StreamingInterpolation {
  mutating func appendInterpolation(cString pointer: UnsafePointer<UInt8>?) {
    guard var pointer else {
      self.printer.write("nil")
      return
    }
    while pointer.pointee != 0 {
      self.printer.write(rawByte: pointer.pointee)
      pointer = pointer.advanced(by: 1)
    }
  }

  mutating func appendInterpolation(cString pointer: UnsafePointer<Int8>?) {
    guard var pointer else {
      self.printer.write("nil")
      return
    }
    while pointer.pointee != 0 {
      self.printer.write(rawByte: UInt8(pointer.pointee))
      pointer = pointer.advanced(by: 1)
    }
  }

  mutating func appendInterpolation(cString buffer: UnsafeBufferPointer<UInt8>?)
  {
    guard let buffer else {
      self.printer.write("nil")
      return
    }
    for byte in buffer {
      guard byte != 0 else { break }
      self.printer.write(rawByte: byte)
    }
  }

}

extension StreamingInterpolation {
  // Write a basic integer type in hex.
  //
  // This can be used by writing `"the value in hex is \(hex: value)."`.
  mutating func appendInterpolation<Word: FixedWidthInteger & UnsignedInteger>(
    hex value: @autoclosure () -> Word
  ) {
    value().write(to: printer, radix: 16)
  }

  // Write an object conforming to the `Loggable` protocol.
  mutating func appendInterpolation(
    _ value: @autoclosure () -> some Loggable
  ) {
    printer.write(value())
  }

  // Write a pointer's value.
  mutating func appendInterpolation(_ value: some _Pointer) {
    appendInterpolation(hex: UInt(bitPattern: value))
  }

  // Write a generic `UnsafeBufferPointer` value to the stream.
  mutating func appendInterpolation<T>(
    _ value: @autoclosure () -> UnsafeBufferPointer<T>
  ) {
    appendInterpolation(hex: UInt(bitPattern: value().baseAddress))
    appendInterpolation(", count: ")
    appendInterpolation(value().count)
  }

  // Write a generic `UnsafeMutableBufferPointer` value to the stream.
  mutating func appendInterpolation<T>(
    _ value: @autoclosure () -> UnsafeMutableBufferPointer<T>
  ) {
    appendInterpolation(UnsafeBufferPointer(value()))
  }

}

// Initiates a StringInterpolation.
//
// See Swift's documentation on `StringInterpolationProtocol` for details.
struct StreamingMessage<P: CharacterPrinter>: ExpressibleByStringInterpolation {
  typealias StringInterpolation = StreamingInterpolation<P>

  init(printer: P, stringInterpolation: StreamingInterpolation<P>) {
    self.interpolation = stringInterpolation
  }

  init(stringInterpolation: StreamingInterpolation<P>) {
    self.interpolation = stringInterpolation
  }

  init(stringLiteral value: StaticString) {
    self.interpolation = StreamingInterpolation(
      literalCapacity: 0, interpolationCount: 0)
    self.interpolation.appendLiteral(value)
  }

  var printer: P { interpolation.printer }

  private var interpolation: StreamingInterpolation<P>
}
