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

// swift-format-ignore-file

extension RP2040 {
  public enum PinMode {
    case input
    case inputPullup
    case inputPulldown
    case output2mA
    case output4mA
    case output8mA
    case output12mA

    public static var output: PinMode { return .output4mA }
  }
}


public protocol RawPin {
  var rawValue: UInt32 { get }
}

public protocol DigitalPin: RawPin { }

public protocol AnalogPin: RawPin { }

public protocol I2CSDAPin: RawPin { }
public protocol I2CSCLPin: RawPin { }

public protocol I2C0SDAPin: I2CSDAPin { }
public protocol I2C0SCLPin: I2CSCLPin { }

public protocol I2C1SDAPin: I2CSDAPin { }
public protocol I2C1SCLPin: I2CSCLPin { }

public protocol SPISCKPin: RawPin { }
public protocol SPITXPin: RawPin { }
public protocol SPIRXPin: RawPin { }
public protocol SPICSPin: RawPin { }

public protocol SPI0SCKPin: SPISCKPin { }
public protocol SPI0TXPin: SPITXPin { }
public protocol SPI0RXPin: SPIRXPin { }
public protocol SPI0CSPin: SPICSPin { }

public protocol SPI1SCKPin: SPISCKPin { }
public protocol SPI1TXPin: SPITXPin { }
public protocol SPI1RXPin: SPIRXPin { }
public protocol SPI1CSPin: SPICSPin { }

public protocol UARTTXPin: RawPin { }
public protocol UARTRXPin: RawPin { }

public protocol UART0TXPin: UARTTXPin { }
public protocol UART0RXPin: UARTRXPin { }

public protocol UART1TXPin: UARTTXPin { }
public protocol UART1RXPin: UART0RXPin { }

public struct PhysicalPin1: DigitalPin, SPI0RXPin, I2C0SDAPin, UART0TXPin {
  public var rawValue: UInt32 { 0 }
}

public struct PhysicalPin2: DigitalPin, SPI0CSPin, I2C0SCLPin, UART0RXPin {
  public var rawValue: UInt32 { 1 }
}

public struct PhysicalPin3 { } // GND

public struct PhysicalPin4: DigitalPin, SPI0SCKPin, I2C1SDAPin {
  public var rawValue: UInt32 { 2 }
}

public struct PhysicalPin5: DigitalPin, SPI0TXPin, I2C1SCLPin {
  public var rawValue: UInt32 { 3 }
}

public struct PhysicalPin6: DigitalPin, SPI0RXPin, I2C0SDAPin, UART1TXPin {
  public var rawValue: UInt32 { 4 }
}

public struct PhysicalPin7: DigitalPin, SPI0CSPin, I2C0SCLPin, UART1RXPin {
  public var rawValue: UInt32 { 5 }
}

public struct PhysicalPin8 { } // GND

public struct PhysicalPin9: DigitalPin, SPI0SCKPin, I2C1SDAPin {
  public var rawValue: UInt32 { 6 }
}

public struct PhysicalPin10: DigitalPin, SPI0TXPin, I2C1SCLPin {
  public var rawValue: UInt32 { 7 }
}

public struct PhysicalPin11: DigitalPin, SPI1RXPin, I2C0SDAPin, UART1TXPin {
  public var rawValue: UInt32 { 8 }
}

public struct PhysicalPin12: DigitalPin, SPI1CSPin, I2C0SCLPin, UART1RXPin {
  public var rawValue: UInt32 { 9 }
}

public struct PhysicalPin13 { } // GND

public struct PhysicalPin14: DigitalPin, SPI1SCKPin, I2C1SDAPin {
  public var rawValue: UInt32 { 10 }
}

public struct PhysicalPin15: DigitalPin, SPI1TXPin, I2C1SCLPin {
  public var rawValue: UInt32 { 11 }
}

