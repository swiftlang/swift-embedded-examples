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

struct Ring<Element: ~Copyable>: ~Copyable {
  // FIMXE: Use an inline allocation like `Vector`
  var storage: UnsafeMutableBufferPointer<Element>
  var readerIndex: Int
  var writerIndex: Int

  init(capacity: Int) {
    self.storage = .allocate(capacity: capacity)
    self.readerIndex = 0
    self.writerIndex = 0
  }

  deinit {
    var readerIndex = self.readerIndex
    while self.readerIndex != self.writerIndex {
      self.storage.deinitializeElement(at: readerIndex)
      readerIndex = (readerIndex + 1) % self.storage.count
    }
    // FIXME: why can't we use a mutating method here?
    // while _ = self.pop() { }
    self.storage.deallocate()
  }
}
 
extension Ring where Element: ~Copyable {
  mutating func push(_ element: consuming Element) {
    let nextWriterIndex = (self.writerIndex + 1) % self.storage.count
    guard nextWriterIndex != self.readerIndex else { fatalError("Overflow") }
    self.storage.initializeElement(at: self.writerIndex, to: element)
    __dsb() // Make sure the element is written before updating the index
    self.writerIndex = nextWriterIndex
  }

  mutating func pop() -> Element? {
    guard self.readerIndex != self.writerIndex else { return nil }
    let element = self.storage.moveElement(from: self.readerIndex)
    __dsb() // Make sure the element is read before updating the index
    self.readerIndex = (self.readerIndex + 1) % self.storage.count
    return element
  }
}
