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

import Registers
import Support

/*
 * STM32F746 clock configuration has the following constraints:
 *
 * Select HSE_BYPASS if an oscillator is used instead of a crystal.
 *
 *   VCO:         100-432MHz
 *   PLL input:  0.95-2.1MHz   (higher is less jitter, but not required)
 *   PLL output:   24-216MHz
 *
 * Maximum HCLK, APB1, APB2:
 *
 *   Power Scale  Over-drive VDD12   HCLK   APB1    APB2
 *        3           Off    1.14v  144MHz  45MHz   90MHz
 *        2           Off    1.26v  168MHz  45MHz   90MHz
 *        2           On     1.26v  180MHz  54MHz  108MHz
 *        1           Off    1.32v  180MHz  45MHz   90MHz
 *        1           On     1.32v  216MHz  54MHz  108MHz
 *
 * Ethernet requires HCLK>=25MHz, and USB-HS requires HCLK>=30MHz.
 *
 * Formulas:
 *
 *   HSE        = OSC_IN             (e.g 25MHz)
 *   PLL input  = HSE / PLLM         (1-2MHz, PLLM=2..63)
 *   VCO        = PLL input * PLLN   (100-432MHz, PLLN=50..432)
 *   PLL output = VCO / PLLP         (24-216MHz, PLLP=2,4,6,8)
 *   HCLK       = PLL output / HPRE  (Power-of-2 divide by 1-512)
 *   APB1       = HCLK / PPRE1       (Power-of-2 divide by 1-16)
 *   APB2       = HCLK / PPRE2       (Power-of-2 divide by 1-16)
 *   USB-FS/RNG = VCO / PLLQ         (48MHz, PLLQ=2..15)
 *
 * APB1/APB2 TIMx timers have dedicated clocks which are 2x or 4x the
 * domain they live in, limited to HCLK. This is selected by the
 * TIMPRE bit in RCC:
 *
 *   TIMPRE    Multiplier
 *     0           2x
 *     1           4x
 *
 * USB-FS requires exactly 48MHz, but this is unused. RNG requires
 * 48MHz or lower.
 */

// The STM32F746-DISCO board has an external 25MHz oscillator
let CPU_TARGET_FREQ = 200

// Values for 200 MHz target freq:
let HSE_BYPASS = true  // Oscillator, not crystal
let PLL_M: UInt32 = 12  // VCO input = 2.083MHz
let PLL_N: UInt32 = 192  // VCO = 400MHz
let PLL_P: UInt32 = 2  // Divide by 2 = 200MHz
let PLL_Q: UInt32 = 9  // Divide by 9 = 44.5MHz
let HPRE: UInt32 = 1  // AHB = 200 / 1 = 200MHz
let PPRE1: UInt32 = 4  // APB1 = 200 / 4 = 50MHz
let PPRE2: UInt32 = 2  // APB2 = 200 / 2 = 100MHz
let VOLTAGE_SCALE: UInt32 = 1  // 180MHz requires voltage scale 1 (1.32v)
let OVERDRIVE = true  // Over-drive required for APB clocks
let TIMER_MUL: UInt32 = 2  // Timer clocks are 2xAPB

// External oscillator or crystal.
let HSE_VALUE: UInt32 = 25_000_000

// This is the built-in oscillator.  It always runs at 16MHz
let HSI_CLOCK: UInt32 = 16_000_000

/// Represents available system clock sources
public enum SystemClock: UInt32 {
  case hsi = 0  // High-Speed Internal oscillator
  case hse = 1  // High-Speed External oscillator
  case pll = 2  // Phase-Locked Loop
  case plli2s = 3  // I2S Phase-Locked Loop
  case pllsai = 4  // SAI Phase-Locked Loop
}

