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

#pragma once

#include <stdint.h>

static inline void nop() {
    asm volatile("nop");
}

static inline uint32_t primask_get(void) {
    uint32_t r;
    asm volatile("mrs %0, primask" : "=r" (r));
    return r;
}

static inline void primask_set(uint32_t m) {
    asm volatile("msr primask, %0" : : "r" (m));
}

static inline void cpsid_i(void) {
    asm volatile("cpsid i");
}

static inline void delay(uint32_t i) {
    __asm__ volatile(
        "   .align 2 \n"
        "1:     subs    %0, #1\n"
        "       bhi     1b\n"
        : "=r"(i)
        : "0" (i)
    : "cc"
        );
}
