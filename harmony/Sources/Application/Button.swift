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

struct Button: ~Copyable {
  var pin: UInt32

  init(pin: UInt32, onPress callback: @convention(c) (UInt32, UInt32) -> Void) {
    self.pin = pin

    gpio_init(pin)
    gpio_set_dir(pin, false) // input
    gpio_pull_up(pin) // pull up the pin
    gpio_set_irq_enabled_with_callback(
      pin, UInt32(GPIO_IRQ_EDGE_FALL.rawValue), true, callback)
  }

  deinit {
    gpio_deinit(self.pin)
  }
}

