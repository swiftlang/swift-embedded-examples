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
import MMIO

class MemoryI2CDevice {
    let address: UInt32
    var memoryValue: UInt8?

    convenience init(I2C1_SCL: UInt32, I2C1_SDA: UInt32) {
        self.init(I2C1_SCL: I2C1_SCL, I2C1_SDA: I2C1_SDA, address: 0x42, enableInternalPullUp: false)
    }

    init(I2C1_SCL: UInt32, I2C1_SDA: UInt32, address: UInt32, enableInternalPullUp: Bool) {
        self.address = address
        configureI2CPin(I2C1_SDA, enableInternalPullUp: enableInternalPullUp)
        configureI2CPin(I2C1_SCL, enableInternalPullUp: enableInternalPullUp)
        disableI2C()
        configBus()
        enableI2C()
    }

    private func enableI2C() {
         i2c1.ic_enable.write { w in w.storage = 1 }
    }

    private func disableI2C() {
         i2c1.ic_enable.write { w in w.storage = 0 }
    }

    private func configBus() {
        // Configure I2C0 as CONTROLLER
        // First, disable I2C. This is required to set IC_CON.

        // Config as peripheral
        i2c1.ic_con.write { w in
            w.raw.master_mode = 0
            w.raw.speed = 1
            w.raw.ic_restart_en = 1
            w.raw.ic_slave_disable = 0
        }

        // Set peripheral address
        i2c1.ic_sar.write { w in
            w.storage = 0x42
        }
    }

    public func receiveBytesToMemory() {
        // Wait for messages
        waitForCondition {
            i2c1.ic_status.read().raw.rfne != 0
        }

        self.memoryValue = UInt8(truncatingIfNeeded: i2c1.ic_data_cmd.read().raw.dat) &+ 1
    }

    public func serveBytesFromMemory() {
        // Wait for read requests
        waitForCondition {
            i2c1.ic_raw_intr_stat.read().raw.rd_req != 0
        }

        // Clear read request (RD_REQ)
        _ = i2c1.ic_clr_rd_req.read()

        // Reply with incremented value saved in memory
        i2c1.ic_data_cmd.write { w in
            w.raw.dat = UInt32(memoryValue ?? 0)
            w.raw.cmd = 0
            w.raw.stop = 0
            w.raw.restart = 0
        }
    }
}