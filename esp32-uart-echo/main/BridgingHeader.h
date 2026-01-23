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

#ifndef BRIDGING_HEADER_H
#define BRIDGING_HEADER_H

#include <stdio.h>
#include <string.h>

#include "sdkconfig.h"
#include "driver/uart.h"
#include "driver/uart_vfs.h"

// Wrapper for uart_set_pin that works across ESP-IDF versions
static inline esp_err_t set_uart_pin(uart_port_t uart_num, int tx_io_num, int rx_io_num, int rts_io_num, int cts_io_num) {
#if ESP_IDF_VERSION >= ESP_IDF_VERSION_VAL(6, 0, 0)
    return _uart_set_pin6(uart_num, tx_io_num, rx_io_num, rts_io_num, cts_io_num, -1, -1);
#else
    return uart_set_pin(uart_num, tx_io_num, rx_io_num, rts_io_num, cts_io_num);
#endif
}

// Helper functions to access stdin/stdout/stderr (which are macros in C)
static inline void set_stdin(FILE *f) {
    stdin = f;
}

static inline void set_stdout(FILE *f) {
    stdout = f;
}

static inline void set_stderr(FILE *f) {
    stderr = f;
}

static inline FILE* get_stdout(void) {
    return stdout;
}

static inline FILE* get_stdin(void) {
    return stdin;
}

#endif /* BRIDGING_HEADER_H */
