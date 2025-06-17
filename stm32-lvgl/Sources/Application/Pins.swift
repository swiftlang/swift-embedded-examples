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

/// GPIO Port enumerations
enum GPIOPort: UInt32 {
  case portA = 0
  case portB, portC, portD, portE, portF, portG, portH, portI, portJ, portK
}

/// GPIO Pin numbers
enum GPIOPinNumber: UInt32 {
  case pin0 = 0
  case pin1, pin2, pin3, pin4, pin5, pin6, pin7
  case pin8, pin9, pin10, pin11, pin12, pin13, pin14, pin15
  case pin16, pin17, pin18, pin19, pin20, pin21, pin22, pin23
  case pin24, pin25, pin26, pin27, pin28, pin29, pin30, pin31
  case pin32, pin33, pin34, pin35, pin36, pin37, pin38, pin39
  case pin40, pin41
}

/// Alternate Function modes
enum AltFunction: UInt8 {
  case altFunc0 = 0
  case altFunc1, altFunc2, altFunc3, altFunc4, altFunc5, altFunc6, altFunc7
  case altFunc8, altFunc9, altFunc10, altFunc11, altFunc12, altFunc13, altFunc14, altFunc15
}

/// Pull-up/Pull-down configurations
enum GPIOPull: UInt32 {
  case none = 0
  case pullUp
  case pullDown
}

/// GPIO pin speed configurations
enum GPIOSpeed: UInt8 {
  case low = 0
  case medium
  case high
  case max
}

/// GPIO pin modes
enum GPIOMode: UInt32 {
  case input = 0
  case output
  case alternate
  case analog
  case disabled
}

/// GPIO output modes
enum GPIOOutput: UInt32 {
  case pushPull = 0
  case openDrain
}

/// GPIO pin definition structure
struct GPIOPin {
  let name: String
  let port: GPIOPort
  let number: GPIOPinNumber
  let mode: GPIOMode
  let pull: GPIOPull
  let outputType: GPIOOutput
  let altFunction: AltFunction
  let defaultValue: Bool
  let speed: GPIOSpeed
  let activeLow: Bool
  let inUse: Bool
  let isEndOfTable: Bool
}

/// GPIO direct output control structure
struct GPIOOutputDirect {
  let setRegister: UnsafeMutablePointer<UInt32>
  let setValue: UInt32
  let clearRegister: UnsafeMutablePointer<UInt32>
  let clearValue: UInt32
}

/// GPIO direct input control structure
struct GPIOInputDirect {
  let register: UnsafeMutablePointer<UInt32>
  let mask: UInt32
}

/// GPIO mode control structure
struct GPIOModeDirect {
  let modeRegister: UnsafeMutablePointer<UInt32>
  let modeMask: UInt32
  let inputMode: UInt32
  let outputMode: UInt32
}

/// Typealias for GPIO identifier
typealias GPIO = Int

/// Helper functions to create pin configurations
extension GPIOPin {
  static func gpioOutput(name: String, port: GPIOPort, pin: GPIOPinNumber, defaultValue: Bool) -> GPIOPin {
    return GPIOPin(
      name: name,
      port: port,
      number: pin,
      mode: .output,
      pull: .none,
      outputType: .pushPull,
      altFunction: .altFunc0,
      defaultValue: defaultValue,
      speed: .low,
      activeLow: false,
      inUse: true,
      isEndOfTable: false
    )
  }

  static func gpioOutputSpeed(name: String, port: GPIOPort, pin: GPIOPinNumber, defaultValue: Bool, speed: GPIOSpeed)
    -> GPIOPin
  {
    return GPIOPin(
      name: name,
      port: port,
      number: pin,
      mode: .output,
      pull: .none,
      outputType: .pushPull,
      altFunction: .altFunc0,
      defaultValue: defaultValue,
      speed: speed,
      activeLow: false,
      inUse: true,
      isEndOfTable: false
    )
  }

  static func gpioOutputActiveLow(name: String, port: GPIOPort, pin: GPIOPinNumber, defaultValue: Bool) -> GPIOPin {
    return GPIOPin(
      name: name,
      port: port,
      number: pin,
      mode: .output,
      pull: .none,
      outputType: .pushPull,
      altFunction: .altFunc0,
      defaultValue: defaultValue,
      speed: .low,
      activeLow: true,
      inUse: true,
      isEndOfTable: false
    )
  }

  static func gpioOutputOpenDrain(name: String, port: GPIOPort, pin: GPIOPinNumber, defaultValue: Bool) -> GPIOPin {
    return GPIOPin(
      name: name,
      port: port,
      number: pin,
      mode: .output,
      pull: .none,
      outputType: .openDrain,
      altFunction: .altFunc0,
      defaultValue: defaultValue,
      speed: .low,
      activeLow: false,
      inUse: true,
      isEndOfTable: false
    )
  }

