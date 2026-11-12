//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift open source project
//
// Copyright (c) 2026 Apple Inc. and the Swift project authors.
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
//
//===----------------------------------------------------------------------===//

// The Embedded Swift platform layer for the bare-metal examples.
//
// The examples run one execution context, with no operating system. This
// module implements the entry points in EmbeddedPlatform.h for that
// environment. `@implementation @c` makes the compiler compare each function
// with its declaration in the header.
//
// Known problem: at `-Onone`, the compiler initializes the `InlineArray`
// global of this module at run time through `swift_once`, which needs atomic
// compare-and-exchange. On targets that do not have it (for example, armv6m),
// a debug build does not link.
// See https://github.com/swiftlang/swift/issues/94263.
//
// - Standard output goes one byte at a time to `putchar`. Each example that
//   prints defines `putchar` for its board, usually to write a UART. When the
//   linker removes unused functions (`-dead_strip` or `--gc-sections`), a
//   program that does not print does not need `putchar`.
// - Locks, mutexes, and thread-local storage serve one execution context.
// - Random numbers come from a fixed-seed generator. They are not secure.
// - `_swift_exit` stops the program in a loop. There is no operating system
//   to go back to.
// - `_swift_typedAllocate` and `_swift_typedDeallocate` forward to
//   `_swift_allocate` and `_swift_deallocate`. A separate module supplies
//   those two functions (for example, EmbeddedPlatformAllocator).
//
// The clock entry points are not implemented, because no clock is common to
// all boards. Only code that reads a Swift clock needs them.

// The names of the entry points come from EmbeddedPlatform.h.
// swift-format-ignore-file: AlwaysUseLowerCamelCase

import CEmbeddedPlatform

@_extern(c, "putchar")
func putchar(_ character: CInt) -> CInt

// MARK: - Typed allocation

/// The alignment that a typed allocation gets when the caller gives zero.
private let defaultAlignment = 16

@implementation @c
public func _swift_typedAllocate(
  _ size: Int, _ alignment: Int, _ flags: SwiftAllocateFlags,
  _ typeId: UInt64
) -> UnsafeMutableRawPointer? {
  // `_swift_allocate` does not accept zero alignment.
  _swift_allocate(alignment == 0 ? defaultAlignment : alignment, size, flags)
}

@implementation @c
public func _swift_typedDeallocate(
  _ pointer: UnsafeMutableRawPointer, _ size: Int, _ alignment: Int,
  _ flags: SwiftDeallocFlags, _ typeId: UInt64
) {
  _swift_deallocate(pointer, alignment, size, flags)
}

// MARK: - Standard output

@implementation @c
public func _swift_lockStandardOutput() {}

@implementation @c
public func _swift_unlockStandardOutput() {}

@implementation @c
public func _swift_writeToStandardOutput(
  _ chars: UnsafePointer<UInt8>?, _ count: Int
) -> Int {
  guard let chars else { return 0 }
  for index in 0..<count {
    _ = putchar(CInt(chars[index]))
  }
  return count
}

// MARK: - Error reporting

private func write(_ string: StaticString) {
  _ = _swift_writeToStandardOutput(string.utf8Start, string.utf8CodeUnitCount)
}

private func writeDecimal(_ value: Int) {
  if value >= 10 { writeDecimal(value / 10) }
  _ = putchar(CInt(UInt8(ascii: "0") + UInt8(value % 10)))
}

// Writes, for example, "Main.swift:12: Precondition failed: out of range".
@implementation @c
public func _swift_reportErrorAt(
  _ message: UnsafePointer<UInt8>?, _ messageCount: Int,
  _ fileName: UnsafePointer<UInt8>?, _ fileNameCount: Int, _ line: Int,
  _ flags: UInt64
) {
  if fileName != nil, fileNameCount > 0 {
    _ = _swift_writeToStandardOutput(fileName, fileNameCount)
    write(":")
    writeDecimal(line)
    write(": ")
  }

  // The low 8 bits of `flags` contain the kind of error.
  switch SwiftErrorKind(rawValue: UInt32(truncatingIfNeeded: flags & 0xff)) {
  case .precondition: write("Precondition failed")
  case .assertion: write("Assertion failed")
  default: write("Fatal error")
  }

  if message != nil, messageCount > 0 {
    write(": ")
    _ = _swift_writeToStandardOutput(message, messageCount)
  }
  write("\n")
}

