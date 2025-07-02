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

// The following interrupt set up is trickier that it looks on the surface. The
// ISR Swift code must be "trivial" directly and transitively, and namely it
// must avoid destroying any heap objects (because we could be inside malloc
// when the interrupt hits). For that, the expectation is that
// lcdInterruptVerticalSyncHandler is only ever set once, and it not changing
// after boot. The code inside the lcdInterruptVerticalSyncHandler closure is
// expected to only perform trivial operations. lcdInterruptVerticalSyncEnabled
// is allowed to change.

var lcdInterruptVerticalSyncHandler: (() -> Void)? = nil
var lcdInterruptVerticalSyncEnabled: Bool = false

@_cdecl("LtdcIntHandlerISR")
func LtdcIntHandlerISR() {
  let sr = ltdc.isr.read()
  ltdc.icr.write { $0.storage = sr.storage }
  if sr.raw.rrif != 0 {
    if lcdInterruptVerticalSyncEnabled { lcdInterruptVerticalSyncHandler?() }
  }
}
