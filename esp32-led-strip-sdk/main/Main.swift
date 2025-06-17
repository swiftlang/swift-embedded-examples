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

@_cdecl("app_main")
func main() {
  print("Hello from Swift on ESP32-C6!")

  let n = 8
  let ledStrip = LedStrip(gpioPin: 0, maxLeds: n)
  ledStrip.clear()

  var colors: [LedStrip.Color] = .init(repeating: .off, count: n)
  while true {
    colors.removeLast()
    colors.insert(.lightRandom, at: 0)

    for index in 0..<n {
      ledStrip.setPixel(index: index, color: colors[index])
    }
    ledStrip.refresh()

    let blinkDelayMs: UInt32 = 500
    vTaskDelay(blinkDelayMs / (1000 / UInt32(configTICK_RATE_HZ)))
  }
}
