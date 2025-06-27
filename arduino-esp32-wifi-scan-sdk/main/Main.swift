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

@_cdecl("_Z5setupv")
func setup() {
  print("Hello from Swift on a ESP32-C6!")
}

@_cdecl("_Z4loopv")
func loop() {
  print("Scanning...")
  let count = WiFi.scanNetworks(false, true)
  print("Found \(count) networks:")
  for i in 0..<UInt8(count) {
    print("- \(WiFi.SSID(i)) @ \(WiFi.RSSI(i))dBm,")
  }
  delay(UInt(CONFIG_WIFI_SCAN_INTERVAL_MS))
}
