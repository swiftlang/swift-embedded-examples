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

// A simple "overlay" to provide nicer APIs in Swift
struct Led {
  var ledPin: gpio_num_t
  init(gpioPin: Int) {
    ledPin = gpio_num_t(Int32(gpioPin))

    guard gpio_reset_pin(ledPin) == ESP_OK else {
      fatalError("cannot reset led")
    }

    guard gpio_set_direction(ledPin, GPIO_MODE_OUTPUT) == ESP_OK else {
      fatalError("cannot reset led")
    }
  }
  func setLed(_ value:Bool) {
    let level: UInt32 = value ? 1 : 0
    gpio_set_level(ledPin, level)
  }
}
