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

#pragma once

#include <stdint.h>

#define VOLATILE_LOAD(type) \
  __attribute__((always_inline)) \
  static type volatile_load_##type(const volatile type * _Nonnull pointer) { return *pointer; }

VOLATILE_LOAD(uint8_t);
VOLATILE_LOAD(uint16_t);
VOLATILE_LOAD(uint32_t);
VOLATILE_LOAD(uint64_t);

#define VOLATILE_STORE(type) \
  __attribute__((always_inline)) \
  static void volatile_store_##type(volatile type * _Nonnull pointer, type value) { *pointer = value; }

VOLATILE_STORE(uint8_t);
VOLATILE_STORE(uint16_t);
VOLATILE_STORE(uint32_t);
VOLATILE_STORE(uint64_t);

static inline void busyWait(uint32_t cycles) {
  asm(
    "1: subs %0, #3\n"
    "bcs 1b\n"
    : "+l" (cycles) : : "memory"
  );
}

static inline void nop(void) {
    asm volatile("nop");
}