  static func gpioOutputOpenDrainActiveLow(name: String, port: GPIOPort, pin: GPIOPinNumber, defaultValue: Bool)
    -> GPIOPin
  {
    return GPIOPin(
      name: name,
      port: port,
      number: pin,
      mode: .output,
      pull: .none,
      outputType: .openDrain,
      altFunction: .altFunc0,
      defaultValue: defaultValue,
      speed: .low,
      activeLow: true,
      inUse: true,
      isEndOfTable: false
    )
  }

  static func altFunction(name: String, port: GPIOPort, pin: GPIOPinNumber, alt: AltFunction, outputType: GPIOOutput)
    -> GPIOPin
  {
    return GPIOPin(
      name: name,
      port: port,
      number: pin,
      mode: .alternate,
      pull: .none,
      outputType: outputType,
      altFunction: alt,
      defaultValue: false,
      speed: .low,
      activeLow: false,
      inUse: true,
      isEndOfTable: false
    )
  }

  static func altFunctionSpeed(
    name: String, port: GPIOPort, pin: GPIOPinNumber, alt: AltFunction, outputType: GPIOOutput, speed: GPIOSpeed
  ) -> GPIOPin {
    return GPIOPin(
      name: name,
      port: port,
      number: pin,
      mode: .alternate,
      pull: .none,
      outputType: outputType,
      altFunction: alt,
      defaultValue: false,
      speed: speed,
      activeLow: false,
      inUse: true,
      isEndOfTable: false
    )
  }

  static func altFunctionSpeedPullUp(
    name: String, port: GPIOPort, pin: GPIOPinNumber, alt: AltFunction, outputType: GPIOOutput, speed: GPIOSpeed
  ) -> GPIOPin {
    return GPIOPin(
      name: name,
      port: port,
      number: pin,
      mode: .alternate,
      pull: .pullUp,
      outputType: outputType,
      altFunction: alt,
      defaultValue: false,
      speed: speed,
      activeLow: false,
      inUse: true,
      isEndOfTable: false
    )
  }

  static func analog(name: String, port: GPIOPort, pin: GPIOPinNumber) -> GPIOPin {
    return GPIOPin(
      name: name,
      port: port,
      number: pin,
      mode: .analog,
      pull: .none,
      outputType: .pushPull,
      altFunction: .altFunc0,
      defaultValue: false,
      speed: .low,
      activeLow: false,
      inUse: true,
      isEndOfTable: false
    )
  }

  static func disabled(name: String, port: GPIOPort, pin: GPIOPinNumber) -> GPIOPin {
    return GPIOPin(
      name: name,
      port: port,
      number: pin,
      mode: .disabled,
      pull: .none,
      outputType: .pushPull,
      altFunction: .altFunc0,
      defaultValue: false,
      speed: .low,
      activeLow: false,
      inUse: true,
      isEndOfTable: false
    )
  }

  static func gpioInput(name: String, port: GPIOPort, pin: GPIOPinNumber) -> GPIOPin {
    return GPIOPin(
      name: name,
      port: port,
      number: pin,
      mode: .input,
      pull: .none,
      outputType: .pushPull,
      altFunction: .altFunc0,
      defaultValue: false,
      speed: .low,
      activeLow: false,
      inUse: true,
      isEndOfTable: false
    )
  }

  static func gpioInputSpeed(name: String, port: GPIOPort, pin: GPIOPinNumber, speed: GPIOSpeed) -> GPIOPin {
    return GPIOPin(
      name: name,
      port: port,
      number: pin,
      mode: .input,
      pull: .none,
      outputType: .pushPull,
      altFunction: .altFunc0,
      defaultValue: false,
      speed: speed,
      activeLow: false,
      inUse: true,
      isEndOfTable: false
    )
  }

  static func gpioInputPullUp(name: String, port: GPIOPort, pin: GPIOPinNumber) -> GPIOPin {
    return GPIOPin(
      name: name,
      port: port,
      number: pin,
      mode: .input,
      pull: .pullUp,
      outputType: .pushPull,
      altFunction: .altFunc0,
      defaultValue: false,
      speed: .low,
      activeLow: false,
      inUse: true,
      isEndOfTable: false
    )
  }

  static func gpioInputPullDown(name: String, port: GPIOPort, pin: GPIOPinNumber) -> GPIOPin {
    return GPIOPin(
      name: name,
      port: port,
      number: pin,
      mode: .input,
      pull: .pullDown,
      outputType: .pushPull,
      altFunction: .altFunc0,
      defaultValue: false,
      speed: .low,
      activeLow: false,
      inUse: true,
      isEndOfTable: false
    )
  }

  static func gpioInputActiveLow(name: String, port: GPIOPort, pin: GPIOPinNumber) -> GPIOPin {
    return GPIOPin(
      name: name,
      port: port,
      number: pin,
      mode: .input,
      pull: .none,
      outputType: .pushPull,
      altFunction: .altFunc0,
      defaultValue: false,
      speed: .low,
      activeLow: true,
      inUse: true,
      isEndOfTable: false
    )
  }

