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

import RP2350

// swift-format-ignore: AlwaysUseLowerCamelCase
let LED_PIN: UInt32 = 25

/// Configures GPIO pin 25 as a front-end to PIO0.
func configureOutputPin() {
  // Configure GPIO general properties
  pads_bank0.gpio[LED_PIN].modify { rw in
    rw.raw.od = 0  // Enable output
    rw.raw.ie = 0  // Disable input
    rw.raw.pue = 1  // Disable pull up
    rw.raw.pde = 1  // Enable pull down
    rw.raw.schmitt = 1  // Enable schmitt trigger
    rw.raw.slewfast = 0  // Use slow slew rate
  }

  // Configure GPIO function selection to use PIO0
  io_bank0.gpio[LED_PIN].gpio_ctrl.modify { rw in
    rw.raw.funcsel = 0x6  // Forward output from pio0 to this pin
  }

  // Remove pad isolation now that the correct peripheral is driving the pad
  pads_bank0.gpio[LED_PIN].modify { rw in
    rw.raw.iso = 0  // Disable isolation
  }
}

/// Configures PIO0 SM0 with a small program that drives WS2812 leds.
///
/// This is not a general method to load PIO programs like is provided in the
/// pico-sdk. We assume no other programs are loaded into the state machine, as
/// a result we don't need to track program offsets and associated complexity.
///
/// Additionally, this method doesn't reset any state in the PIO or state
/// machines. A more complete implementation will want to use `sm_reset` and
/// `clkdiv_restart` to clear any persisted state.
func configurePio() {
  // Load the assembled program directly into the PIO's instruction memory.
  withUnsafeBytes(of: WS2812.pioInstructions) { pointer in
    let pioInstructions = pointer.assumingMemoryBound(to: UInt16.self)
    for (index, pio_instr) in pioInstructions.enumerated() {
      pio0.instr_mem[index].write { w in
        w.raw.instr_mem0 = UInt32(pio_instr)
      }
    }

    // Configure the PIO program wrap boundaries.
    pio0.sm[0].sm_execctrl.modify { r, w in
      w.raw.wrap_bottom = 1  // Continue at 1
      w.raw.wrap_top = UInt32(pioInstructions.count - 1)  // Wrap after last.
    }
  }

  // Setup the clock diver.
  //
  // From section 8.3.1. Ring Oscillator (ROSC) Overview
  // > The Ring Oscillator (ROSC) ... provides the clock to the cores during
  // > boot, ... the ROSC runs at a nominal 11MHz.
  //
  // Given the 11MHz input clock, the desired output frequency of 800KHz, and
  // that each pio program cycle takes 10 cpu cycles. We can derive an
  // approximate clock division factor.
  //
  // (11MHz) / (800KHz * 10) = 1.375
  //
  // Mapping this to the integer register values:
  //
  // int:  floor(1.375) = 1
  // frac: floor(0.375 * 255) = 95
  pio0.sm[0].sm_clkdiv.write { rw in
    rw.raw.int = 1
    rw.raw.frac = 95
  }

  // Setup how the PIO state machine data pipeline.
  //
  // Use auto pull data from the txfifo into the OSR (output state register)
  // every 24 bits. If no data is in the txfifo, the state machine will stall.
  // Additional bond the RX TX fifos into one larger TX fifo so we can buffer
  // more pixel data.
  pio0.sm[0].sm_shiftctrl.modify { rw in
    rw.raw.autopull = 1  // Enable autopull
    rw.raw.pull_thresh = 24  // 24 bit pull threshold
    rw.raw.out_shiftdir = 0  // Left shift from OSR
    rw.raw.fjoin_tx = 1  // Join RX TX fifos
  }

  // Setup the PIO state machine to output to the correct gpio pins.
  pio0.sm[0].sm_pinctrl.modify { rw in
    rw.raw.set_base = LED_PIN
    rw.raw.set_count = 1
    rw.raw.sideset_base = LED_PIN
    rw.raw.sideset_count = 1
  }

  // Start the state machine, it should immediately stall waiting for data in
  // the txfifo.
  pio0.ctrl.modify { _, w in
    w.raw.sm_enable = 1 << 0  // Enable state machine 0
  }
}

/// Writes an HSV8Pixel to the PIO TX fifo.
func pioWritePixel(_ hsv: HSV8Pixel) {
  let rgb = RGB8Pixel(hsv)

  // Pixels need to be G R B 0 left to right.
  let ws2812Value: UInt32 =
    UInt32(rgb.green) << 24 | UInt32(rgb.red) << 16 | UInt32(rgb.blue) << 8

  func txFifoFull() -> Bool {
    pio0.fstat.read().raw.txfull & 0x1 != 0
  }

  // Wait for the TX fifo to have space before writing to it.
  while txFifoFull() {}

  // Write the pixel value to TX fifo.
  pio0.txf[0].write { w in
    w.raw.txf0 = ws2812Value
  }
}

@main
struct Application {
  static func main() {
    // Take peripherals out of reset
    resets.reset.modify { rw in
      rw.raw.pio0 = 0
      rw.raw.pads_bank0 = 0
      rw.raw.io_bank0 = 0
    }

    var done = false
    while !done {
      let resetDone = resets.reset_done.read().raw
      done =
        resetDone.pio0 == 1 && resetDone.pads_bank0 == 1
        && resetDone.io_bank0 == 1
    }

    configureOutputPin()
    configurePio()

    // Infinitely loop, cycling through colors.
    var color = HSV8Pixel(hue: 0, saturation: .max, value: 64)
    var x: UInt32 = 0
    while true {
      // This is a poor excuse for writing pixel data at some frequency. Really
      // this program should setup the system clocks at a chosen frequency and
      // use the timer peripheral to sleep for N ms.
      if x.isMultiple(of: 1 << 12) {
        pioWritePixel(color)
        color.hue &+= 1
      }
      x &+= 1
    }
  }
}
