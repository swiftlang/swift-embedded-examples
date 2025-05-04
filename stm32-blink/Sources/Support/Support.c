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

#if defined(__arm__)

#include <stdint.h>
#include <stddef.h>

void *memset(void *b, int c, size_t len) {
  for (int i = 0; i < len; i++) {
    ((char *)b)[i] = c;
  }
  return b;
}

void *memcpy(void *restrict dst, const void *restrict src, size_t n) {
  for (int i = 0; i < n; i++) {
    ((char *)dst)[i] = ((char *)src)[i];
  }
  return dst;
}

extern void reset(void);

void interrupt(void) {
  while (1) {}
}

__attribute((used)) __attribute((section("__VECTORS,__text")))
void *vector_table[114] = {
  (void *)0x2000fffc, // initial SP
  (void *)((uintptr_t)reset - (0x20010000 - 0x08000000)), // Reset

  (void *)((uintptr_t)interrupt - (0x20010000 - 0x08000000)), // NMI
  (void *)((uintptr_t)interrupt - (0x20010000 - 0x08000000)), // HardFault
  (void *)((uintptr_t)interrupt - (0x20010000 - 0x08000000)), // MemManage
  (void *)((uintptr_t)interrupt - (0x20010000 - 0x08000000)), // BusFault
  (void *)((uintptr_t)interrupt - (0x20010000 - 0x08000000)), // UsageFault
  
  0 // NULL for all the other handlers
};

#endif