  static func gpioInputActiveLowPullUp(name: String, port: GPIOPort, pin: GPIOPinNumber) -> GPIOPin {
    return GPIOPin(
      name: name,
      port: port,
      number: pin,
      mode: .input,
      pull: .pullUp,
      outputType: .pushPull,
      altFunction: .altFunc0,
      defaultValue: false,
      speed: .low,
      activeLow: true,
      inUse: true,
      isEndOfTable: false
    )
  }

  static func gpioInputActiveLowPullDown(name: String, port: GPIOPort, pin: GPIOPinNumber) -> GPIOPin {
    return GPIOPin(
      name: name,
      port: port,
      number: pin,
      mode: .input,
      pull: .pullDown,
      outputType: .pushPull,
      altFunction: .altFunc0,
      defaultValue: false,
      speed: .low,
      activeLow: true,
      inUse: true,
      isEndOfTable: false
    )
  }

  static func endTable(name: String) -> GPIOPin {
    return GPIOPin(
      name: name,
      port: .portA,
      number: .pin0,
      mode: .disabled,
      pull: .none,
      outputType: .pushPull,
      altFunction: .altFunc0,
      defaultValue: false,
      speed: .low,
      activeLow: false,
      inUse: false,
      isEndOfTable: true
    )
  }
}

/// GPIO pin identifier enum
enum GPIOPinID: Int {
  case greenLED, blueButton
  case uart1TX, uart1RX
  case i2c1SCL, i2c1SDA, i2c3SCL, i2c3SDA
  case bbI2C_SCL, bbI2C_SDA
  case lcdBLCtrl, lcdINT, lcdDISP
  case _sdramA0, _sdramA1, _sdramA2, _sdramA3, _sdramA4, _sdramA5, _sdramA6, _sdramA7
  case _sdramA8, _sdramA9, _sdramA10, _sdramA11
  case _sdramBA0, _sdramBA1
  case _sdramDQ0, _sdramDQ1, _sdramDQ2, _sdramDQ3, _sdramDQ4, _sdramDQ5, _sdramDQ6, _sdramDQ7
  case _sdramDQ8, _sdramDQ9, _sdramDQ10, _sdramDQ11, _sdramDQ12, _sdramDQ13, _sdramDQ14, _sdramDQ15
  case _sdramSDNE0, _sdramSDNWE, _sdramSDNRAS, _sdramSDNCAS, _sdramSDCLK, _sdramSDCKE0
  case _sdramNBL0, _sdramNBL1
  case _lcdHSYNC, _lcdVSYNC, _lcdDOTCLK, _lcdENABLE
  case _lcdB0, _lcdB1, _lcdB2, _lcdB3, _lcdB4, _lcdB5, _lcdB6, _lcdB7
  case _lcdR0, _lcdR1, _lcdR2, _lcdR3, _lcdR4, _lcdR5, _lcdR6, _lcdR7
  case _lcdG0, _lcdG1, _lcdG2, _lcdG3, _lcdG4, _lcdG5, _lcdG6, _lcdG7
  case _ethTXEN, _ethTXD0, _ethTXD1, _ethRXD0, _ethRXD1, _ethRXER, _ethCRSDV
  case _ethMDC, _ethMDIO, _ethREFCLK
  case _ulpiCK, _ulpiSTP, _ulpiDIR, _ulpiNXT
  case _ulpiD0, _ulpiD1, _ulpiD2, _ulpiD3, _ulpiD4, _ulpiD5, _ulpiD6, _ulpiD7
  case otgHSOC
  case tableEnd
}