public struct PhysicalPin16: DigitalPin, SPI1RXPin, I2C0SDAPin, UART0TXPin {
  public var rawValue: UInt32 { 12 }
}

public struct PhysicalPin17: DigitalPin, SPI1CSPin, I2C0SCLPin, UART0RXPin {
  public var rawValue: UInt32 { 13 }
}

public struct PhysicalPin18 { } // GND

public struct PhysicalPin19: DigitalPin, SPI1SCKPin, I2C1SDAPin {
  public var rawValue: UInt32 { 14 }
}

public struct PhysicalPin20: DigitalPin, SPI1TXPin, I2C1SCLPin {
  public var rawValue: UInt32 { 15 }
}

public struct PhysicalPin21: DigitalPin, SPI0RXPin, I2C0SDAPin, UART0TXPin {
  public var rawValue: UInt32 { 16 }
}

public struct PhysicalPin22: DigitalPin, SPI0CSPin, I2C0SCLPin, UART0RXPin {
  public var rawValue: UInt32 { 17 }
}

public struct PhysicalPin23 { } // GND

public struct PhysicalPin24: DigitalPin, SPI0SCKPin, I2C1SDAPin {
  public var rawValue: UInt32 { 18 }
}

public struct PhysicalPin25: DigitalPin, SPI0TXPin, I2C1SCLPin {
  public var rawValue: UInt32 { 19 }
}

public struct PhysicalPin26: DigitalPin, I2C0SDAPin {
  public var rawValue: UInt32 { 20 }
}

public struct PhysicalPin27: DigitalPin, I2C0SCLPin {
  public var rawValue: UInt32 { 21 }
}

public struct PhysicalPin28 { } // GND

public struct PhysicalPin29: DigitalPin {
  public var rawValue: UInt32 { 25 }
}

public struct PhysicalPin30 { } // RUN

public struct PhysicalPin31: DigitalPin, AnalogPin, I2C1SDAPin {
  public var rawValue: UInt32 { 26 }
}

public struct PhysicalPin32: DigitalPin, AnalogPin, I2C1SCLPin {
  public var rawValue: UInt32 { 27 }
}

public struct PhysicalPin33 { } // GDN, AGND

public struct PhysicalPin34: DigitalPin, AnalogPin {
  public var rawValue: UInt32 { 28 }
}

public struct PhysicalPin35 { } // ADC_VREF

public struct PhysicalPin36 { } // 3V3

public struct PhysicalPin37 { } // 3V3_EN

public struct PhysicalPin38 { } // GND

public struct PhysicalPin39 { } // VSYS

public struct PhysicalPin40 { } // VBUS

