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

struct AudioBuffer: ~Copyable {
  // FIXME: Raw
  var storage: UnsafeMutableBufferPointer<Int16>
  var capacity: Int { self.storage.count }
  var count: Int

  init(capacity: Int) {
    self.storage = .allocate(capacity: capacity)
    self.storage.initialize(repeating: 0)
    // FIXME: don't assume filled.
    self.count = capacity
  }

  deinit {
    self.storage.deallocate()
  }
}