/// Pin table definition
/// Note: This implementation uses a dictionary-based lookup which requires:
/// - Memory allocations for the dictionary storage
/// - Runtime dependencies (e.g. on getentropy for hash randomization)
/// - Additional overhead for hash table operations
///
/// If these dependencies are unwanted, this code could be optimized to use a
/// compile-time array or a switch statement instead.
let pinTable: [GPIOPinID: GPIOPin] = [
  // The LED on the eval board
  .greenLED: .gpioOutput(name: "GREEN_LED", port: .portI, pin: .pin1, defaultValue: true),

  // User button on the board
  .blueButton: .gpioInput(name: "BLUE_BUTTON", port: .portI, pin: .pin11),

  // Console UART
  .uart1TX: .altFunction(name: "UART1_TX", port: .portA, pin: .pin9, alt: .altFunc7, outputType: .pushPull),
  .uart1RX: .altFunction(name: "UART1_RX", port: .portB, pin: .pin7, alt: .altFunc7, outputType: .pushPull),

  // I2C buses
  .i2c1SCL: .altFunction(name: "I2C1_SCL", port: .portB, pin: .pin8, alt: .altFunc4, outputType: .openDrain),
  .i2c1SDA: .altFunction(name: "I2C1_SDA", port: .portB, pin: .pin9, alt: .altFunc4, outputType: .openDrain),
  .i2c3SCL: .altFunction(name: "I2C3_SCL", port: .portH, pin: .pin7, alt: .altFunc4, outputType: .openDrain),
  .i2c3SDA: .altFunction(name: "I2C3_SDA", port: .portH, pin: .pin8, alt: .altFunc4, outputType: .openDrain),
  .bbI2C_SCL: .gpioInput(name: "BBI2C_SCL", port: .portF, pin: .pin8),
  .bbI2C_SDA: .gpioInput(name: "BBI2C_SDA", port: .portF, pin: .pin9),

  // LCD pins
  .lcdBLCtrl: .gpioOutput(name: "LCD_BL_CTRL", port: .portK, pin: .pin3, defaultValue: true),
  .lcdINT: .gpioInputPullUp(name: "LCD_INT", port: .portI, pin: .pin13),
  .lcdDISP: .gpioOutput(name: "LCD_DISP", port: .portI, pin: .pin12, defaultValue: true),

  // SDRAM pins
  ._sdramA0: .altFunctionSpeed(
    name: "_SDRAM_A0", port: .portF, pin: .pin0, alt: .altFunc12, outputType: .pushPull, speed: .max),
  ._sdramA1: .altFunctionSpeed(
    name: "_SDRAM_A1", port: .portF, pin: .pin1, alt: .altFunc12, outputType: .pushPull, speed: .max),
  ._sdramA2: .altFunctionSpeed(
    name: "_SDRAM_A2", port: .portF, pin: .pin2, alt: .altFunc12, outputType: .pushPull, speed: .max),
  ._sdramA3: .altFunctionSpeed(
    name: "_SDRAM_A3", port: .portF, pin: .pin3, alt: .altFunc12, outputType: .pushPull, speed: .max),
  ._sdramA4: .altFunctionSpeed(
    name: "_SDRAM_A4", port: .portF, pin: .pin4, alt: .altFunc12, outputType: .pushPull, speed: .max),
  ._sdramA5: .altFunctionSpeed(
    name: "_SDRAM_A5", port: .portF, pin: .pin5, alt: .altFunc12, outputType: .pushPull, speed: .max),
  ._sdramA6: .altFunctionSpeed(
    name: "_SDRAM_A6", port: .portF, pin: .pin12, alt: .altFunc12, outputType: .pushPull, speed: .max),
  ._sdramA7: .altFunctionSpeed(
    name: "_SDRAM_A7", port: .portF, pin: .pin13, alt: .altFunc12, outputType: .pushPull, speed: .max),
  ._sdramA8: .altFunctionSpeed(
    name: "_SDRAM_A8", port: .portF, pin: .pin14, alt: .altFunc12, outputType: .pushPull, speed: .max),
  ._sdramA9: .altFunctionSpeed(
    name: "_SDRAM_A9", port: .portF, pin: .pin15, alt: .altFunc12, outputType: .pushPull, speed: .max),
  ._sdramA10: .altFunctionSpeed(
    name: "_SDRAM_A10", port: .portG, pin: .pin0, alt: .altFunc12, outputType: .pushPull, speed: .max),
  ._sdramA11: .altFunctionSpeed(
    name: "_SDRAM_A11", port: .portG, pin: .pin1, alt: .altFunc12, outputType: .pushPull, speed: .max),

  ._sdramBA0: .altFunctionSpeed(
    name: "_SDRAM_BA0", port: .portG, pin: .pin4, alt: .altFunc12, outputType: .pushPull, speed: .max),
  ._sdramBA1: .altFunctionSpeed(
    name: "_SDRAM_BA1", port: .portG, pin: .pin5, alt: .altFunc12, outputType: .pushPull, speed: .max),

  ._sdramDQ0: .altFunctionSpeed(
    name: "_SDRAM_DQ0", port: .portD, pin: .pin14, alt: .altFunc12, outputType: .pushPull, speed: .max),
  ._sdramDQ1: .altFunctionSpeed(
    name: "_SDRAM_DQ1", port: .portD, pin: .pin15, alt: .altFunc12, outputType: .pushPull, speed: .max),
  ._sdramDQ2: .altFunctionSpeed(
    name: "_SDRAM_DQ2", port: .portD, pin: .pin0, alt: .altFunc12, outputType: .pushPull, speed: .max),
  ._sdramDQ3: .altFunctionSpeed(
    name: "_SDRAM_DQ3", port: .portD, pin: .pin1, alt: .altFunc12, outputType: .pushPull, speed: .max),
  ._sdramDQ4: .altFunctionSpeed(
    name: "_SDRAM_DQ4", port: .portE, pin: .pin7, alt: .altFunc12, outputType: .pushPull, speed: .max),
  ._sdramDQ5: .altFunctionSpeed(
    name: "_SDRAM_DQ5", port: .portE, pin: .pin8, alt: .altFunc12, outputType: .pushPull, speed: .max),
  ._sdramDQ6: .altFunctionSpeed(
    name: "_SDRAM_DQ6", port: .portE, pin: .pin9, alt: .altFunc12, outputType: .pushPull, speed: .max),
  ._sdramDQ7: .altFunctionSpeed(
    name: "_SDRAM_DQ7", port: .portE, pin: .pin10, alt: .altFunc12, outputType: .pushPull, speed: .max),
  ._sdramDQ8: .altFunctionSpeed(
    name: "_SDRAM_DQ8", port: .portE, pin: .pin11, alt: .altFunc12, outputType: .pushPull, speed: .max),
  ._sdramDQ9: .altFunctionSpeed(
    name: "_SDRAM_DQ9", port: .portE, pin: .pin12, alt: .altFunc12, outputType: .pushPull, speed: .max),
  ._sdramDQ10: .altFunctionSpeed(
    name: "_SDRAM_DQ10", port: .portE, pin: .pin13, alt: .altFunc12, outputType: .pushPull, speed: .max),
  ._sdramDQ11: .altFunctionSpeed(
    name: "_SDRAM_DQ11", port: .portE, pin: .pin14, alt: .altFunc12, outputType: .pushPull, speed: .max),
  ._sdramDQ12: .altFunctionSpeed(
    name: "_SDRAM_DQ12", port: .portE, pin: .pin15, alt: .altFunc12, outputType: .pushPull, speed: .max),
  ._sdramDQ13: .altFunctionSpeed(
    name: "_SDRAM_DQ13", port: .portD, pin: .pin8, alt: .altFunc12, outputType: .pushPull, speed: .max),
  ._sdramDQ14: .altFunctionSpeed(
    name: "_SDRAM_DQ14", port: .portD, pin: .pin9, alt: .altFunc12, outputType: .pushPull, speed: .max),
  ._sdramDQ15: .altFunctionSpeed(
    name: "_SDRAM_DQ15", port: .portD, pin: .pin10, alt: .altFunc12, outputType: .pushPull, speed: .max),

  ._sdramSDNE0: .altFunctionSpeed(
    name: "_SDRAM_SDNE0", port: .portH, pin: .pin3, alt: .altFunc12, outputType: .pushPull, speed: .max),
  ._sdramSDNWE: .altFunctionSpeed(
    name: "_SDRAM_SDNWE", port: .portH, pin: .pin5, alt: .altFunc12, outputType: .pushPull, speed: .max),
  ._sdramSDNRAS: .altFunctionSpeed(
    name: "_SDRAM_SDNRAS", port: .portF, pin: .pin11, alt: .altFunc12, outputType: .pushPull, speed: .max),
  ._sdramSDNCAS: .altFunctionSpeed(
    name: "_SDRAM_SDNCAS", port: .portG, pin: .pin15, alt: .altFunc12, outputType: .pushPull, speed: .max),
  ._sdramSDCLK: .altFunctionSpeed(
    name: "_SDRAM_SDCLK", port: .portG, pin: .pin8, alt: .altFunc12, outputType: .pushPull, speed: .max),
  ._sdramSDCKE0: .altFunctionSpeed(
    name: "_SDRAM_SDCKE0", port: .portC, pin: .pin3, alt: .altFunc12, outputType: .pushPull, speed: .max),

  ._sdramNBL0: .altFunctionSpeed(
    name: "_SDRAM_NBL0", port: .portE, pin: .pin0, alt: .altFunc12, outputType: .pushPull, speed: .max),
  ._sdramNBL1: .altFunctionSpeed(
    name: "_SDRAM_NBL1", port: .portE, pin: .pin1, alt: .altFunc12, outputType: .pushPull, speed: .max),

  // LCD pins
  ._lcdHSYNC: .altFunction(name: "_LCD_HSYNC", port: .portI, pin: .pin9, alt: .altFunc14, outputType: .pushPull),
  ._lcdVSYNC: .altFunction(name: "_LCD_VSYNC", port: .portI, pin: .pin8, alt: .altFunc14, outputType: .pushPull),
  ._lcdDOTCLK: .altFunction(name: "_LCD_DOTCLK", port: .portI, pin: .pin14, alt: .altFunc14, outputType: .pushPull),
  ._lcdENABLE: .altFunction(name: "_LCD_ENABLE", port: .portK, pin: .pin7, alt: .altFunc14, outputType: .pushPull),

  ._lcdB0: .altFunctionSpeed(
    name: "_LCD_B0", port: .portE, pin: .pin4, alt: .altFunc14, outputType: .pushPull, speed: .max),
  ._lcdB1: .altFunctionSpeed(
    name: "_LCD_B1", port: .portJ, pin: .pin13, alt: .altFunc14, outputType: .pushPull, speed: .max),
  ._lcdB2: .altFunctionSpeed(
    name: "_LCD_B2", port: .portJ, pin: .pin14, alt: .altFunc14, outputType: .pushPull, speed: .max),
  ._lcdB3: .altFunctionSpeed(
    name: "_LCD_B3", port: .portJ, pin: .pin15, alt: .altFunc14, outputType: .pushPull, speed: .max),
  ._lcdB4: .altFunctionSpeed(
    name: "_LCD_B4", port: .portG, pin: .pin12, alt: .altFunc14, outputType: .pushPull, speed: .max),
  ._lcdB5: .altFunctionSpeed(
    name: "_LCD_B5", port: .portK, pin: .pin4, alt: .altFunc14, outputType: .pushPull, speed: .max),
  ._lcdB6: .altFunctionSpeed(
    name: "_LCD_B6", port: .portK, pin: .pin5, alt: .altFunc14, outputType: .pushPull, speed: .max),
  ._lcdB7: .altFunctionSpeed(
    name: "_LCD_B7", port: .portK, pin: .pin6, alt: .altFunc14, outputType: .pushPull, speed: .max),

  ._lcdR0: .altFunctionSpeed(
    name: "_LCD_R0", port: .portI, pin: .pin15, alt: .altFunc14, outputType: .pushPull, speed: .max),
  ._lcdR1: .altFunctionSpeed(
    name: "_LCD_R1", port: .portJ, pin: .pin0, alt: .altFunc14, outputType: .pushPull, speed: .max),
  ._lcdR2: .altFunctionSpeed(
    name: "_LCD_R2", port: .portJ, pin: .pin1, alt: .altFunc14, outputType: .pushPull, speed: .max),
  ._lcdR3: .altFunctionSpeed(
    name: "_LCD_R3", port: .portJ, pin: .pin2, alt: .altFunc14, outputType: .pushPull, speed: .max),
  ._lcdR4: .altFunctionSpeed(
    name: "_LCD_R4", port: .portJ, pin: .pin3, alt: .altFunc14, outputType: .pushPull, speed: .max),
  ._lcdR5: .altFunctionSpeed(
    name: "_LCD_R5", port: .portJ, pin: .pin4, alt: .altFunc14, outputType: .pushPull, speed: .max),
  ._lcdR6: .altFunctionSpeed(
    name: "_LCD_R6", port: .portJ, pin: .pin5, alt: .altFunc14, outputType: .pushPull, speed: .max),
  ._lcdR7: .altFunctionSpeed(
    name: "_LCD_R7", port: .portJ, pin: .pin6, alt: .altFunc14, outputType: .pushPull, speed: .max),

  ._lcdG0: .altFunctionSpeed(
    name: "_LCD_G0", port: .portJ, pin: .pin7, alt: .altFunc14, outputType: .pushPull, speed: .max),
  ._lcdG1: .altFunctionSpeed(
    name: "_LCD_G1", port: .portJ, pin: .pin8, alt: .altFunc14, outputType: .pushPull, speed: .max),
  ._lcdG2: .altFunctionSpeed(
    name: "_LCD_G2", port: .portJ, pin: .pin9, alt: .altFunc14, outputType: .pushPull, speed: .max),
  ._lcdG3: .altFunctionSpeed(
    name: "_LCD_G3", port: .portJ, pin: .pin10, alt: .altFunc14, outputType: .pushPull, speed: .max),
  ._lcdG4: .altFunctionSpeed(
    name: "_LCD_G4", port: .portJ, pin: .pin10, alt: .altFunc14, outputType: .pushPull, speed: .max),
  ._lcdG5: .altFunctionSpeed(
    name: "_LCD_G5", port: .portK, pin: .pin0, alt: .altFunc14, outputType: .pushPull, speed: .max),
  ._lcdG6: .altFunctionSpeed(
    name: "_LCD_G6", port: .portK, pin: .pin1, alt: .altFunc14, outputType: .pushPull, speed: .max),
  ._lcdG7: .altFunctionSpeed(
    name: "_LCD_G7", port: .portK, pin: .pin2, alt: .altFunc14, outputType: .pushPull, speed: .max),

  // Ethernet
  ._ethTXEN: .altFunctionSpeed(
    name: "_ETH_TX_EN", port: .portG, pin: .pin11, alt: .altFunc11, outputType: .pushPull, speed: .max),
  ._ethTXD0: .altFunctionSpeed(
    name: "_ETH_TXD0", port: .portG, pin: .pin13, alt: .altFunc11, outputType: .pushPull, speed: .max),
  ._ethTXD1: .altFunctionSpeed(
    name: "_ETH_TXD1", port: .portG, pin: .pin14, alt: .altFunc11, outputType: .pushPull, speed: .max),
  ._ethRXD0: .altFunctionSpeed(
    name: "_ETH_RXD0", port: .portC, pin: .pin4, alt: .altFunc11, outputType: .pushPull, speed: .max),
  ._ethRXD1: .altFunctionSpeed(
    name: "_ETH_RXD1", port: .portC, pin: .pin5, alt: .altFunc11, outputType: .pushPull, speed: .max),
  ._ethRXER: .altFunctionSpeed(
    name: "_ETH_RXER", port: .portG, pin: .pin2, alt: .altFunc11, outputType: .pushPull, speed: .max),
  ._ethCRSDV: .altFunctionSpeed(
    name: "_ETH_CRS_DV", port: .portA, pin: .pin7, alt: .altFunc11, outputType: .pushPull, speed: .max),
  ._ethMDC: .altFunctionSpeed(
    name: "_ETH_MDC", port: .portC, pin: .pin1, alt: .altFunc11, outputType: .pushPull, speed: .max),
  ._ethMDIO: .altFunctionSpeed(
    name: "_ETH_MDIO", port: .portA, pin: .pin2, alt: .altFunc11, outputType: .pushPull, speed: .max),
  ._ethREFCLK: .altFunctionSpeed(
    name: "_ETH_REF_CLK", port: .portA, pin: .pin1, alt: .altFunc11, outputType: .pushPull, speed: .max),

  // USB HS
  ._ulpiCK: .altFunctionSpeed(
    name: "_ULPI_CK", port: .portA, pin: .pin5, alt: .altFunc10, outputType: .pushPull, speed: .max),
  ._ulpiSTP: .altFunctionSpeed(
    name: "_ULPI_STP", port: .portC, pin: .pin0, alt: .altFunc10, outputType: .pushPull, speed: .max),
  ._ulpiDIR: .altFunctionSpeed(
    name: "_ULPI_DIR", port: .portC, pin: .pin2, alt: .altFunc10, outputType: .pushPull, speed: .max),
  ._ulpiNXT: .altFunctionSpeed(
    name: "_ULPI_NXT", port: .portH, pin: .pin4, alt: .altFunc10, outputType: .pushPull, speed: .max),
  ._ulpiD0: .altFunctionSpeed(
    name: "_ULPI_D0", port: .portA, pin: .pin3, alt: .altFunc10, outputType: .pushPull, speed: .max),
  ._ulpiD1: .altFunctionSpeed(
    name: "_ULPI_D1", port: .portB, pin: .pin0, alt: .altFunc10, outputType: .pushPull, speed: .max),
  ._ulpiD2: .altFunctionSpeed(
    name: "_ULPI_D2", port: .portB, pin: .pin1, alt: .altFunc10, outputType: .pushPull, speed: .max),
  ._ulpiD3: .altFunctionSpeed(
    name: "_ULPI_D3", port: .portB, pin: .pin10, alt: .altFunc10, outputType: .pushPull, speed: .max),
  ._ulpiD4: .altFunctionSpeed(
    name: "_ULPI_D4", port: .portB, pin: .pin11, alt: .altFunc10, outputType: .pushPull, speed: .max),
  ._ulpiD5: .altFunctionSpeed(
    name: "_ULPI_D5", port: .portB, pin: .pin12, alt: .altFunc10, outputType: .pushPull, speed: .max),
  ._ulpiD6: .altFunctionSpeed(
    name: "_ULPI_D6", port: .portB, pin: .pin13, alt: .altFunc10, outputType: .pushPull, speed: .max),
  ._ulpiD7: .altFunctionSpeed(
    name: "_ULPI_D7", port: .portB, pin: .pin5, alt: .altFunc10, outputType: .pushPull, speed: .max),

  .otgHSOC: .gpioInput(name: "OTG_HS_OC", port: .portE, pin: .pin3),
]

