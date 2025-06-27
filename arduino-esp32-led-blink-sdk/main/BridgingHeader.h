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

// For some reason swiftc's clang++ defines `__UINT32_TYPE__` as `unsigned int` (g++'s x86 behaviour) not `long unsigned int` (g++'s riscv32 behaviour)
#undef __UINT32_TYPE__
#undef uint32_t
#define __UINT32_TYPE__ long unsigned int
#define uint32_t __UINT32_TYPE__
#define _UINT32_T_DECLARED

#include <stdio.h>
#include <stdint.h>

#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "driver/gpio.h"
#include "sdkconfig.h"

#include <Arduino.h>
