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

class I2CController {
    private var requested = false

    convenience init(I2C0_SCL: UInt32, I2C0_SDA: UInt32) {
        self.init(I2C0_SCL: I2C0_SCL, I2C0_SDA: I2C0_SDA, address: 0x42, enableInternalPullUp: false)
    }

    init(I2C0_SCL: UInt32, I2C0_SDA: UInt32, address: UInt32, enableInternalPullUp: Bool) {
        configureI2CPin(I2C0_SDA, enableInternalPullUp: enableInternalPullUp)
        configureI2CPin(I2C0_SCL, enableInternalPullUp: enableInternalPullUp)
        enableI2C()
    }

    private func enableI2C() {
        i2c0.ic_enable.write { w in w.storage = 1 }
        i2c0.ic_enable.write { w in
            w.raw.enable = 1        // DW_apb_i2c is enabled
            w.raw.abort = 0         // no abort
            w.raw.tx_cmd_block = 0  // tx not blocked
        }
    }

    private func disableI2C() {
         i2c0.ic_enable.write { w in w.storage = 0 }
    }

    func configBus(targetPeripheral: UInt32) {
        // Configure I2C0 as CONTROLLER
        // First, disable I2C. This is required to set IC_CON.
        disableI2C()

        // Config
        i2c0.ic_con.write { w in
            w.raw.master_mode = 1
            w.raw.speed = 1
            w.raw.ic_restart_en = 1
            w.raw.ic_slave_disable = 1
        }

        // Set peripheral address
        i2c0.ic_tar.write { w in
            w.storage = targetPeripheral
        }

        enableI2C()
    }

    public func writeByte(_ byte: UInt8) -> Bool {
        // Wait for available space in TX FIFO
        waitForCondition {
            i2c0.ic_status.read().raw.tfnf != 0 // Transmit FIFO shouldn't be full.
        }

        i2c0.ic_data_cmd.write { w in
            w.raw.dat = UInt32(byte)
            w.raw.cmd = 0           // write
            w.raw.stop = 1          // issue STOP
            w.raw.restart = 0
        }

        // Check for abort
        if i2c0.ic_raw_intr_stat.read().raw.tx_abrt != 0 {
            _ = i2c0.ic_tx_abrt_source.read().storage
            _ = i2c0.ic_clr_tx_abrt.read()
            return false
        }

        return true
    }

    public func requestByteFromMemory() {
        // Wait for available space in TX FIFO
        waitForCondition {
            i2c0.ic_status.read().raw.tfnf != 0 // Transmit FIFO shouldn't be full.
        }

        // Send read command
        i2c0.ic_data_cmd.write { w in
            w.raw.dat = 0
            w.raw.cmd = 1     // read command
            w.raw.stop = 1    // issue STOP
            w.raw.restart = 0
        }

        requested = true
    }

    public func receiveRequestedBytesFromMemory() -> UInt8? {
        if !requested {
            return nil // no request before, so nothing to receive
        }

        // Wait for messages in RX FIFO
        waitForCondition {
            i2c0.ic_status.read().raw.rfne != 0 // received message
        }

        return UInt8(truncatingIfNeeded: i2c0.ic_data_cmd.read().raw.dat)
    }
}