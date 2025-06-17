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
  (void*)0xffffded3, // PICOBIN_BLOCK_MARKER_START
  (void*)0x10210142, // item: PICOBIN_BLOCK_ITEM_1BS_IMAGE_TYPE
  (void*)0x000001ff, // item: PICOBIN_BLOCK_ITEM_2BS_LAST
  (void*)0x00000000, // link to self / "this is the last block"
  (void*)0xab123579, // PICOBIN_BLOCK_MARKER_END
};
