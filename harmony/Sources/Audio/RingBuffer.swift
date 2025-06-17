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

// FIXME: RingBuffer<let capacity: Int, Element>
struct RingBuffer<Element: BitwiseCopyable>: ~Copyable {
  // FIMXE: Use an inline allocation like `Vector`
  var storage: UnsafeMutableBufferPointer<Element>
  var count: Int
  var readerIndex: Int
  var writerIndex: Int

  init(capacity: Int) {
    self.storage = .allocate(capacity: capacity)
    self.readerIndex = 0
    self.writerIndex = 0
    self.count = 0
  }

  deinit {
    self.storage.deallocate()
  }
}

extension RingBuffer {
  var capacity: Int { self.storage.count }
  var availableCapacity: Int { self.capacity - self.count }
  var isEmpty: Bool { self.count == 0 }
  var isFull: Bool { self.count == self.capacity }
}

extension RingBuffer {
  mutating func clear() {
    // Forget about the contents of `storage`, this is safe because
    // `Element` is `BitwiseCopyable`.
    self.count = 0
    self.readerIndex = 0
    self.writerIndex = 0
  }

  mutating func read(
    into buffer: UnsafeMutableBufferPointer<Element>,
    count: Int? = nil
  ) -> Int {
    let elementsToRead = min(buffer.count, count ?? Int.max, self.count)

    // Reading 0 elements is a no-op.
    guard elementsToRead > 0 else { return elementsToRead }

    // Read the initial elements from the end of the ring buffer.
    let elementsUntilEnd = self.capacity - self.readerIndex
    let elementsToReadFirstHalf = min(elementsUntilEnd, elementsToRead)
    buffer.baseAddress!.update(
      from: self.storage.baseAddress! + self.readerIndex,
      count: elementsToReadFirstHalf)
    self.readerIndex += elementsToReadFirstHalf

    // Update the reader index to wrap if needed.
    if self.readerIndex == self.capacity {
      self.readerIndex = 0
    }

    // Read the remaining elements from the beginning of the ring buffer.
    let elementsToReadSecondHalf = elementsToRead - elementsToReadFirstHalf
    precondition(elementsToReadSecondHalf >= 0)
    (buffer.baseAddress! + elementsToReadFirstHalf).update(
      from: self.storage.baseAddress! + self.readerIndex,
      count: elementsToReadSecondHalf)
    self.readerIndex += elementsToReadSecondHalf

    // Update bookkeeping with the new count.
    self.count -= elementsToRead

    return elementsToRead
  }

  mutating func write(
    contentsOf buffer: UnsafeMutableBufferPointer<Element>
  ) -> Bool {
    self.write(contentsOf: UnsafeBufferPointer(buffer))
  }

  mutating func write(
    contentsOf buffer: UnsafeBufferPointer<Element>
  ) -> Bool {
    let elementsToWrite = buffer.count

    // Writing 0 elements is a no-op.
    guard elementsToWrite > 0 else { return true }
    // Writing more than the available capacity is an error.
    guard elementsToWrite <= self.availableCapacity else { return false }

    // Write the initial elements to the end of the ring buffer.
    let elementsUntilEnd = self.capacity - self.writerIndex
    let elementsToWriteFirstHalf = min(elementsUntilEnd, elementsToWrite)
    (self.storage.baseAddress! + self.writerIndex).update(
      from: buffer.baseAddress!,
      count: elementsToWriteFirstHalf)
    self.writerIndex += elementsToWriteFirstHalf

    // Update the writer index to wrap if needed.
    if self.writerIndex == self.capacity {
      self.writerIndex = 0
    }

    // Write the remaining elements to the beginning of the ring buffer.
    let elementsToWriteSecondHalf = elementsToWrite - elementsToWriteFirstHalf
    precondition(elementsToWriteSecondHalf >= 0)
    (self.storage.baseAddress! + self.writerIndex).update(
      from: buffer.baseAddress! + elementsToWriteFirstHalf,
      count: elementsToWriteSecondHalf)
    self.writerIndex += elementsToWriteSecondHalf

    // Update bookkeeping with the new count.
    self.count += elementsToWrite

    return true
  }
}
