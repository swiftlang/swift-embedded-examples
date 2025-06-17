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

@_cdecl("leds_swift_main")
public func cMain(
  _ argc: Int32, _ argv: UnsafeMutablePointer<UnsafeMutablePointer<Int8>?>
) -> Int32 {
  let ret = task_create(
    "led_daemon",
    LEDS_PRIORITY,
    LEDS_STACKSIZE,
    led_daemon,
    nil)

  if ret < 0 {
    print("leds_main: ERROR: Failed to start led_daemon")
    return ret
  }

  print("leds_main: led_daemon started")
  return 0
}