extension DigitalPin where Self == PhysicalPin1 { public static var d0: some DigitalPin { PhysicalPin1() } }
extension DigitalPin where Self == PhysicalPin2 { public static var d1: some DigitalPin { PhysicalPin2() } }
extension DigitalPin where Self == PhysicalPin4 { public static var d2: some DigitalPin { PhysicalPin4() } }
extension DigitalPin where Self == PhysicalPin5 { public static var d3: some DigitalPin { PhysicalPin5() } }
extension DigitalPin where Self == PhysicalPin6 { public static var d4: some DigitalPin { PhysicalPin6() } }
extension DigitalPin where Self == PhysicalPin7 { public static var d5: some DigitalPin { PhysicalPin7() } }
extension DigitalPin where Self == PhysicalPin9 { public static var d6: some DigitalPin { PhysicalPin9() } }
extension DigitalPin where Self == PhysicalPin10 { public static var d7: some DigitalPin { PhysicalPin10() } }
extension DigitalPin where Self == PhysicalPin11 { public static var d8: some DigitalPin { PhysicalPin11() } }
extension DigitalPin where Self == PhysicalPin12 { public static var d9: some DigitalPin { PhysicalPin12() } }
extension DigitalPin where Self == PhysicalPin14 { public static var d10: some DigitalPin { PhysicalPin14() } }
extension DigitalPin where Self == PhysicalPin15 { public static var d11: some DigitalPin { PhysicalPin15() } }
extension DigitalPin where Self == PhysicalPin16 { public static var d12: some DigitalPin { PhysicalPin16() } }
extension DigitalPin where Self == PhysicalPin17 { public static var d13: some DigitalPin { PhysicalPin17() } }
extension DigitalPin where Self == PhysicalPin19 { public static var d14: some DigitalPin { PhysicalPin19() } }
extension DigitalPin where Self == PhysicalPin20 { public static var d15: some DigitalPin { PhysicalPin20() } }
extension DigitalPin where Self == PhysicalPin21 { public static var d16: some DigitalPin { PhysicalPin21() } }
extension DigitalPin where Self == PhysicalPin22 { public static var d17: some DigitalPin { PhysicalPin22() } }
extension DigitalPin where Self == PhysicalPin24 { public static var d18: some DigitalPin { PhysicalPin24() } }
extension DigitalPin where Self == PhysicalPin25 { public static var d19: some DigitalPin { PhysicalPin25() } }
extension DigitalPin where Self == PhysicalPin26 { public static var d20: some DigitalPin { PhysicalPin26() } }
extension DigitalPin where Self == PhysicalPin27 { public static var d21: some DigitalPin { PhysicalPin27() } }
extension DigitalPin where Self == PhysicalPin29 { public static var d22: some DigitalPin { PhysicalPin29() } }
extension DigitalPin where Self == PhysicalPin31 { public static var d26: some DigitalPin { PhysicalPin31() } }
extension DigitalPin where Self == PhysicalPin32 { public static var d27: some DigitalPin { PhysicalPin32() } }
extension DigitalPin where Self == PhysicalPin34 { public static var d28: some DigitalPin { PhysicalPin34() } }

extension SPI0RXPin where Self == PhysicalPin1 { public static var d0: some SPI0RXPin { PhysicalPin1() } }
extension SPI0RXPin where Self == PhysicalPin6 { public static var d4: some SPI0RXPin { PhysicalPin6() } }
extension SPI0RXPin where Self == PhysicalPin21 { public static var d16: some SPI0RXPin { PhysicalPin21() } }

extension SPI0CSPin where Self == PhysicalPin2 { public static var d0: some SPI0CSPin { PhysicalPin2() } }
extension SPI0CSPin where Self == PhysicalPin7 { public static var d5: some SPI0CSPin { PhysicalPin7() } }
extension SPI0CSPin where Self == PhysicalPin22 { public static var d17: some SPI0CSPin { PhysicalPin22() } }

extension SPI0SCKPin where Self == PhysicalPin4 { public static var d2: some SPI0SCKPin { PhysicalPin4() } }
extension SPI0SCKPin where Self == PhysicalPin9 { public static var d6: some SPI0SCKPin { PhysicalPin9() } }
extension SPI0SCKPin where Self == PhysicalPin24 { public static var d18: some SPI0SCKPin { PhysicalPin24() } }

extension SPI0TXPin where Self == PhysicalPin5 { public static var d2: some SPI0TXPin { PhysicalPin5() } }
extension SPI0TXPin where Self == PhysicalPin10 { public static var d7: some SPI0TXPin { PhysicalPin10() } }
extension SPI0TXPin where Self == PhysicalPin25 { public static var d19: some SPI0TXPin { PhysicalPin25() } }

extension SPI1RXPin where Self == PhysicalPin11 { public static var d8: some SPI1RXPin { PhysicalPin11() } }
extension SPI1RXPin where Self == PhysicalPin16 { public static var d12: some SPI1RXPin { PhysicalPin16() } }

extension SPI1CSPin where Self == PhysicalPin12 { public static var d9: some SPI1CSPin { PhysicalPin12() } }
extension SPI1CSPin where Self == PhysicalPin17 { public static var d13: some SPI1CSPin { PhysicalPin17() } }

