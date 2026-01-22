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

#if canImport(Darwin)
import Darwin
#elseif os(Windows)
import ucrt
#elseif canImport(Glibc)
import Glibc
#elseif canImport(Musl)
import Musl
#elseif canImport(WASILibc)
import WASILibc
#elseif canImport(Bionic)
import Bionic
#endif

// Declares the required C functions
#if hasFeature(Embedded)
@_silgen_name("memcmp")
internal func _memcmp(
    _ p1: UnsafeRawPointer?,
    _ p2: UnsafeRawPointer?,
    _ size: Int
) -> Int32
#else
internal func _memcmp(
    _ p1: UnsafeRawPointer?,
    _ p2: UnsafeRawPointer?,
    _ size: Int
) -> Int32 {
    memcmp(p1, p2, size)
}
#endif

#if hasFeature(Embedded)
@_silgen_name("snprintf")
internal func _snprintf_uint8_t(
    _ pointer: UnsafeMutablePointer<CChar>,
    _ length: Int,
    _ format: UnsafePointer<CChar>,
    _ arg: UInt8
) -> Int32
#endif
