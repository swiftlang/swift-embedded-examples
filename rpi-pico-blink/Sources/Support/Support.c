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
#include <stdbool.h>

#include "Support.h"

extern int main(int argc, char *argv[]);

void reset(void) {
    int exit_code = main(0, NULL);
    __builtin_trap();
}

void interrupt(void) {
    while (1) {}
}

__attribute((section("__DATA,stack"), aligned(32)))
char stack[0x800];

__attribute((used)) __attribute((section("__VECTORS,vectors")))
void *vector_table[48] = {
    (void *)(&stack[sizeof(stack)]), // initial SP
    reset, // Reset

    interrupt, // NMI
    interrupt, // HardFault
    
    0 // NULL for all the other handlers
};
