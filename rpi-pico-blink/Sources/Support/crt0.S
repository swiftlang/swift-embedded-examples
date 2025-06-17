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

    .syntax unified
    .thumb
    .section __RESET,reset
    .thumb_func
    .global _entry_point

_entry_point:
    // Set VTOR (offset 0xed08 in Cortex-M0+ registers) to point to the vector table
    ldr   r0, =_vector_table
    ldr   r1, =(0xe0000000 + 0x0000ed08)
    str   r0, [r1]

    // Load the first two entries of the vector table, (1) r1 = initial SP, (2) r2 = reset function
    ldmia r0!, {r1, r2}

    // Set stack pointer
    msr   msp, r1

    // Transfer to reset function
    bx    r2
