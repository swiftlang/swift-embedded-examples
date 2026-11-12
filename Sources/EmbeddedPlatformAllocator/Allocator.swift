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

// The allocation entry points of the Embedded Swift platform layer, for
// programs that have no C library.
//
// This is the free-list allocator of Kernighan and Ritchie, "The C
// Programming Language", section 8.7, on a static heap:
//
// - Memory is in blocks. Each block starts with a header and has a size that
//   is a whole number of headers ("units").
// - The free blocks are in a circular list, in address order. Allocation
//   takes the first free block that is large enough, from its end.
// - Deallocation puts the block back in the list, and merges it with the
//   free blocks immediately before and after it.
//
// Differences from K&R:
//
// - The heap is static, so there is no `morecore`. On first use, the heap
//   becomes a sentinel block of size zero and one large free block.
// - The caller gives an alignment. When it is larger than the alignment of a
//   unit, the start of the block moves down to an aligned address. The free
//   space in front of the block stays a free block, and the block keeps the
//   space after it, which is smaller than the alignment.
//
// A program that has a better allocator (for example, from a C library) does
// not use this module, and defines `_swift_allocate` and `_swift_deallocate`
// itself.

// The names of the entry points come from EmbeddedPlatform.h.
// swift-format-ignore-file: AlwaysUseLowerCamelCase

import CEmbeddedPlatform

/// The header of a block.
private struct Header {
  /// The next free block.
  ///
  /// Only a free block uses this value.
  var next: UnsafeMutablePointer<Header>
  /// The size of the block in units, including this header.
  var size: Int
}

/// The heap (2 KiB).
///
/// Known problem: at `-Onone`, the compiler initializes this global at run
/// time through `swift_once`, which needs atomic compare-and-exchange. On
/// targets that do not have it (for example, armv6m), a debug build does not
/// link. See https://github.com/swiftlang/swift/issues/94263.
nonisolated(unsafe) private var heap: InlineArray<2048, UInt8> =
  .init(repeating: 0)

/// The free block where the next search starts, or `nil` before first use.
nonisolated(unsafe) private var freeList: UnsafeMutablePointer<Header>? = nil

/// Makes the heap into a sentinel block and one large free block.
///
/// - Returns: The sentinel block.
private func makeFreeList() -> UnsafeMutablePointer<Header> {
  let start = withUnsafeMutablePointer(to: &heap) {
    UnsafeMutableRawPointer($0)
  }
  // Align the first header, because the heap is only byte aligned.
  let first = start.alignedUp(for: Header.self)
  let units = (heap.count - (first - start)) / MemoryLayout<Header>.stride

  let sentinel = first.bindMemory(to: Header.self, capacity: units)
  let block = sentinel + 1
  block.initialize(to: Header(next: sentinel, size: units - 1))
  sentinel.initialize(to: Header(next: block, size: 0))
  return sentinel
}

@implementation @c
public func _swift_allocate(
  _ alignment: Int, _ size: Int, _ flags: SwiftAllocateFlags
) -> UnsafeMutableRawPointer? {
  // A larger request can never fit, and the unit count below must not
  // overflow.
  guard size <= heap.count else { return nil }
  let unit = MemoryLayout<Header>.stride
  // The data of a block starts after its header.
  let units = (size + unit - 1) / unit + 1

  let start = freeList ?? makeFreeList()
  freeList = start
  var previous = start
  var block = previous.pointee.next
  while true {
    // The last position for the header, so that the data is aligned and fits
    // in the block.
    let end = block + block.pointee.size
    let data = UnsafeMutableRawPointer(end - units + 1)
      .alignedDown(toMultipleOf: alignment)
    let header = data.assumingMemoryBound(to: Header.self) - 1

    if header >= block {
      if header == block {
        // The block fits: remove it from the list.
        previous.pointee.next = block.pointee.next
      } else {
        // Allocate the end of the block. The front stays free.
        block.pointee.size = header - block
      }
      header.pointee.size = end - header
      freeList = previous

      if flags.contains(.zeroMemory) {
        data.initializeMemory(as: UInt8.self, repeating: 0, count: size)
      }
      return data
    }

    if block == start {
      // The search went around the list, and no free block is large enough.
      return nil
    }
    previous = block
    block = block.pointee.next
  }
}

@implementation @c
public func _swift_deallocate(
  _ pointer: UnsafeMutableRawPointer, _ alignment: Int, _ size: Int,
  _ flags: SwiftDeallocFlags
) {
  // Only memory from `_swift_allocate` comes here, so the list exists.
  guard var previous = freeList else { return }
  let block = pointer.assumingMemoryBound(to: Header.self) - 1

  // Find the free blocks before and after the block, in address order.
  while !(block > previous && block < previous.pointee.next) {
    // At the end of the list, the block is after the last free block or
    // before the first free block.
    if previous >= previous.pointee.next
      && (block > previous || block < previous.pointee.next)
    {
      break
    }
    previous = previous.pointee.next
  }

  // Merge with the next free block.
  let next = previous.pointee.next
  if block + block.pointee.size == next {
    block.pointee.size += next.pointee.size
    block.pointee.next = next.pointee.next
  } else {
    block.pointee.next = next
  }

  // Merge with the previous free block.
  if previous + previous.pointee.size == block {
    previous.pointee.size += block.pointee.size
    previous.pointee.next = block.pointee.next
  } else {
    previous.pointee.next = block
  }
  freeList = previous
}
