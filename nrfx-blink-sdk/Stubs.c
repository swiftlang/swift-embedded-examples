//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift open source project
//
// Copyright (c) 2023 Apple Inc. and the Swift project authors.
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
//
//===----------------------------------------------------------------------===//

#include <stdlib.h>
#include <errno.h>
#include <stdint.h>

void *aligned_alloc(size_t alignment, size_t size);

// Embedded Swift currently requires posix_memalign, but the C libraries in the
// Zephyr SDK do not provide it. Implement it on top of aligned_alloc(3), after
// checking the different input rules of the two functions.
int
posix_memalign(void **memptr, size_t alignment, size_t size)
{
  size_t alloc_size;

  if (alignment < sizeof(void *) || (alignment & (alignment - 1)) != 0) {
    return EINVAL;
  }

  alloc_size = size;
  if (alloc_size == 0) {
    alloc_size = alignment;
  } else if (alloc_size % alignment != 0) {
    size_t padding = alignment - (alloc_size % alignment);
    if (alloc_size > SIZE_MAX - padding) {
      return ENOMEM;
    }
    alloc_size += padding;
  }

  void *p = aligned_alloc(alignment, alloc_size);
  if (p) {
    *memptr = p;
    return 0;
  }

  return ENOMEM;
}