public func enableSystemClock(_ clock: SystemClock, enable: Bool) {
  let v: UInt32 = enable ? 1 : 0
  switch clock {
  case .hsi:
    rcc.cr.modify { $1.raw.hsion = v }
  case .hse:
    rcc.cr.modify { $1.raw.hseon = v }
  case .pll:
    rcc.cr.modify { $1.raw.pllon = v }
  case .plli2s:
    rcc.cr.modify { $1.raw.plli2son = v }
  case .pllsai:
    rcc.cr.modify { $1.raw.pllsaion = v }
  }

  // Dummy read-back as barrier.
  _ = rcc.cr.read()
}

public func waitSystemClock(_ clock: SystemClock, enable: Bool) {
  let v: UInt32 = enable ? 1 : 0
  switch clock {
  case .hsi:
    while rcc.cr.read().raw.hsion != v { /* busy wait */  }
  case .hse:
    while rcc.cr.read().raw.hseon != v { /* busy wait */  }
  case .pll:
    while rcc.cr.read().raw.pllon != v { /* busy wait */  }
  case .plli2s:
    while rcc.cr.read().raw.plli2son != v { /* busy wait */  }
  case .pllsai:
    while rcc.cr.read().raw.pllsaion != v { /* busy wait */  }
  }
}

public func selectSystemClock(_ clock: SystemClock) {
  let sw: UInt32
  let sws: UInt32

  switch clock {
  case .hsi:
    sw = 0  // RCC_CFGR_SW_HSI
    sws = 0  // RCC_CFGR_SWS_HSI
  case .hse:
    sw = 1  // RCC_CFGR_SW_HSE
    sws = 1  // RCC_CFGR_SWS_HSE
  case .pll:
    sw = 2  // RCC_CFGR_SW_PLL
    sws = 2  // RCC_CFGR_SWS_PLL
  default:
    preconditionFailure("Bad clock \(clock)")
  }

  if rcc.cfgr.read().raw.sw != sw {
    // Switch system clock source to the new source
    rcc.cfgr.modify { $0.raw.sw = sw }

    // Wait until selected
    while rcc.cfgr.read().raw.sws != sws { /* busy wait */  }
  }
}

func setFlashWaitStates(_ hclk: UInt32) {
  if (hclk == 0) || (hclk > 216_000_000) {
    preconditionFailure("HCLK out of range")
  }

  // One wait state per 30MHz (exact multiple of 30MHz uses lower number)
  let flash_ws = (hclk - 1) / 30_000_000

  // Set the flash wait states.
  flash.acr.modify { $0.latency = .init(rawValue: UInt8(flash_ws)) }

  // Dummy read-back as barrier.
  _ = flash.acr.read()
}

public func setPllConfiguration(_ config: (hse: Bool, q: UInt32, p: UInt32, n: UInt32, m: UInt32)) {
  // PLLQ direct mapped 2..15
  // PLLP 2->0, 4->1, 6->2, 8->3
  // PLLN direct mapped 50..432
  // PLLM direct mapped 2..63

  // Always assert limits.
  if (config.q < 2) || (config.q > 15) || (config.p < 2) || (config.p > 8) || ((config.p % 1) != 0) || (config.n < 50)
    || (config.n > 432) || (config.m < 2) || (config.m > 63)
  {
    preconditionFailure("PllConfig")
  }

  // Update PLL configuration using structured register access
  rcc.pllcfgr.modify {
    $0.pllsrc = config.hse ? .HSE : .HSI
    $0.raw.pllq = config.q
    $0.raw.pllp = (config.p / 2) - 1
    $0.raw.plln = config.n
    $0.raw.pllm = config.m
  }

  // Dummy barrier read
  _ = rcc.pllcfgr.read()
}

func setVoltageScale(_ scale: UInt32) {
  // Select voltage scaling. This is enacted by hardware when the
  // PLL is turned on. The hardware encoding is the reverse of the
  // documented voltage scale numbers.
  let vosCode: UInt32
  if scale == 1 {
    vosCode = 3
  } else if scale == 2 {
    vosCode = 2
  } else if scale == 3 {
    vosCode = 1
  } else {
    preconditionFailure("Voltage scale must be 1..3")
  }

  pwr.cr1.modify {
    $0.raw.vos = vosCode
  }

  // Dummy read-back as barrier.
  _ = pwr.cr1.read()
}