let GPIO_CHANNELS = 11

/// Initialize all GPIO pins
func initGpio() {
  for (_, pin) in pinTable {
    if pin.inUse {
      gpioInitPin(pin: pin)
    }
  }
}

/// Track which ports have been enabled
var gpioPortEnabled: [Bool] = Array(repeating: false, count: GPIO_CHANNELS)

/// GPIO port base registers indexed by the port enum
let gpioPortBases: [GPIOA] = [
  gpioa,
  gpiob,
  gpioc,
  gpiod,
  gpioe,
  gpiof,
  gpiog,
  gpioh,
  gpioi,
  gpioj,
  gpiok,
]

/// Map of GPIO pull values to hardware values
let gpioPullupMap: [UInt8] = [
  0,  // GPIO_PINPULL_NONE - See 7.4.4 in RM0390
  1,  // GPIO_PINPULL_UP
  2,  // GPIO_PINPULL_DOWN
]

extension Register<GPIOA.PUPDR> {
  func set(index: Int, value: GPIOA.PUPDR.PUPDR0Values) {
    self.clear(index: index)
    self.modify { $0.storage |= UInt32(value.rawValue) << (2 * index) }
  }
  func clear(index: Int) {
    self.modify { $0.storage &= ~(0b11 << (2 * index)) }
  }
}
extension Register<GPIOA.MODER> {
  func set(index: Int, value: GPIOA.MODER.MODER0Values) {
    self.clear(index: index)
    self.modify { $0.storage |= UInt32(value.rawValue) << (2 * index) }
  }
  func clear(index: Int) {
    self.modify { $0.storage &= ~(0b11 << (2 * index)) }
  }
}
extension Register<GPIOA.OSPEEDR> {
  func set(index: Int, value: GPIOA.OSPEEDR.OSPEEDR0Values) {
    self.clear(index: index)
    self.modify { $0.storage |= UInt32(value.rawValue) << (2 * index) }
  }
  func clear(index: Int) {
    self.modify { $0.storage &= ~(0b11 << (2 * index)) }
  }
}
extension Register<GPIOA.OTYPER> {
  func set(index: Int, value: Bool = true) {
    guard value else {
      self.clear(index: index)
      return
    }
    self.modify { $0.storage |= 1 << (1 * index) }
  }
  func clear(index: Int) {
    self.modify { $0.storage &= ~(1 << (1 * index)) }
  }
}
extension Register<RCC.AHB1ENR> {
  func set(gpioPort index: Int) {
    self.modify { $0.storage |= 1 << (1 * index) }
  }
  func clear(gpioPort index: Int) {
    self.modify { $0.storage &= ~(1 << (1 * index)) }
  }
}
extension Register<GPIOA.BSRR> {
  func set(index: Int) {
    self.write { $0.storage = UInt32(1) << Int(index) }
  }
  func clear(index: Int) {
    self.write { $0.storage = UInt32(1) << (16 + Int(index)) }
  }
}
extension GPIOA {
  func afrSet(index: Int, value: GPIOA.AFRL.AFRL0Values) {
    precondition(index >= 0 && index < 16)
    let afrShift = (index % 8) * 4
    if index >= 8 {
      self.afrh.modify {
        $0.storage &= ~(0b1111 << afrShift)
        $0.storage |= UInt32(value.rawValue) << afrShift
      }
    } else {
      self.afrl.modify {
        $0.storage &= ~(0b1111 << afrShift)
        $0.storage |= UInt32(value.rawValue) << afrShift
      }
    }
  }
}

