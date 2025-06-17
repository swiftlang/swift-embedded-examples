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

func withInterruptsDisabled(body: () -> Void) {
  let oldMask = primask_get()
  cpsid_i()
  body()
  primask_set(oldMask)
}

extension Main {
  static func initInterrupts() {
    // Disable then clear all RCC interrupts.
    rcc.cir.modify {
      $1.raw.lsirdyie = 0
      $1.raw.lserdyie = 0
      $1.raw.hsirdyie = 0
      $1.raw.hserdyie = 0
      $1.raw.pllrdyie = 0
      $1.raw.plli2srdyie = 0
      $1.raw.pllsairdyie = 0
    }
    rcc.cir.modify {
      $1.raw.lsirdyie = 1
      $1.raw.lserdyie = 1
      $1.raw.hsirdyie = 1
      $1.raw.hserdyie = 1
      $1.raw.pllrdyie = 1
      $1.raw.plli2srdyie = 1
      $1.raw.pllsairdyie = 1
    }
  }
}

var uptimeInMs = 0

extension Main {
  static func initSysTick() {
    stk.rvr.write { $0.raw.reload = 200_000 }  // Set the reload value, ~1ms
    stk.cvr.write { $0.raw.current = 0 }  // Clear the current value

    // Enable the SysTick timer with processor clock
    stk.csr.modify {
      $0.raw.enable = 1
      $0.raw.tickint = 1
      $0.raw.clksource = 1
    }

    // Wait one tick for wrap. This eliminates ambiguity at the
    // zero count. This is only possible if SysTick is
    // (significantly) slower than the core clock.
    while stk.cvr.read().raw.current == 0 { /* busy wait */  }
  }
}

@_cdecl("SystickTimerISR")
func SystickTimerISR() {
  uptimeInMs += 1
}

var lcdInterruptVerticalSyncHandler: (() -> Void)? = nil

@_cdecl("LtdcIntHandlerISR")
func LtdcIntHandlerISR() {
  let sr = ltdc.isr.read()
  ltdc.icr.write { $0.storage = sr.storage }
  if sr.raw.rrif != 0 {
    lcdInterruptVerticalSyncHandler?()
  }
}