func setOverdrive(_ overdrive: Bool) {
  // Configure overdrive mode on or off.
  if overdrive {
    // See "Entering Over-drive mode" section 4.1.4 STM32F746 Ref
    // manual.
    pwr.cr1.modify { $0.raw.oden = 1 }

    while pwr.csr1.read().raw.odrdy == 0 {
      // Wait until overdrive ready
    }

    // Enable overdrive switching. This stalls core clock, but
    // this delay is hidden because we are regardless still
    // waiting for the PLL to lock.
    pwr.cr1.modify { $0.raw.odswen = 1 }

    while pwr.csr1.read().raw.odswrdy == 0 {
      // Wait until overdrive switch ready
    }
  } else {
    // Overdrive disable, while system clock is still on HSI.
    pwr.cr1.modify {
      $0.raw.oden = 0
      $0.raw.odswen = 0
    }

    // Dummy read-back as barrier.
    _ = pwr.cr1.read()
  }
}

func setTimerMultiplier(_ multiplier: UInt32) {
  if multiplier == 2 {
    rcc.dckcfgr1.modify { $0.raw.timpre = 0 }
  } else if multiplier == 4 {
    rcc.dckcfgr1.modify { $0.raw.timpre = 1 }
  } else {
    preconditionFailure("Bad TIMPRE")
  }
}

func enableCSS(_ enable: Bool) {
  rcc.cr.modify { $1.csson = enable ? .On : .Off }

  // Dummy read-back as barrier.
  _ = rcc.cr.read()
}

func setOscillator(_ enable: Bool) {
  rcc.cr.modify { $1.hsebyp = enable ? .Bypassed : .NotBypassed }

  // Dummy read-back as barrier.
  _ = rcc.cr.read()
}

extension UInt64 {
  func divideRoundingUp(divideBy: UInt64) -> UInt64 {
    return (self + divideBy - 1) / divideBy
  }
}

func log2_exact(_ val: UInt32) -> UInt32 {
  guard val.nonzeroBitCount == 1 else {
    preconditionFailure("Value \(val) is not a power of 2")
  }
  return UInt32(val.trailingZeroBitCount)
}

extension Main {
  static func setPrescalers(_ prescalers: (hpre: UInt32, ppre1: UInt32, ppre2: UInt32)) {
    let log2_ahb: UInt32 = log2_exact(prescalers.hpre)
    let log2_apb1: UInt32 = log2_exact(prescalers.ppre1)
    let log2_apb2: UInt32 = log2_exact(prescalers.ppre2)

    let hpreCode: UInt32
    if log2_ahb <= 4 {
      // 1, 2, 4, 8, 16 -> 7, 8, 9, 10, 11
      hpreCode = 7 + log2_ahb
    } else {
      // The code for divide-by-32 is skipped for some reason.
      // 64, 128, 256, 512 -> 12, 13, 14, 15
      hpreCode = 6 + log2_ahb
    }
    let ppre1Code: UInt32 = 3 + log2_apb1  // 1,2,4,8,16 -> 3,4,5,6,7
    let ppre2Code: UInt32 = 3 + log2_apb2  // 1,2,4,8,16 -> 3,4,5,6,7

    withInterruptsDisabled {
      rcc.cfgr.modify {
        $0.raw.hpre = hpreCode
        $0.raw.ppre1 = ppre1Code
        $0.raw.ppre2 = ppre2Code
      }
      // Dummy read + wait up to 16 AHB clocks to take effect
      _ = rcc.cfgr.read()
      delay(16)
    }
  }

