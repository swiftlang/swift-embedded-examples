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

@main
struct Main {
  static func main() {
    let led = UInt32(PICO_DEFAULT_LED_PIN)
    gpio_init(led)
    gpio_set_dir(led, true)
    while true {
      gpio_put(led, true)
      sleep_ms(250)
      gpio_put(led, false)
      sleep_ms(250)
    }
  }
}
