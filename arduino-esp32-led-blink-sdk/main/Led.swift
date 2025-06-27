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

// A simple "overlay" to provide nicer APIs in Swift
struct Led {
  var ledPin: UInt8
  init(gpioPin: gpio_num_t) {
    ledPin = UInt8(gpioPin.rawValue)
    pinMode(ledPin, UInt8(OUTPUT))
  }

  func setLed(value: Bool) {
    digitalWrite(ledPin, value ? 1 : 0)
  }
}
