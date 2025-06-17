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

import XCTest

@testable import Core

extension RingBuffer {
  mutating func write(contentsOf array: [Element]) -> Bool {
    array.withUnsafeBufferPointer {
      self.write(contentsOf: $0)
    }
  }

  mutating func read(into array: inout [Element], count: Int? = nil) -> Int {
    array.withUnsafeMutableBufferPointer { buffer in
      self.read(into: buffer, count: count)
    }
  }

  func assertState(
    count: Int,
    readerIndex: Int,
    writerIndex: Int,
    file: StaticString = #filePath,
    line: UInt = #line
  ) {
    XCTAssertEqual(
      self.availableCapacity, self.capacity - count,
      "incorrect availableCapacity", file: file, line: line)
    XCTAssertEqual(
      self.isEmpty, (count == 0), "incorrect isEmpty", file: file, line: line)
    XCTAssertEqual(
      self.isFull, (count == self.capacity), "incorrect isFull", file: file,
      line: line)
    XCTAssertEqual(self.count, count, "incorrect count", file: file, line: line)
    XCTAssertEqual(
      self.readerIndex, readerIndex, "incorrect readerIndex", file: file,
      line: line)
    XCTAssertEqual(
      self.writerIndex, writerIndex, "incorrect writerIndex", file: file,
      line: line)
    if self.isEmpty || self.isFull {
      XCTAssertEqual(self.readerIndex, self.writerIndex, file: file, line: line)
    }
  }
}

final class RingBufferTests: XCTestCase {
  func testInitialization() {
    let ringBuffer = RingBuffer<Int>(capacity: 10)
    XCTAssertEqual(ringBuffer.capacity, 10)
    ringBuffer.assertState(count: 0, readerIndex: 0, writerIndex: 0)
  }

  func testCapacityAndAvailableCapacity() {
    var ringBuffer = RingBuffer<Int>(capacity: 5)
    ringBuffer.assertState(count: 0, readerIndex: 0, writerIndex: 0)

    XCTAssertTrue(ringBuffer.write(contentsOf: [1, 2, 3]))
    ringBuffer.assertState(count: 3, readerIndex: 0, writerIndex: 3)

    XCTAssertTrue(ringBuffer.write(contentsOf: [4, 5]))
    ringBuffer.assertState(count: 5, readerIndex: 0, writerIndex: 0)
  }

  func testWriteAndRead() {
    var ringBuffer = RingBuffer<Int>(capacity: 5)

    // Write data to the buffer
    XCTAssertTrue(ringBuffer.write(contentsOf: [1, 2, 3]))
    ringBuffer.assertState(count: 3, readerIndex: 0, writerIndex: 3)

    // Attempt to read from the buffer
    var readBuffer = Array(repeating: 0, count: 3)
    let readCount = ringBuffer.read(into: &readBuffer)
    XCTAssertEqual(readCount, 3)
    XCTAssertEqual(readBuffer, [1, 2, 3])
    ringBuffer.assertState(count: 0, readerIndex: 3, writerIndex: 3)
  }

  func testOverwriteBehavior() {
    var ringBuffer = RingBuffer<Int>(capacity: 3)

    // Fill buffer to capacity
    XCTAssertTrue(ringBuffer.write(contentsOf: [1, 2, 3]))
    ringBuffer.assertState(count: 3, readerIndex: 0, writerIndex: 0)

    // Attempt to overwrite when full
    XCTAssertFalse(ringBuffer.write(contentsOf: [4]))
    ringBuffer.assertState(count: 3, readerIndex: 0, writerIndex: 0)

    // Read and check if the buffer remains unaltered
    var readBuffer = Array(repeating: 0, count: 3)
    let readCount = ringBuffer.read(into: &readBuffer)
    XCTAssertEqual(readCount, 3)
    XCTAssertEqual(readBuffer, [1, 2, 3])
    ringBuffer.assertState(count: 0, readerIndex: 0, writerIndex: 0)
  }

  func testClearBuffer() {
    var ringBuffer = RingBuffer<Int>(capacity: 5)
    XCTAssertTrue(ringBuffer.write(contentsOf: [1, 2, 3]))
    ringBuffer.assertState(count: 3, readerIndex: 0, writerIndex: 3)

    ringBuffer.clear()
    ringBuffer.assertState(count: 0, readerIndex: 0, writerIndex: 0)
  }

  func testWrappingBehavior() {
    var ringBuffer = RingBuffer<Int>(capacity: 5)

    // Step 1: Write some data to fill part of the buffer
    XCTAssertTrue(ringBuffer.write(contentsOf: [1, 2, 3]))
    ringBuffer.assertState(count: 3, readerIndex: 0, writerIndex: 3)

    // Step 2: Read some data, advancing the reader index
    var readBuffer = Array(repeating: 0, count: 2)
    let readCount = ringBuffer.read(into: &readBuffer)
    XCTAssertEqual(readCount, 2)
    XCTAssertEqual(readBuffer, [1, 2])
    ringBuffer.assertState(count: 1, readerIndex: 2, writerIndex: 3)

    // Step 3: Write more data, causing the writer index to wrap around
    XCTAssertTrue(ringBuffer.write(contentsOf: [4, 5, 6]))
    ringBuffer.assertState(count: 4, readerIndex: 2, writerIndex: 1)

    // Step 4: Read remaining data to verify the wrap-around behavior
    readBuffer = Array(repeating: 0, count: 4)
    let totalReadCount = ringBuffer.read(into: &readBuffer)
    XCTAssertEqual(totalReadCount, 4)
    XCTAssertEqual(readBuffer, [3, 4, 5, 6])
    ringBuffer.assertState(count: 0, readerIndex: 1, writerIndex: 1)
  }

  func testWrappingWriteOverflowAndWrappingReadUnderflow() {
    var ringBuffer = RingBuffer<Int>(capacity: 5)

    // Step 1: Fill the buffer almost to capacity
    XCTAssertTrue(ringBuffer.write(contentsOf: [1, 2, 3]))
    ringBuffer.assertState(count: 3, readerIndex: 0, writerIndex: 3)

    // Step 2: Read some data to advance the reader index
    var readBuffer = Array(repeating: 0, count: 2)
    let readCount = ringBuffer.read(into: &readBuffer)
    XCTAssertEqual(readCount, 2)
    XCTAssertEqual(readBuffer, [1, 2])
    ringBuffer.assertState(count: 1, readerIndex: 2, writerIndex: 3)

    // Step 3: Write more data to cause the writer index to wrap around
    XCTAssertTrue(ringBuffer.write(contentsOf: [4, 5, 6]))
    // Writer wraps around
    ringBuffer.assertState(count: 4, readerIndex: 2, writerIndex: 1)

    // Step 4: Attempt a write that overflows (fails due to lack of capacity)
    XCTAssertFalse(ringBuffer.write(contentsOf: [7, 8, 9]))
    // State remains unchanged
    ringBuffer.assertState(count: 4, readerIndex: 2, writerIndex: 1)

    // Step 5: Read more data than available to test wrapping underflow
    readBuffer = Array(repeating: 0, count: 5)
    let underflowReadCount = ringBuffer.read(into: &readBuffer)
    XCTAssertEqual(underflowReadCount, 4)  // Should only read 4 elements
    // Validate read data
    XCTAssertEqual(readBuffer.prefix(underflowReadCount), [3, 4, 5, 6])
    // Reader wraps around
    ringBuffer.assertState(count: 0, readerIndex: 1, writerIndex: 1)
  }
}
