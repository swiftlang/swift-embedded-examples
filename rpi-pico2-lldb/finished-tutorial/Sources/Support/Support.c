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

#include <stddef.h>
#include <stdint.h>

extern int main(int argc, char *argv[]);

void enableFPU(void) {
  uint32_t* cpacr = (uint32_t*)0xE000ED88;
  // Read CPACR.
  // Set bits 20-23 to enable CP10 and CP11 coprocessors.
  // Write back the modified value to the CPACR.
  *cpacr |= 0xF << 20;
  // Wait for the coprocessors to become active.
  asm volatile("dsb");
  asm volatile("isb");
}

#define HEAP_SIZE (2 * 1024)

__attribute__((aligned(8)))
__attribute__((section("__DATA,__heap")))
char heap[HEAP_SIZE] = {};
size_t next_heap_index = 0;

void *calloc(size_t count, size_t size) {
  if (next_heap_index + count * size > HEAP_SIZE) __builtin_trap();
  void *p = &heap[next_heap_index];
  next_heap_index += count * size;
  return p;
}

int posix_memalign(void **memptr, size_t alignment, size_t size) {
  *memptr = calloc(size + alignment, 1);
  if (((uintptr_t)*memptr) % alignment == 0) return 0;
  *(uintptr_t *)memptr += alignment - ((uintptr_t)*memptr % alignment);
  return 0;
}

void free(void *ptr) {
  __builtin_trap();
  // never free
}

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

void *memmove(void *dst, const void *src, size_t n) {
  unsigned char *d = (unsigned char *)dst;
  const unsigned char *s = (const unsigned char *)src;

  if (d == s || n == 0) return dst;

  if (d < s) {
    // Copy forwards
    for (size_t i = 0; i < n; i++) d[i] = s[i];
  } else {
    // Copy backwards
    for (size_t i = n; i != 0; i--) d[i - 1] = s[i - 1];
  }

  return dst;
}

void reset(void) {
  enableFPU();
  int exit_code = main(0, NULL);
  __builtin_trap();
}

void interrupt(void) {
  while (1) {}
}

__attribute((section("__DATA,stack"), aligned(32)))
char stack[0x1600];

__attribute((used)) __attribute((section("__VECTORS,vectors")))
void *vector_table[73] = {
  (void *)(&stack[sizeof(stack) - 4]), // initial SP
  reset, // Reset


  // Vector table info is defined in
  // Arm v8-M Architecture Reference Manual - B3.30 Vector tables.
  //
  // Exception numbers are defined in
  //  B3.9 Exception numbers and exception priority numbers
  // 
  // Entries 16-67:
  //  External interrupts - IRQs defined in RP2350 datasheet:
  //  "Each core is equipped with an internal interrupt controller,
  //   with 52 interrupt inputs."

  interrupt, // NMI
  interrupt, // HardFault

  interrupt, interrupt, interrupt, interrupt,
  interrupt, interrupt, interrupt, interrupt,
  interrupt, interrupt, interrupt, interrupt, 
  interrupt, interrupt, interrupt, interrupt, 
  interrupt, interrupt, interrupt, interrupt, 
  interrupt, interrupt, interrupt, interrupt, 
  interrupt, interrupt, interrupt, interrupt, 
  interrupt, interrupt, interrupt, interrupt,
  interrupt, interrupt, interrupt, interrupt, 
  interrupt, interrupt, interrupt, interrupt, 
  interrupt, interrupt, interrupt, interrupt, 
  interrupt, interrupt, interrupt, interrupt, 
  interrupt, interrupt, interrupt, interrupt, 
  interrupt, interrupt, interrupt, interrupt, 
  interrupt, interrupt, interrupt, interrupt,
  interrupt, interrupt, interrupt, interrupt, 
  
  // Minimal image per RP2350 datasheet
  // Section 5.9.5. Minimum viable image metadata
  (void*)0xffffded3, // PICOBIN_BLOCK_MARKER_START
  (void*)0x10210142, // item: PICOBIN_BLOCK_ITEM_1BS_IMAGE_TYPE
  (void*)0x000001ff, // item: PICOBIN_BLOCK_ITEM_2BS_LAST
  (void*)0x00000000, // link to self / "this is the last block"
  (void*)0xab123579, // PICOBIN_BLOCK_MARKER_END
};
