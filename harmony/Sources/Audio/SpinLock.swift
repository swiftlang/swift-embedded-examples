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

struct SpinLock<Value: ~Copyable>: ~Copyable {
  var _lock: UnsafeMutablePointer<spin_lock_t>
  var value: Value

  init(index: Int, initialValue: consuming Value) {
    self._lock = spin_lock_init(UInt32(index))
    self.value = initialValue
  }
}

extension SpinLock where Value: ~Copyable {
  func lock() -> UInt32 {
    spin_lock_blocking(self._lock)
  }

  func unlock(irq_mask: UInt32) {
    spin_unlock(self._lock, irq_mask)
  }

  mutating func withLock<Result, Error>(
    _ body: (inout Value) throws(Error) -> Result
  ) throws(Error) -> Result where Result: ~Copyable {
    let irq_mask = self.lock()
    defer { self.unlock(irq_mask: irq_mask) }
    return try body(&self.value)
  }
}
