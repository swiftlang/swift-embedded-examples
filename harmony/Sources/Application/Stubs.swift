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

// Embedded Swift currently requires posix_memalign, but the C libraries in the
// Pico SDK do not provide it. Let's implement it and forward the calls to
// aligned_alloc(3).
@_cdecl("posix_memalign")
public func posix_memalign(
  memptr: UnsafeMutablePointer<UnsafeMutableRawPointer?>,
  alignment: size_t,
  size: size_t
) -> Int32 {
  if let allocation = aligned_alloc(alignment, size) {
    memptr.pointee = allocation
    return 0
  }
  return _errno()
}

// FIXME: document
@_cdecl("swift_isEscapingClosureAtFileLocation")
func swift_isEscapingClosureAtFileLocation(
  object: UnsafeRawPointer,
  filename: UnsafePointer<CUnsignedChar>,
  filenameLength: Int32,
  line: Int32,
  column: Int32,
  type: UInt
) -> Bool {
  false
}