  static func initClocks() {
    enableSystemClock(.hsi, enable: true)
    waitSystemClock(.hsi, enable: true)
    selectSystemClock(.hsi)

    setPrescalers((1, 1, 1))

    // Set dedicated timer clock multiplier to default 2x.
    setTimerMultiplier(2)

    // 16MHz operation allows zero-wait-state flash.
    setFlashWaitStates(HSI_CLOCK)

    // Disable Clock Security System (CSS).
    enableCSS(false)

    // Disable HSE, PLL, PLLI2S, PLLSAI.
    enableSystemClock(.hse, enable: false)
    enableSystemClock(.pll, enable: false)
    enableSystemClock(.plli2s, enable: false)
    enableSystemClock(.pllsai, enable: false)
    waitSystemClock(.hse, enable: false)
    waitSystemClock(.pll, enable: false)
    waitSystemClock(.plli2s, enable: false)
    waitSystemClock(.pllsai, enable: false)

    // Set PLLCFGR (prescalers and source) to the reset default value
    // for 48MHz operation.
    setPllConfiguration((hse: false, q: 4, p: 2, n: 96, m: 16))

    // Default is crystal.
    setOscillator(false)

    // XXX, HW required delay for the clocks to be set right
    // TODO: figure out which exact operation in the sequence requires the
    // delay
    delay(4)
  }

  static func checkQuiesced() {
    // Check that the system is running from HSI. Otherwise, the setup
    // sequence will disturb active clocks.
    let cfgr = rcc.cfgr.read()
    if cfgr.raw.sw != 0 || cfgr.raw.sws != 0 {
      preconditionFailure("Not quiesced")
    }

    // Check that non-HSI clocks are quiesced, otherwise the setup
    // sequence will be prevented by hardware from updating
    // configuration bits.
    let cr = rcc.cr.read()
    if cr.raw.hseon != 0 || cr.raw.csson != 0 || cr.raw.pllon != 0 || cr.raw.plli2son != 0 || cr.raw.pllsaion != 0 {
      preconditionFailure("Not quiesced")
    }
  }

  static func systemSetCoreClock() {
    withInterruptsDisabled {
      // Check the system has started up sufficiently quiesced, or the
      // config sequence may disturb clocks out of spec, or the micro
      // may prevent some bits from being updated.
      checkQuiesced()

      // We need the PWR block enabled.
      rcc.apb1enr.modify { $0.raw.pwren = 1 }
      delay(32)

      // Set flash controller wait states for the target HCLK. Quiesced
      // state accepts any value (it just runs slow).
      let hclk = UInt64(UInt64(HSE_VALUE) * UInt64(PLL_N)).divideRoundingUp(
        divideBy: UInt64(PLL_M) * UInt64(PLL_P) * UInt64(HPRE))
      if (hclk == 0) || (hclk > 216_000_000) {
        preconditionFailure("HCLK out of range")
      }
      setFlashWaitStates(UInt32(hclk))

      // Configure the target PLL frequency and required voltage.
      setPllConfiguration((hse: true, q: PLL_Q, p: PLL_P, n: PLL_N, m: PLL_M))
      setVoltageScale(VOLTAGE_SCALE)

      // Configure, enable, and wait for the HSE clock.
      setOscillator(HSE_BYPASS)
      enableSystemClock(.hse, enable: true)
      waitSystemClock(.hse, enable: true)

      // Enable and wait for the PLL. PLL t_LOCK<=300usec takes a
      // while. Overdrive Tod_swen<=100usec is also slow, and can be
      // configure concurrently.
      enableSystemClock(.pll, enable: true)
      setOverdrive(OVERDRIVE)
      waitSystemClock(.pll, enable: true)

      // Increase CPU and peripheral dividers. This will very
      // temporarily run the system slow as we are still on 16MHz
      // HSI. Then finally switch to the system to PLL.
      setPrescalers((HPRE, PPRE1, PPRE2))
      selectSystemClock(.pll)

      // Set dedicated timer clock multiplier 2x or 4x.
      setTimerMultiplier(TIMER_MUL)

      // Enable SYSCFG clock in APB2 peripheral clock register
      rcc.apb2enr.modify { $0.raw.syscfgen = 1 }
      delay(32)

      // Enable I/O Compensation Cell
      syscfg.cmpcr.modify { $1.raw.cmp_pd = 1 }
      while syscfg.cmpcr.read().raw.ready == 0 { /* busy wait */  }
    }
  }
}
