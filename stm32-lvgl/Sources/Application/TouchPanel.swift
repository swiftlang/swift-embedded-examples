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

struct TouchData {
  var numberOfTouchPoints: Int
  var x: Int
  var y: Int
}

enum TouchPanel {
  static let touchPanel = I2C.init(interface: .i2c3, deviceAddress: 0x38)

  static func initialize() {
    // Init the touch controller
    guard touchPanel.write(data: [0xA4, 0x00]) else {
      print("Init failed")
      return
    }
    guard touchPanel.write(data: [0xA5, 0x00]) else {
      print("Init failed")
      return
    }
  }

  static func readTouchData() -> TouchData {
    // Read device registers 0x00 through 0x06:
    // 0x00 DEVIDE_MODE Device Mode (bits 4...6)
    // 0x01 GEST_ID     Gesture ID
    // 0x02 TD_STATUS   Number of touch points (bits 0...3)
    // 0x03 TOUCH1_XH   1st Event Flag (bits 6...7), 1st Touch X Position Hi Bits (bits 0...3)
    // 0x04 TOUCH1_XL   1st Touch X Position Lo Bits
    // 0x05 TOUCH1_YH   1st Touch ID (bits 4...7), 1st Touch Y Position Hi Bits (bits 0...3)
    // 0x06 TOUCH1_YL   1st Touch Y Position Lo Bits

    guard touchPanel.write(data: [0x00]) else {
      print("Send failed")
      return TouchData(numberOfTouchPoints: 0, x: 0, y: 0)
    }

    var buf = [UInt8](repeating: 0, count: 7)
    guard touchPanel.read(buffer: &buf, length: 7) else {
      print("Read failed")
      return TouchData(numberOfTouchPoints: 0, x: 0, y: 0)
    }

    let x = Int(buf[3] & 0b1111) << 8 | Int(buf[4])
    let y = Int(buf[5] & 0b1111) << 8 | Int(buf[6])

    // On STM32F746G discovery board, the x and y are swapped.
    return TouchData(numberOfTouchPoints: Int(buf[2] & 0b1111), x: y, y: x)
  }

}
