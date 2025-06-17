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

#include <stdint.h>
#include <stddef.h>

extern int main(int argc, char *argv[]);

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

void reset(void) {
    main(0, NULL);
}

void interrupt(void) {
    while (1) {}
}

__attribute((used)) __attribute((section("__VECTORS,__text")))
void *vector_table[114] = {
    (void *)0x2000fffc, // initial SP
    reset, // Reset

    interrupt, // NMI
    interrupt, // HardFault
    interrupt, // MemManage
    interrupt, // BusFault
    interrupt, // UsageFault
    
    0 // NULL for all the other handlers
};
