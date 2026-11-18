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
// Pico SDK do not provide it. Implement it on top of aligned_alloc(3), after
// checking the different input rules of the two functions.
@_cdecl("posix_memalign")
public func posix_memalign(
  memptr: UnsafeMutablePointer<UnsafeMutableRawPointer?>,
  alignment: size_t,
  size: size_t
) -> Int32 {
  // alignment must be a power of two and a multiple of sizeof(void *).
  if alignment < MemoryLayout<UnsafeMutableRawPointer>.size
    || alignment & (alignment - 1) != 0
  {
    return EINVAL
  }

  var allocSize = size
  if allocSize == 0 {
    allocSize = alignment
  } else if allocSize % alignment != 0 {
    let padding = alignment - (allocSize % alignment)
    if allocSize > size_t.max - padding {
      return ENOMEM
    }
    allocSize += padding
  }

  if let allocation = aligned_alloc(alignment, allocSize) {
    memptr.pointee = allocation
    return 0
  }
  return ENOMEM
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