/// Disable a pin (effectively reset to POR-state)
private func gpioDisabled(pin: GPIOPin) {
  let port = gpioPortBases[Int(pin.port.rawValue)]
  let pinNumber = Int(pin.number.rawValue)

  port.moder.clear(index: pinNumber)  // clear mode to INPUT
  port.otyper.clear(index: pinNumber)  // push-pull

  port.pupdr.clear(index: pinNumber)  // set mode to no pulls
  port.ospeedr.set(index: pinNumber, value: .init(rawValue: pin.speed.rawValue))  // set speed
}

/// Disable a pin by its GPIO identifier
///
/// - Parameter gpio: The GPIO identifier
func gpioDisabled(gpio: GPIO) {
  if let pin = pinTable[GPIOPinID(rawValue: gpio) ?? .tableEnd] {
    gpioDisabled(pin: pin)
  }
}

/// Enable clock for a specific GPIO port
///
/// - Parameter port: The port number to enable
private func enableClockForPort(port: UInt32) {
  // Enable each port at most once, and leave it enabled
  precondition(port < UInt32(GPIO_CHANNELS))

  withInterruptsDisabled {

    if !gpioPortEnabled[Int(port)] {
      gpioPortEnabled[Int(port)] = true

      // Enable the clock for this port
      rcc.ahb1enr.set(gpioPort: Int(port))

      // Wait two peripheral clocks
      delay(2)
    }

  }
}

