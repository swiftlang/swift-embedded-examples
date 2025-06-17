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

import Support

public struct RP2040Hardware {
  static var readWriteAliasMask: UInt { 0 << 12 }
  static var xorAliasMask: UInt { 1 << 12 }
  static var setAliasMask: UInt { 2 << 12 }
  static var clearAliasMask: UInt { 3 << 12 }

  static var initialized = false

  public static var systemClockHz = UInt32(0)
  public static var referenceClockHz = UInt32(0)

  public init() {
    if !RP2040Hardware.initialized {
      RP2040Hardware.initialized = true
      resets.reset.set([
        .uart1,
        .uart0,
        .timer,
        .tbman,
        .sysinfo,
        .spi1,
        .spi0,
        .rtc,
        .pwm,
        .pio1,
        .pio0,
        .pads_bank0,
        .jtag,
        .io_bank0,
        .i2c1,
        .i2c0,
        .dma,
        .busctrl,
        .adc,
      ])
      var value = Resets.ResetValue.all
      value.remove([
        .adc,
        .rtc,
        .spi0,
        .spi1,
        .uart0,
        .uart1,
        .usbctrl,
      ])
      resets.reset.clear(value)

      while !resets.resetDone.value.contains(value) {}

      initializeClocks()

      resets.reset.clear(.all)
      padsBank0.gpio[26].modify { $0.inputEnable = false }
      padsBank0.gpio[27].modify { $0.inputEnable = false }
      padsBank0.gpio[28].modify { $0.inputEnable = false }
      padsBank0.gpio[29].modify { $0.inputEnable = false }
    }

    func initialize(
      _ pll: PLL, vcoFrequency: UInt32, postDivisor1: UInt32,
      postDivisor2: UInt32
    ) {
      let referenceFrequency = UInt32(12000 * 1000)

      let fbdiv = vcoFrequency / referenceFrequency

      let pdiv = postDivisor1 << 16 | postDivisor2 << 12

      let resetTarget: Resets.ResetValue =
        pll.unsafeAddress == pllUSB.unsafeAddress ? .pll_usb : .pll_sys
      resets.reset.set(resetTarget)
      resets.reset.clear(resetTarget)
      while !resets.resetDone.value.contains(resetTarget) {}
    }

    func initializeClocks() {
      let xoscKHz = UInt16(12000)
      let usbClockKHz = UInt16(48000)
      let systemClockKHz = UInt32(125000)
      // this is technically hardware dependent (e.g. the adafruit feather has
      // 64 here)
      let multiplier = UInt16(1)
      let freq1KHz = UInt16(1000)

      watchdog.tick.modify {
        $0.cycles = xoscKHz / freq1KHz
        $0.enabled = true
      }

      clocks.resus.modify {
        $0.clear = false
        $0.force = false
        $0.enable = false
        $0.timeout = 0
      }

      while !xosc.status.value.stable {}

      clocks.system.control.clearSource()
      while !clocks.system.selected {}

      clocks.reference.control.clearSource()
      while !clocks.reference.selected {}

      initialize(
        pllSystem, vcoFrequency: 1500 * 1000 * 1000, postDivisor1: 6,
        postDivisor2: 2)
      initialize(
        pllUSB, vcoFrequency: 1200 * 1000 * 1000, postDivisor1: 5,
        postDivisor2: 5)

      RP2040Hardware.referenceClockHz = clocks.reference.configure(
        UInt32(xoscKHz) * UInt32(freq1KHz), UInt32(xoscKHz) * UInt32(freq1KHz))
      RP2040Hardware.systemClockHz = clocks.system.configure(
        systemClockKHz * UInt32(freq1KHz), systemClockKHz * UInt32(freq1KHz))
    }
  }

  static func read(
    _ type: Bool.Type, from unsafeAddress: UInt, offset: UInt = 0,
    bitMask: UInt32 = 0x0000_0001
  ) -> Bool {
    read(UInt8.self, from: unsafeAddress, offset: offset, bitMask: bitMask) != 0
  }

  static func write(_ newValue: Bool, to unsafeAddress: UInt, offset: UInt = 0)
  {
    write(newValue ? UInt8(0x1) : UInt8(0x0), to: unsafeAddress, offset: offset)
  }

  static func read(
    _ type: UInt8.Type, from unsafeAddress: UInt, offset: UInt = 0,
    bitMask: UInt32 = 0x0000_00FF
  ) -> UInt8 {
    // swift-format-ignore: NeverForceUnwrap
    UInt8(
      volatile_load_uint32_t(
        UnsafeMutablePointer<UInt32>(bitPattern: unsafeAddress + offset)!)
        & bitMask)
  }

  static func write(
    _ newValue: UInt8, to unsafeAddress: UInt, offset: UInt = 0,
    bitMask: UInt32 = 0x0000_00FF
  ) {
    // swift-format-ignore: NeverForceUnwrap
    volatile_store_uint32_t(
      UnsafeMutablePointer<UInt32>(bitPattern: unsafeAddress + offset)!,
      UInt32(newValue) & bitMask)
  }

  static func read(
    _ type: UInt16.Type, from unsafeAddress: UInt, offset: UInt = 0,
    bitMask: UInt32 = 0x0000_FFFF
  ) -> UInt16 {
    // swift-format-ignore: NeverForceUnwrap
    UInt16(
      volatile_load_uint32_t(
        UnsafeMutablePointer<UInt32>(bitPattern: unsafeAddress + offset)!)
        & bitMask)
  }

  static func write(
    _ newValue: UInt16, to unsafeAddress: UInt, offset: UInt = 0
  ) {
    // swift-format-ignore: NeverForceUnwrap
    volatile_store_uint32_t(
      UnsafeMutablePointer<UInt32>(bitPattern: unsafeAddress + offset)!,
      UInt32(newValue))
  }

  static func read(
    _ type: UInt32.Type, from unsafeAddress: UInt, offset: UInt = 0
  ) -> UInt32 {
    // swift-format-ignore: NeverForceUnwrap
    volatile_load_uint32_t(
      UnsafeMutablePointer<UInt32>(bitPattern: unsafeAddress + offset)!)
  }

  static func write(
    _ newValue: UInt32, to unsafeAddress: UInt, offset: UInt = 0
  ) {
    // swift-format-ignore: NeverForceUnwrap
    volatile_store_uint32_t(
      UnsafeMutablePointer<UInt32>(bitPattern: unsafeAddress + offset)!,
      newValue)
  }
}

extension RP2040Hardware.Clocks.Reference {
  func configure(_ sourceFrequency: UInt32, _ frequency: UInt32) -> UInt32 {
    precondition(sourceFrequency >= frequency)
    let div = UInt32((UInt64(sourceFrequency) << 8) / UInt64(frequency))
    control.clearReference()
    control.modify {
      $0.source = .xosc_clksrc
    }
    divisor.setRawValue(div)
    return UInt32((UInt64(sourceFrequency) << 8) / UInt64(div))
  }
}

extension RP2040Hardware.Clocks.System {
  func configure(_ sourceFrequency: UInt32, _ frequency: UInt32) -> UInt32 {
    precondition(sourceFrequency >= frequency)
    let div = UInt32((UInt64(sourceFrequency) << 8) / UInt64(frequency))
    control.clearSource()
    while !selected {}
    control.modify {
      $0.source = .clksrc_clk_sys_aux
      $0.auxiliarySource = .xosc_clksrc
    }
    divisor.setRawValue(div)
    return UInt32((UInt64(sourceFrequency) << 8) / UInt64(div))
  }
}
