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

void reset(void) {
    main(0, NULL);
}

void interrupt(void) {
    while (1) {}
}

__attribute((used))
#if defined(__ELF__)
__attribute((section(".vectors")))
#elif defined(__MACH__)
__attribute((section("__VECTORS,__text")))
#else
#error Unknown file format
#endif
void *vector_table[114] = {
    (void *)0x20001ffc, // initial SP, assume we have 8 KB of SRAM
    reset, // Reset

    interrupt, // NMI
    interrupt, // HardFault
    interrupt, // MemManage
    interrupt, // BusFault
    interrupt, // UsageFault
    
    0 // NULL for all the other handlers
};