extension SPI1SCKPin where Self == PhysicalPin14 { public static var d10: some SPI1SCKPin { PhysicalPin14() } }
extension SPI1SCKPin where Self == PhysicalPin19 { public static var d14: some SPI1SCKPin { PhysicalPin19() } }

extension SPI1TXPin where Self == PhysicalPin15 { public static var d11: some SPI1TXPin { PhysicalPin15() } }
extension SPI1TXPin where Self == PhysicalPin20 { public static var d15: some SPI1TXPin { PhysicalPin20() } }

extension I2C0SDAPin where Self == PhysicalPin1 { public static var d0: some I2C0SDAPin { PhysicalPin1() } }
extension I2C0SDAPin where Self == PhysicalPin6 { public static var d4: some I2C0SDAPin { PhysicalPin6() } }
extension I2C0SDAPin where Self == PhysicalPin11 { public static var d8: some I2C0SDAPin { PhysicalPin11() } }
extension I2C0SDAPin where Self == PhysicalPin21 { public static var d16: some I2C0SDAPin { PhysicalPin21() } }
extension I2C0SDAPin where Self == PhysicalPin26 { public static var d20: some I2C0SDAPin { PhysicalPin26() } }

extension I2C0SCLPin where Self == PhysicalPin2 { public static var d1: some I2C0SCLPin { PhysicalPin2() } }
extension I2C0SCLPin where Self == PhysicalPin7 { public static var d5: some I2C0SCLPin { PhysicalPin7() } }
extension I2C0SCLPin where Self == PhysicalPin12 { public static var d9: some I2C0SCLPin { PhysicalPin12() } }
extension I2C0SCLPin where Self == PhysicalPin22 { public static var d17: some I2C0SCLPin { PhysicalPin22() } }
extension I2C0SCLPin where Self == PhysicalPin27 { public static var d21: some I2C0SCLPin { PhysicalPin27() } }

extension I2C1SDAPin where Self == PhysicalPin4 { public static var d2: some I2C1SDAPin { PhysicalPin4() } }
extension I2C1SDAPin where Self == PhysicalPin9 { public static var d6: some I2C1SDAPin { PhysicalPin9() } }
extension I2C1SDAPin where Self == PhysicalPin14 { public static var d10: some I2C1SDAPin { PhysicalPin14() } }
extension I2C1SDAPin where Self == PhysicalPin19 { public static var d14: some I2C1SDAPin { PhysicalPin19() } }
extension I2C1SDAPin where Self == PhysicalPin24 { public static var d18: some I2C1SDAPin { PhysicalPin24() } }
extension I2C1SDAPin where Self == PhysicalPin31 { public static var d26: some I2C1SDAPin { PhysicalPin31() } }

extension I2C1SCLPin where Self == PhysicalPin5 { public static var d3: some I2C1SCLPin { PhysicalPin5() } }
extension I2C1SCLPin where Self == PhysicalPin10 { public static var d7: some I2C1SCLPin { PhysicalPin10() } }
extension I2C1SCLPin where Self == PhysicalPin15 { public static var d11: some I2C1SCLPin { PhysicalPin15() } }
extension I2C1SCLPin where Self == PhysicalPin20 { public static var d15: some I2C1SCLPin { PhysicalPin20() } }
extension I2C1SCLPin where Self == PhysicalPin25 { public static var d19: some I2C1SCLPin { PhysicalPin25() } }
extension I2C1SCLPin where Self == PhysicalPin32 { public static var d27: some I2C1SCLPin { PhysicalPin32() } }

extension UART0TXPin where Self == PhysicalPin1 { public static var d0: some UART0TXPin { PhysicalPin1() } }
extension UART0TXPin where Self == PhysicalPin16 { public static var d12: some UART0TXPin { PhysicalPin16() } }
extension UART0TXPin where Self == PhysicalPin21 { public static var d16: some UART0TXPin { PhysicalPin21() } }

