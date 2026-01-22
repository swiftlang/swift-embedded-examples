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

#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "led_strip.h"
#include "sdkconfig.h"

static inline led_color_component_format_t led_strip_color_format_rgb(void) {
    return LED_STRIP_COLOR_COMPONENT_FMT_RGB;
}

#endif /* BRIDGING_HEADER_H */
