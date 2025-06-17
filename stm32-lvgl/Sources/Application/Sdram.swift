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

let dramBase = UnsafeMutableRawPointer(bitPattern: 0xC000_0000 as UInt)!
let dramBaseAsUInt32 = UnsafeMutablePointer<UInt32>(bitPattern: 0xC000_0000 as UInt)!
let dramSize = 0x0080_0000  // 8 MB

// SDRAM part is a MT48LC4M32B2B5 (Micron)
// Geometry (bits):   12 row, 8 col, 2 bank
// Data width: 16 bits
// Clock frequency:  133Mhz
// Refresh rate: 4K/64ms.

// The SDRAM clock can only be generated as 1/2 or 1/3 the core clock,
// so we'll run it at 168 / 2 = 84MHz.   Kinda pokey.
// CAS Latency will be 3.

// Initialize the SDRAM controller. This is somewhat specific to
// the chip populated on the discovery board.
func initSdram() {
  // Enable clock to the FMC
  rcc.ahb3enr.modify { $0.fmcen = .Enabled }

  // Program memory device features into FMC_SDCRx
  fmc.sdcr[0].write {
    $0.rpipe = .Clocks1  // One clock cycle pipe delay
    $0.sdclk = .Div2  // SDCLK is 1/2 HCLK
    $0.cas = .Clocks3  // CAS latency 3
    $0.nb = .NB4  // 4 banks
    $0.mwid = .Bits16  // 16 bits wide
    $0.nr = .Bits12  // 12 row bits
    $0.nc = .Bits8  // 8 col bits
  }

  // Program memory timing into FMC_SDTRx
  fmc.sdtr[0].write {
    $0.raw.tmrd = 1  // 1 cycle
    $0.raw.txsr = 5  // 6 cycles, 72ns
    $0.raw.tras = 3  // 4 cycles, 48ns
    $0.raw.trc = 5  // 6 cycles, 72ns
    $0.raw.twr = 1  // 2 cycles for CAS=3
    $0.raw.trp = 1  // 2 cycles, 24ns
    $0.raw.trcd = 1  // 2 cycles, 24ns
  }

  while fmc.sdsr.read().raw.busy != 0 { /* busy wait */  }

  // Set mode bits to '001' and configure FMC_SDCMR to start clock
  fmc.sdcmr.write {
    $0.raw.mode = 1  // Clock config enable
    $0.raw.nrfs = 1  // Number of refresh cycles
    $0.raw.ctb1 = 1  // Chip is on 1st csel
  }

  delay(1000)  // Wait

  // Set mode bits to '010' and configure FMC_SDCMR to issue "precharge all"
  fmc.sdcmr.write {
    $0.raw.mode = 2  // Precharge All
    $0.raw.nrfs = 1  // Number of refresh cycles
    $0.raw.ctb1 = 1  // Chip is on 1st csel
  }

  while fmc.sdsr.read().raw.busy != 0 { /* busy wait */  }

  // Set mode bits to '011' and configure FMC_SDCMR to start auto-refresh
  fmc.sdcmr.write {
    $0.raw.mode = 3  // Start auto-refresh
    $0.raw.nrfs = 4  // Number of refresh cycles
    $0.raw.ctb1 = 1  // Chip is on 1st csel
  }

  while fmc.sdsr.read().raw.busy != 0 { /* busy wait */  }

  // Configure MRD field for specific device (latency) and issue "Load Mode Register"
  fmc.sdcmr.write {
    $0.raw.mode = 4  // Load Mode Register
    $0.raw.nrfs = 1  // Number of refresh cycles
    $0.raw.mrd = 0x230  // Mode value (2<<4)
    $0.raw.ctb1 = 1  // Chip is on 1st csel
  }

  while fmc.sdsr.read().raw.busy != 0 { /* busy wait */  }

  // Program refresh rate into FMC_SDRTR.   64ms spread out over 4K rows, so 15.625us/row
  // with 12ns per cycle, that's 1302 cycles/row.  Subtract 20 so 1282.
  fmc.sdrtr.write {
    $0.raw.count = 683  // Refresh rate
  }

  while fmc.sdsr.read().raw.busy != 0 { /* busy wait */  }

  // Clear out memory.
  for i in 0..<dramSize / 4 {
    dramBaseAsUInt32[i] = 0
  }
}
