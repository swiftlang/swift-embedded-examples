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

import MMIO
import Registers
import Support

enum Lcd {
  static let LCD_HSYNC: UInt32 = 10
  static let LCD_VSYNC: UInt32 = 2
  static let LCD_HBP: UInt32 = 43
  static let LCD_VBP: UInt32 = 12
  static let LCD_WIDTH: UInt32 = 480
  static let LCD_HEIGHT: UInt32 = 272
  static let LCD_HFP: UInt32 = 8
  static let LCD_VFP: UInt32 = 4
  static let LCD_PIXSIZE: UInt32 = 4
  static let SDRAM_BASE: UInt32 = 0xC000_0000

  /// Initialize the LTDC module and get the display panel running.
  static func initialize() {
    // Configure the PLL for the display refresh. The LTDC has its own PLL.
    // This code sets the DOTCLK to 8MHz or so.
    let sain: UInt32 = 192
    let saiq = rcc.pllsaicfgr.read().raw.pllsaiq
    let sair: UInt32 = 4

    rcc.pllsaicfgr.write {
      $0.raw.pllsain = sain
      $0.raw.pllsaiq = saiq
      $0.raw.pllsair = sair
    }
    rcc.dckcfgr1.modify { $0.pllsaidivr = .Div8 }
    rcc.cr.modify { $1.raw.pllsaion = 1 }

    // Wait for PLLSAI to be ready
    while rcc.cr.read().raw.pllsairdy == 0 { /* busy wait */  }

    // Enable clock to the LCD controller
    rcc.apb2enr.modify { $0.raw.ltdcen = 1 }

    // Program the timing parameters for the panel
    ltdc.sscr.write {
      $0.raw.hsw = LCD_HSYNC - 1
      $0.raw.vsh = LCD_VSYNC - 1
    }
    ltdc.bpcr.write {
      $0.raw.ahbp = LCD_HSYNC + LCD_HBP - 1
      $0.raw.avbp = LCD_VSYNC + LCD_VBP - 1
    }
    ltdc.awcr.write {
      $0.raw.aaw = LCD_HSYNC + LCD_HBP + LCD_WIDTH - 1
      $0.raw.aah = LCD_VSYNC + LCD_VBP + LCD_HEIGHT - 1
    }
    ltdc.twcr.write {
      $0.raw.totalw = LCD_HSYNC + LCD_HBP + LCD_WIDTH + LCD_HFP - 1
      $0.raw.totalh = LCD_VSYNC + LCD_VBP + LCD_HEIGHT + LCD_VFP - 1
    }

    // Set background color to black
    ltdc.bccr.write { $0.raw.storage = 0 }

    // Configure layer 1
    let h_start = LCD_HSYNC + LCD_HBP + 0
    let h_stop = LCD_HSYNC + LCD_HBP + LCD_WIDTH - 1
    let v_start = LCD_VSYNC + LCD_VBP + 0
    let v_stop = LCD_VSYNC + LCD_VBP + LCD_HEIGHT - 1
    let pitch = LCD_WIDTH * LCD_PIXSIZE
    let length = LCD_WIDTH * LCD_PIXSIZE + 3
    ltdc.layer[0].whpcr.write {
      $0.raw.whsppos = h_stop
      $0.raw.whstpos = h_start
    }
    ltdc.layer[0].wvpcr.write {
      $0.raw.wvsppos = v_stop
      $0.raw.wvstpos = v_start
    }
    ltdc.layer[0].pfcr.write {
      $0.raw.pf = 0  // ARGB8888
    }
    ltdc.layer[0].cfbar.write {
      $0.raw.cfbadd = SDRAM_BASE
    }
    ltdc.layer[0].cfblr.write {
      $0.raw.cfbp = pitch
      $0.raw.cfbll = length
    }
    ltdc.layer[0].cfblnr.write {
      $0.raw.cfblnbr = LCD_HEIGHT
    }
    ltdc.layer[0].cacr.write {
      $0.raw.consta = 0xFF
    }
    ltdc.layer[0].bfcr.write {
      $0.raw.bf1 = 6
      $0.raw.bf2 = 7
    }

    // Enable layer 1
    ltdc.layer[0].cr.modify { $0.raw.len = 1 }

    // Turn on the display
    ltdc.srcr.modify { $0.raw.vbr = 1 }
    ltdc.gcr.modify { $1.ltdcen = .Enabled }

    // Enable interrupts
    ltdc.ier.modify { $0.raw.rrie = 1 }
    nvic.iser2.modify {
      $0.raw.setena = (1 << (88 - 64))  // LTDC_IRQn is typically 88
    }
  }

  static func setFrameBuffer(_ p: UnsafeRawPointer) {
    ltdc.layer[0].cfbar.write { $0.raw.cfbadd = UInt32(UInt(bitPattern: p)) }
  }

  static func reloadConfiguration() {
    ltdc.srcr.modify { $0.raw.vbr = 1 }
  }
}
