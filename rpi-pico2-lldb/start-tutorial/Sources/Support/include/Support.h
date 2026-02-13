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

#pragma once

#include <stddef.h>
#include <stdint.h>

static inline __attribute((always_inline)) void nop() {
    asm volatile("nop");
}

void free(void *ptr);

int posix_memalign(void **memptr, size_t alignment, size_t size);

void *memmove(void *dst, const void *src, size_t n);