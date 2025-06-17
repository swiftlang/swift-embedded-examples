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

#include <string.h>
#include <stdint.h>

// This is NOT real entropy. This implementation is a stub that generates
// predictable, sequential values for testing purposes only. Do not use this
// in production code where actual cryptographic randomness is required.
int getentropy(char *buffer, size_t length) {
    for (size_t i = 0; i < length; i++) {
        buffer[i] = i % 256;
    }
    return 0;
}

void _exit(int status) {
    __builtin_trap();
}