/// Initialize a single GPIO pin from its configuration
///
/// - Parameter pin: The pin configuration
func gpioInitPin(pin: GPIOPin) {
  // Enable clocks to this port, and leave enabled at all times
  enableClockForPort(port: pin.port.rawValue)

  // Handy pointers
  let port = gpioPortBases[Int(pin.port.rawValue)]
  let pinNumber = pin.number.rawValue

  // Default everything to the state at POR
  gpioDisabled(pin: pin)

  // Set up the pin
  switch pin.mode {
  case .input:
    // For a real input pin, set the pullup mode
    port.pupdr.set(index: Int(pinNumber), value: .init(rawValue: gpioPullupMap[Int(pin.pull.rawValue)]))

  case .output:
    port.moder.set(index: Int(pinNumber), value: .init(rawValue: 1))  // mode OUTPUT

    if pin.outputType == .pushPull {
      port.otyper.clear(index: Int(pinNumber))  // push-pull
    } else {
      port.otyper.set(index: Int(pinNumber))  // open-drain
    }

    // Set the default output value
    if pin.defaultValue {
      port.bsrr.set(index: Int(pinNumber))
    } else {
      port.bsrr.clear(index: Int(pinNumber))
    }

  case .alternate:
    port.moder.set(index: Int(pinNumber), value: .init(rawValue: 2))  // mode ALT FUNC

    // Set the alternate function
    port.afrSet(index: Int(pinNumber), value: .init(rawValue: pin.altFunction.rawValue))

    // push-pull or open-drain
    port.otyper.set(index: Int(pinNumber), value: pin.outputType == .openDrain)

  case .analog:
    port.moder.set(index: Int(pinNumber), value: .init(rawValue: 3))  // mode ANALOG

  case .disabled:
    // Already handled by gpioDisabled
    break
  }
}
