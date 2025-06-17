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

import STM32F7X6
import Support

@main
struct Application {
  static let logoSize = Size(
    width: LTDC.Constants.layerWidth,
    height: LTDC.Constants.layerHeight)
  static let displaySize = Size(
    width: LTDC.Constants.displayWidth,
    height: LTDC.Constants.displayHeight)
  static let maxLogoPosition = Point(
    x: Self.displaySize.width - Self.logoSize.width,
    y: Self.displaySize.height - Self.logoSize.height)

  static func main() {
    // FIXME: remove sleep hack for some bug in clock configuration
    Self.delay(milliseconds: 1)
    configureFlash()
    initializeLTCD()
    ltdc.configure()

    var logoPosition = Point(x: 100, y: 100)
    var logoDelta = Point(x: 1, y: 1)
    var backgroundGray: UInt8 = .min
    var backgroundDelta: Int8 = -1

    while true {
      Self.delay(milliseconds: 10)

      if logoPosition.x <= 0 || logoPosition.x >= maxLogoPosition.x {
        logoDelta.x *= -1
      }
      if logoPosition.y <= 0 || logoPosition.y >= maxLogoPosition.y {
        logoDelta.y *= -1
      }
      logoPosition = logoPosition.offset(by: logoDelta)
      ltdc.set(layer: 1, position: logoPosition)

      if backgroundGray == .min || backgroundGray == .max {
        backgroundDelta *= -1
      }
      backgroundGray = UInt8(Int16(backgroundGray) + Int16(backgroundDelta))
      ltdc.set(backgroundColor: .gray(backgroundGray))
    }
  }

  static func delay(milliseconds: Int) {
    for _ in 0..<100_000 * milliseconds {
      nop()
    }
  }

  static func configureFlash() {
    flash.acr.modify { $0.latency = .WS5 }
  }

  static func initializeLTCD() {
    rcc.cfgr.write { $0.raw.storage = 0 }
    rcc.cr.modify { r, w in
      w.hsion = .On
      w.csson = .Off
      w.raw.hseon = 1
      w.raw.pllon = 0
      w.raw.hsebyp = 0
    }
    while rcc.cr.read().raw.hserdy == 0 {}
  }
}
