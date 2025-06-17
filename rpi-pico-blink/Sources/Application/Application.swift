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

import RP2040

@main
struct Application {
  // swift-format-ignore: NeverUseImplicitlyUnwrappedOptionals
  static var board: RP2040! = nil

  static func main() {
    board = RP2040()

    board.setMode(.output, pin: .d22)
    board.digitalWrite(pin: .d22, true)

    let str: StaticString = "Hello Swift!"

    board.sleep(forMilliseconds: 1000)

    board.digitalWrite(pin: .d22, false)

    while true {
      str.withUTF8Buffer { buffer in
        for ch in buffer {
          emit(ch)
        }
        delay(7)
      }
    }
  }

  static func delay(_ count: Int = 1) {
    board.sleep(forMilliseconds: 100 * count)
  }

  static func dot() {
    board.digitalWrite(pin: .d22, true)
    delay()
    board.digitalWrite(pin: .d22, false)
    delay()
  }

  static func dash() {
    board.digitalWrite(pin: .d22, true)
    delay(3)
    board.digitalWrite(pin: .d22, false)
    delay()
  }

  static func letter(_ codes: () -> Void) {
    codes()
    delay(3)
  }

  static func emit(_ ch: UInt8) {
    switch ch {
    case 0x41, 0x61:
      letter {
        dot()
        dash()
      }
    case 0x42, 0x62:
      letter {
        dash()
        dot()
        dot()
        dot()
      }
    case 0x43, 0x63:
      letter {
        dash()
        dot()
        dash()
        dot()
      }
    case 0x44, 0x64:
      letter {
        dash()
        dot()
        dot()
      }
    case 0x45, 0x65: letter { dot() }
    case 0x46, 0x66:
      letter {
        dot()
        dot()
        dash()
        dot()
      }
    case 0x47, 0x67:
      letter {
        dash()
        dash()
        dot()
      }
    case 0x48, 0x68:
      letter {
        dot()
        dot()
        dot()
        dot()
      }
    case 0x49, 0x69:
      letter {
        dot()
        dot()
      }
    case 0x4A, 0x6A:
      letter {
        dot()
        dash()
        dash()
        dash()
      }
    case 0x4B, 0x6B:
      letter {
        dash()
        dot()
        dash()
      }
    case 0x4C, 0x6C:
      letter {
        dot()
        dash()
        dot()
        dot()
      }
    case 0x4D, 0x6D:
      letter {
        dash()
        dash()
      }
    case 0x4E, 0x6E:
      letter {
        dash()
        dot()
      }
    case 0x4F, 0x6F:
      letter {
        dash()
        dash()
        dash()
      }
    case 0x50, 0x70:
      letter {
        dot()
        dash()
        dash()
        dot()
      }
    case 0x51, 0x71:
      letter {
        dash()
        dash()
        dot()
        dash()
      }
    case 0x52, 0x72:
      letter {
        dot()
        dash()
        dot()
      }
    case 0x53, 0x73:
      letter {
        dot()
        dot()
        dot()
      }
    case 0x54, 0x74: letter { dash() }
    case 0x55, 0x75:
      letter {
        dot()
        dot()
        dash()
      }
    case 0x56, 0x76:
      letter {
        dot()
        dot()
        dot()
        dash()
      }
    case 0x57, 0x77:
      letter {
        dot()
        dash()
        dash()
      }
    case 0x58, 0x78:
      letter {
        dash()
        dot()
        dot()
        dash()
      }
    case 0x59, 0x79:
      letter {
        dash()
        dot()
        dash()
        dash()
      }
    case 0x5A, 0x7A:
      letter {
        dash()
        dash()
        dot()
        dot()
      }
    case 0x31:
      letter {
        dot()
        dash()
        dash()
        dash()
        dash()
      }
    case 0x32:
      letter {
        dot()
        dot()
        dash()
        dash()
        dash()
      }
    case 0x33:
      letter {
        dot()
        dot()
        dot()
        dash()
        dash()
      }
    case 0x34:
      letter {
        dot()
        dot()
        dot()
        dot()
        dash()
      }
    case 0x35:
      letter {
        dot()
        dot()
        dot()
        dot()
        dot()
      }
    case 0x36:
      letter {
        dash()
        dot()
        dot()
        dot()
        dot()
      }
    case 0x37:
      letter {
        dash()
        dash()
        dot()
        dot()
        dot()
      }
    case 0x38:
      letter {
        dash()
        dash()
        dash()
        dot()
        dot()
      }
    case 0x39:
      letter {
        dash()
        dash()
        dash()
        dash()
        dot()
      }
    case 0x30:
      letter {
        dash()
        dash()
        dash()
        dash()
        dash()
      }
    case 0x2E:
      letter {
        dot()
        dash()
        dot()
        dash()
        dot()
        dash()
      }
    case 0x2C:
      letter {
        dash()
        dash()
        dot()
        dot()
        dash()
        dash()
      }
    case 0x3F:
      letter {
        dot()
        dot()
        dash()
        dash()
        dot()
        dot()
      }
    case 0x21:
      letter {
        dash()
        dot()
        dash()
        dot()
        dash()
        dash()
      }
    case 0x2F:
      letter {
        dash()
        dot()
        dot()
        dash()
        dot()
      }
    case 0x28:
      letter {
        dash()
        dot()
        dash()
        dash()
        dot()
      }
    case 0x29:
      letter {
        dash()
        dot()
        dash()
        dash()
        dot()
        dash()
      }
    case 0x20:
      delay(7)
    default:
      break
    }
  }
}
