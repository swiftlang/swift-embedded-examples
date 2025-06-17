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

import CLVGL
import Registers
import Support

@main
struct Main {
  static func main() {
    // main is called very early in the boot process; here we are just after
    // (1) reset IRQ entrypoint, (2) enabling FPU, (3) relocating data sections
    // from flash to SRAM. Notably, no HW register configuration has been done
    // yet (except for the FPU enablement), and no static constructors have been
    // called yet.

    // We boot at 16 MHz.
    initDebug()
    initUartOutput()

    withInterruptsDisabled {
      log("initClock()")
      initClocks()

      log("initInterrupts()")
      initInterrupts()

      // Reset the vector table to where it should be.
      log("init VTOR")
      scb.vtor.modify { $0.storage = 0x0800_0000 }
    }

    log("systemSetCoreClock()")
    systemSetCoreClock()

    // We are running at 200 MHz CPU frequency now. Set the UART baud rate to
    // 115200 again based on the new CPU frequency.
    usart1.brr.modify { $0.raw.storage = 100_000_000 / 115_200 }

    log("initGpio()")
    initGpio()
    log("initSdram()")
    initSdram()
    log("Lcd.initialize()")
    Lcd.initialize()

    log("initSysTick")
    initSysTick()

    log("TouchPanel.initialize()")
    TouchPanel.initialize()

    // Everything is initialized now. Run application logic.

    //log("dramTest()")
    //dramTest()

    log("lvglDemo()")
    lvglDemo()
  }

  static func dramTest() {
    let dramSizeInUInt32 = dramSize / 4

    func fillAndCheck(pattern: UInt32) {
      for i in 0..<dramSizeInUInt32 {
        dramBaseAsUInt32[i] = pattern
      }
      for i in 0..<dramSizeInUInt32 {
        precondition(dramBaseAsUInt32[i] == pattern)
      }
    }

    func fillAndCheckWithIndexXor(pattern: UInt32) {
      for i in 0..<dramSizeInUInt32 {
        dramBaseAsUInt32[i] = pattern ^ UInt32(i)
      }
      for i in 0..<dramSizeInUInt32 {
        precondition(dramBaseAsUInt32[i] == pattern ^ UInt32(i))
      }
    }

    fillAndCheck(pattern: 0x0)
    fillAndCheck(pattern: 0xFFFF_FFFF)
    fillAndCheck(pattern: 0x5555_5555)
    fillAndCheck(pattern: 0xAAAA_AAAA)
    fillAndCheck(pattern: 0xFF99_22FF)
    fillAndCheckWithIndexXor(pattern: 0x0)
    fillAndCheckWithIndexXor(pattern: 0xFFFF_FFFF)
  }

  static func lvglDemo() {
    lv_init()
    lv_tick_set_cb({ UInt32(uptimeInMs) })

    let bufSize: UInt32 = UInt32(Lcd.LCD_WIDTH * Lcd.LCD_HEIGHT * 4)
    let buf1 = UnsafeMutableRawPointer(bitPattern: 0xC000_0000 as UInt)!
    let buf2 = UnsafeMutableRawPointer(bitPattern: (0xC000_0000 as UInt) + UInt(bufSize))!

    let disp = lv_display_create(Int32(Lcd.LCD_WIDTH), Int32(Lcd.LCD_HEIGHT))!
    lv_display_set_color_format(disp, LV_COLOR_FORMAT_ARGB8888)
    lv_display_set_buffers(disp, buf1, buf2, bufSize, LV_DISPLAY_RENDER_MODE_FULL)
    lv_display_set_flush_cb(
      disp,
      { disp, _, bufferToShow in
        // This is the callback from within LVGL for flushing pixels
        // to the display.  However, since we are in double-buffer
        // mode LVGL just calls us when it's done with the current buffer
        // and it's time to switch, passing the buffer we want to
        // display.   This routine therefore programs the new LCD
        // base address into the LCD hardware and arms the vertical
        // interrupt handler.   Once we get our VBI, we can tell
        // LVGL that we're good to go to switch again.
        Lcd.setFrameBuffer(bufferToShow!)
        lcdInterruptVerticalSyncHandler = {
          lv_display_flush_ready(disp)
          lcdInterruptVerticalSyncHandler = nil
        }
        Lcd.reloadConfiguration()
        // the lv_display_flush_ready() will happen in the LCD frame interrupt.
      })

    let touch = lv_indev_create()
    lv_indev_set_type(touch, LV_INDEV_TYPE_POINTER)
    lv_indev_set_read_cb(
      touch,
      { indev, data in
        let touchData = TouchPanel.readTouchData()
        if touchData.numberOfTouchPoints > 0 {
          data!.pointee.point.x = Int32(touchData.x)
          data!.pointee.point.y = Int32(touchData.y)
          data!.pointee.state = LV_INDEV_STATE_PRESSED
          //print("pressed: \(touchData.x) \(touchData.y)")
        } else {
          data!.pointee.state = LV_INDEV_STATE_RELEASED
          //print("released")
        }
      })

    // Add UI of application logic
    UIAppLogic.createUI()

    log("LVGL setup done, starting render loop")

    while true {
      // If we're pending a render, wait.
      while lcdInterruptVerticalSyncHandler != nil { /* busy wait */ nop() }

      lv_timer_handler()

      // Update UI of application logic
      UIAppLogic.updateFrame()
    }
  }
}