@implementation @c
public func _swift_reportError(
  _ message: UnsafePointer<UInt8>?, _ messageCount: Int, _ flags: UInt64
) {
  _swift_reportErrorAt(message, messageCount, nil, 0, 0, flags)
}

// MARK: - Random numbers

/// The state of a SplitMix64 generator.
///
/// The seed is fixed, so the values are the same each time that the program
/// starts.
nonisolated(unsafe) private var randomState: UInt64 = 0x9E37_79B9_7F4A_7C15

private func nextRandom() -> UInt64 {
  randomState &+= 0x9E37_79B9_7F4A_7C15
  var z = randomState
  z = (z ^ (z >> 30)) &* 0xBF58_476D_1CE4_E5B9
  z = (z ^ (z >> 27)) &* 0x94D0_49BB_1331_11EB
  return z ^ (z >> 31)
}

@implementation @c
public func _swift_generateRandom(
  _ buffer: UnsafeMutableRawPointer, _ nbytes: Int
) {
  for index in 0..<nbytes {
    buffer.storeBytes(
      of: UInt8(truncatingIfNeeded: nextRandom()), toByteOffset: index,
      as: UInt8.self)
  }
}

// The header permits a constant hash seed. With a constant seed, hash values
// are the same in each run.
@implementation @c
public func _swift_generateRandomHashSeed(
  _ buffer: UnsafeMutableRawPointer, _ nbytes: Int
) {
  buffer.initializeMemory(as: UInt8.self, repeating: 0, count: nbytes)
}

// MARK: - Mutexes

// There is one execution context, so a mutex only counts how many times it is
// held. If the program locks a non-recursive mutex that it holds, it can never
// continue. A fatal error shows this mistake.

private func lockCount(_ mutex: UnsafeMutableRawPointer)
  -> UnsafeMutablePointer<
    Int
  >
{
  mutex.assumingMemoryBound(to: Int.self)
}

@implementation @c
public func _swift_mutex_init(
  _ mutex: UnsafeMutableRawPointer, _ flags: SwiftMutexFlags
) {
  mutex.initializeMemory(as: Int.self, to: 0)
}

@implementation @c
public func _swift_mutex_destroy(_ mutex: UnsafeMutableRawPointer) {}

@implementation @c
public func _swift_mutex_lock(_ mutex: UnsafeMutableRawPointer) {
  if lockCount(mutex).pointee != 0 {
    fatalError("locking a mutex that is already locked")
  }
  lockCount(mutex).pointee = 1
}

@implementation @c
public func _swift_mutex_unlock(_ mutex: UnsafeMutableRawPointer) {
  lockCount(mutex).pointee = 0
}

@implementation @c
public func _swift_mutex_tryLock(_ mutex: UnsafeMutableRawPointer) -> Int {
  if lockCount(mutex).pointee != 0 { return 0 }
  lockCount(mutex).pointee = 1
  return 1
}

@implementation @c
public func _swift_mutexRecursive_init(
  _ mutex: UnsafeMutableRawPointer, _ flags: SwiftMutexFlags
) {
  mutex.initializeMemory(as: Int.self, to: 0)
}

@implementation @c
public func _swift_mutexRecursive_destroy(_ mutex: UnsafeMutableRawPointer) {}

@implementation @c
public func _swift_mutexRecursive_lock(_ mutex: UnsafeMutableRawPointer) {
  lockCount(mutex).pointee += 1
}

@implementation @c
public func _swift_mutexRecursive_unlock(_ mutex: UnsafeMutableRawPointer) {
  lockCount(mutex).pointee -= 1
}

// MARK: - Thread-local storage

/// The values of the reserved TLS keys: one slot for each key in
/// `0..<SWIFT_TLS_KEY_COUNT` (8).
nonisolated(unsafe) private var tlsValues:
  InlineArray<
    8, UnsafeMutableRawPointer?
  > = .init(repeating: nil)

// The one execution context never exits, so destructors are never called.
@implementation @c
public func _swift_tls_init(
  _ key: Int,
  _ destructor: (@convention(c) (UnsafeMutableRawPointer?) -> Void)?
) {}

@implementation @c
public func _swift_tls_get(_ key: Int) -> UnsafeMutableRawPointer? {
  tlsValues[key]
}

@implementation @c
public func _swift_tls_set(_ key: Int, _ value: UnsafeMutableRawPointer?) {
  tlsValues[key] = value
}

@implementation @c
public func _swift_thread_isMain() -> Int { 1 }

// MARK: - Exit

@implementation @c
public func _swift_exit(_ code: CInt) -> Never {
  while true {}
}
