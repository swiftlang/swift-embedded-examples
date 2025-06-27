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

// The code will blink an LED on GPIO8. To change the pin, modify Led(gpioPin: GPIO_NUM_8)

var ledValue: Bool = false
var led: Led?

@_cdecl("_Z5setupv")
func setup() {
  print("Hello from Swift on ESP32-C6!")
  led = Led(gpioPin: GPIO_NUM_8)
}

@_cdecl("_Z4loopv")
func loop() {
  led?.setLed(value: ledValue)
  ledValue.toggle()  // Toggle the boolean value
  delay(UInt(CONFIG_LED_BLINK_INTERVAL_MS))
}
