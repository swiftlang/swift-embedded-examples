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

#include <stdio.h>

#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "driver/gpio.h"
#include "sdkconfig.h"
#include "nimble/ble.h"
#include "nimble/transport.h"
#include "host/ble_hs.h"
#include "host/ble_gap.h"
#include "esp_bt.h"
#include "esp_task.h"
#include "esp_nimble_cfg.h"
#include "esp_log.h"
//#include "nvs_flash.h"
#include "esp_bt.h"
#include "os/os.h"
#include "led_strip.h"

#ifndef MYNEWT_VAL_BLE_LL_WHITELIST_SIZE
#define MYNEWT_VAL_BLE_LL_WHITELIST_SIZE CONFIG_BT_NIMBLE_WHITELIST_SIZE
#endif

// Private functions
int ble_uuid_length(const ble_uuid_t *uuid);