extension UART0RXPin where Self == PhysicalPin2 { public static var d1: some UART0RXPin { PhysicalPin2() } }
extension UART0RXPin where Self == PhysicalPin17 { public static var d13: some UART0RXPin { PhysicalPin17() } }
extension UART0RXPin where Self == PhysicalPin22 { public static var d17: some UART0RXPin { PhysicalPin22() } }

extension UART1TXPin where Self == PhysicalPin6 { public static var d4: some UART1TXPin { PhysicalPin6() } }
extension UART1TXPin where Self == PhysicalPin11 { public static var d8: some UART1TXPin { PhysicalPin11() } }

extension UART1RXPin where Self == PhysicalPin7 { public static var d5: some UART1RXPin { PhysicalPin7() } }
extension UART1RXPin where Self == PhysicalPin12 { public static var d9: some UART1RXPin { PhysicalPin12() } }

extension AnalogPin where Self == PhysicalPin31 { public static var a0: some AnalogPin { PhysicalPin31() } }
extension AnalogPin where Self == PhysicalPin32 { public static var a1: some AnalogPin { PhysicalPin32() } }
extension AnalogPin where Self == PhysicalPin34 { public static var a3: some AnalogPin { PhysicalPin34() } }

extension RP2040 {
  public struct AnyDigitalPin: DigitalPin {
    public var rawValue: UInt32
    
    internal init(rawValue: UInt32) {
      self.rawValue = rawValue
    }
  }
  
  public struct AnyAnalogPin: AnalogPin {
    public var rawValue: UInt32
    
    internal init(rawValue: UInt32) {
      self.rawValue = rawValue
    }
  }
  
  public struct AnyI2C0SDAPin: I2C0SDAPin {
    public var rawValue: UInt32
    internal init(rawValue: UInt32) {
      self.rawValue = rawValue
    }
  }
  
  public struct AnyI2C0SCLPin: I2C0SCLPin {
    public var rawValue: UInt32
    internal init(rawValue: UInt32) {
      self.rawValue = rawValue
    }
  }
  
  public struct AnyI2C1SDAPin: I2C1SDAPin {
    public var rawValue: UInt32
    internal init(rawValue: UInt32) {
      self.rawValue = rawValue
    }
  }
  
  public struct AnyI2C1SCLPin: I2C1SCLPin {
    public var rawValue: UInt32
    internal init(rawValue: UInt32) {
      self.rawValue = rawValue
    }
  }
  
  public struct AnySPI0SCKPin: SPI0SCKPin {
    public var rawValue: UInt32
    internal init(rawValue: UInt32) {
      self.rawValue = rawValue
    }
  }
  
  public struct AnySPI0TXPin: SPI0TXPin {
    public var rawValue: UInt32
    internal init(rawValue: UInt32) {
      self.rawValue = rawValue
    }
  }
  
  public struct AnySPI0RXPin: SPI0RXPin {
    public var rawValue: UInt32
    internal init(rawValue: UInt32) {
      self.rawValue = rawValue
    }
  }
  
  public struct AnySPI0CSPin: SPI0CSPin {
    public var rawValue: UInt32
    internal init(rawValue: UInt32) {
      self.rawValue = rawValue
    }
  }
  
  public struct AnySPI1SCKPin: SPI1SCKPin {
    public var rawValue: UInt32
    internal init(rawValue: UInt32) {
      self.rawValue = rawValue
    }
  }
  
  public struct AnySPI1TXPin: SPI1TXPin {
    public var rawValue: UInt32
    internal init(rawValue: UInt32) {
      self.rawValue = rawValue
    }
  }
  
  public struct AnySPI1RXPin: SPI1RXPin {
    public var rawValue: UInt32
    internal init(rawValue: UInt32) {
      self.rawValue = rawValue
    }
  }
  
