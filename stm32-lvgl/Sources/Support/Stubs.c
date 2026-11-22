//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift open source project
//
// Copyright (c) 2025 Apple Inc. and the Swift project authors.
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
//
//===----------------------------------------------------------------------===//

#include <stdlib.h>
#include <string.h>

#include "EmbeddedPlatform.h"

// This example links a C library (picolibc), so Swift allocates from its heap
// with these definitions. The example does not use EmbeddedPlatformAllocator.

void *_swift_allocate(__swift_size_t alignment, __swift_size_t size,
                      swift_alloc_flags_t flags) {
  void *pointer = NULL;
  if (posix_memalign(&pointer, alignment, size) != 0) return NULL;
  if (flags & SWIFT_ALLOC_ZERO_MEMORY) memset(pointer, 0, size);
  return pointer;
}

void _swift_deallocate(void *pointer, __swift_size_t alignment,
                       __swift_size_t size, swift_dealloc_flags_t flags) {
  free(pointer);
}