  public struct AnySPI1CSPin: SPI1CSPin {
    public var rawValue: UInt32
    internal init(rawValue: UInt32) {
      self.rawValue = rawValue
    }
  }
  
  public struct AnyUART0TXPin: UART0TXPin {
    public var rawValue: UInt32
    internal init(rawValue: UInt32) {
      self.rawValue = rawValue
    }
  }
  
  public struct AnyUART0RXPin: UART0RXPin {
    public var rawValue: UInt32
    internal init(rawValue: UInt32) {
      self.rawValue = rawValue
    }
  }
  
  public struct AnyUART1TXPin: UART1TXPin {
    public var rawValue: UInt32
    internal init(rawValue: UInt32) {
      self.rawValue = rawValue
    }
  }
  
  public struct AnyUART1RXPin: UART1RXPin {
    public var rawValue: UInt32
    internal init(rawValue: UInt32) {
      self.rawValue = rawValue
    }
  }
  
  
  public func digital(pin: some DigitalPin) -> AnyDigitalPin {
    AnyDigitalPin(rawValue: pin.rawValue)
  }
  
  public func analog(pin: some AnalogPin) -> AnyAnalogPin {
    AnyAnalogPin(rawValue: pin.rawValue)
  }
  
  public func i2c0(sda pin: some I2C0SDAPin) -> AnyI2C0SDAPin {
    AnyI2C0SDAPin(rawValue: pin.rawValue)
  }

  public func i2c0(scl pin: some I2C0SCLPin) -> AnyI2C0SCLPin {
    AnyI2C0SCLPin(rawValue: pin.rawValue)
  }

  public func i2c1(sda pin: some I2C1SDAPin) -> AnyI2C1SDAPin {
    AnyI2C1SDAPin(rawValue: pin.rawValue)
  }

  public func i2c1SCL(scl pin: some I2C1SCLPin) -> AnyI2C1SCLPin {
    AnyI2C1SCLPin(rawValue: pin.rawValue)
  }

  public func spi0(sck pin: some SPI0SCKPin) -> AnySPI0SCKPin {
    AnySPI0SCKPin(rawValue: pin.rawValue)
  }

  public func spi0(tx pin: some SPI0TXPin) -> AnySPI0TXPin {
    AnySPI0TXPin(rawValue: pin.rawValue)
  }

  public func spi0(rx pin: some SPI0RXPin) -> AnySPI0RXPin {
    AnySPI0RXPin(rawValue: pin.rawValue)
  }

  public func spi0(cs pin: some SPI0CSPin) -> AnySPI0CSPin {
    AnySPI0CSPin(rawValue: pin.rawValue)
  }

  public func spi1(sck pin: some SPI1SCKPin) -> AnySPI1SCKPin {
    AnySPI1SCKPin(rawValue: pin.rawValue)
  }

  public func spi1(tx pin: some SPI1TXPin) -> AnySPI1TXPin {
    AnySPI1TXPin(rawValue: pin.rawValue)
  }

  public func spi1(rx pin: some SPI1RXPin) -> AnySPI1RXPin {
    AnySPI1RXPin(rawValue: pin.rawValue)
  }

  public func spi1(cs pin: some SPI1CSPin) -> AnySPI1CSPin {
    AnySPI1CSPin(rawValue: pin.rawValue)
  }

  public func uart0(tx pin: some UART0TXPin) -> AnyUART0TXPin {
    AnyUART0TXPin(rawValue: pin.rawValue)
  }

  public func uart0(rx pin: some UART0RXPin) -> AnyUART0RXPin {
    AnyUART0RXPin(rawValue: pin.rawValue)
  }

  public func uart1(tx pin: some UART1TXPin) -> AnyUART1TXPin {
    AnyUART1TXPin(rawValue: pin.rawValue)
  }

  public func uart1(rx pin: some UART1RXPin) -> AnyUART1RXPin {
    AnyUART1RXPin(rawValue: pin.rawValue)
  }
}
