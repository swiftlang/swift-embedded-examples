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

import _Volatile

#if STM32F746G_DISCOVERY

// Register definitions for STM32F746NG MCU
// https://www.st.com/resource/en/reference_manual/rm0385-stm32f75xxx-and-stm32f74xxx-advanced-armbased-32bit-mcus-stmicroelectronics.pdf

enum GPIOBank: Int {
  case a, b, c, d, e, f, g, h, i, j, k
}
typealias GPIOPin = Int

enum RCC {
    static let BaseAddress = UnsafeMutablePointer<UInt32>(bitPattern: 0x40023800 as UInt)!
    enum Offsets {
        static let AHB1ENR = 0x30
    }
    enum Bits {
        static let AHB1ENR_GPIOAEN = 0
        static let AHB1ENR_GPIOBEN = 1
        static let AHB1ENR_GPIOCEN = 2
        static let AHB1ENR_GPIODEN = 3
        static let AHB1ENR_GPIOEEN = 4
        static let AHB1ENR_GPIOFEN = 5
        static let AHB1ENR_GPIOGEN = 6
        static let AHB1ENR_GPIOHEN = 7
        static let AHB1ENR_GPIOIEN = 8
        static let AHB1ENR_GPIOJEN = 9
        static let AHB1ENR_GPIOKEN = 10
    }

    static func AHB1ENRBit(for bank: GPIOBank) -> Int {
        return switch bank {
            case .a: Bits.AHB1ENR_GPIOAEN
            case .b: Bits.AHB1ENR_GPIOBEN
            case .c: Bits.AHB1ENR_GPIOCEN
            case .d: Bits.AHB1ENR_GPIODEN
            case .e: Bits.AHB1ENR_GPIOEEN
            case .f: Bits.AHB1ENR_GPIOFEN
            case .g: Bits.AHB1ENR_GPIOGEN
            case .h: Bits.AHB1ENR_GPIOHEN
            case .i: Bits.AHB1ENR_GPIOIEN
            case .j: Bits.AHB1ENR_GPIOJEN
            case .k: Bits.AHB1ENR_GPIOKEN
        }
    }
}

enum GPIO {
    static let GPIOa_BaseAddress = UnsafeMutablePointer<UInt32>(bitPattern: 0x40020000 as UInt)!
    static let GPIOb_BaseAddress = UnsafeMutablePointer<UInt32>(bitPattern: 0x40020400 as UInt)!
    static let GPIOc_BaseAddress = UnsafeMutablePointer<UInt32>(bitPattern: 0x40020800 as UInt)!
    static let GPIOd_BaseAddress = UnsafeMutablePointer<UInt32>(bitPattern: 0x40020c00 as UInt)!
    static let GPIOe_BaseAddress = UnsafeMutablePointer<UInt32>(bitPattern: 0x40021000 as UInt)!
    static let GPIOf_BaseAddress = UnsafeMutablePointer<UInt32>(bitPattern: 0x40021400 as UInt)!
    static let GPIOg_BaseAddress = UnsafeMutablePointer<UInt32>(bitPattern: 0x40021800 as UInt)!
    static let GPIOh_BaseAddress = UnsafeMutablePointer<UInt32>(bitPattern: 0x40021c00 as UInt)!
    static let GPIOi_BaseAddress = UnsafeMutablePointer<UInt32>(bitPattern: 0x40022000 as UInt)!
    static let GPIOj_BaseAddress = UnsafeMutablePointer<UInt32>(bitPattern: 0x40022400 as UInt)!
    static let GPIOk_BaseAddress = UnsafeMutablePointer<UInt32>(bitPattern: 0x40022800 as UInt)!

    enum Offsets {
        static let MODER = 0x0
        static let OTYPER = 0x4
        static let OSPEEDR = 0x8
        static let PUPDR = 0xc
        static let IDR = 0x10
        static let ODR = 0x14
    }
}

#elseif NUCLEO_F103RB

// Register definitions for STM32F103RB MCU
// https://www.st.com/resource/en/reference_manual/rm0008-stm32f101xx-stm32f102xx-stm32f103xx-stm32f105xx-and-stm32f107xx-advanced-armbased-32bit-mcus-stmicroelectronics.pdf

enum GPIOBank: Int {
  case a, b, c, d, e, f, g
}
typealias GPIOPin = Int

enum RCC {
    static let BaseAddress = UnsafeMutablePointer<UInt32>(bitPattern: 0x40021000 as UInt)!
    enum Offsets {
        static let APB2ENR = 0x18
    }
    enum Bits {
        static let APB2ENR_IOPAEN = 2
        static let APB2ENR_IOPBEN = 3
        static let APB2ENR_IOPCEN = 4
        static let APB2ENR_IOPDEN = 5
        static let APB2ENR_IOPEEN = 6
        static let APB2ENR_IOPFEN = 7
        static let APB2ENR_IOPGEN = 8
    }

    static func APB2ENRBit(for bank: GPIOBank) -> Int {
        return switch bank {
            case .a: Bits.APB2ENR_IOPAEN
            case .b: Bits.APB2ENR_IOPBEN
            case .c: Bits.APB2ENR_IOPCEN
            case .d: Bits.APB2ENR_IOPDEN
            case .e: Bits.APB2ENR_IOPEEN
            case .f: Bits.APB2ENR_IOPFEN
            case .g: Bits.APB2ENR_IOPGEN
        }
    }
}

enum GPIO {
    static let GPIOa_BaseAddress = UnsafeMutablePointer<UInt32>(bitPattern: 0x40010800 as UInt)!
    static let GPIOb_BaseAddress = UnsafeMutablePointer<UInt32>(bitPattern: 0x40010c00 as UInt)!
    static let GPIOc_BaseAddress = UnsafeMutablePointer<UInt32>(bitPattern: 0x40011000 as UInt)!
    static let GPIOd_BaseAddress = UnsafeMutablePointer<UInt32>(bitPattern: 0x40011400 as UInt)!
    static let GPIOe_BaseAddress = UnsafeMutablePointer<UInt32>(bitPattern: 0x40011800 as UInt)!
    static let GPIOf_BaseAddress = UnsafeMutablePointer<UInt32>(bitPattern: 0x40011c00 as UInt)!
    static let GPIOg_BaseAddress = UnsafeMutablePointer<UInt32>(bitPattern: 0x40012000 as UInt)!

    static func GPIOBaseAddress(for bank: GPIOBank) -> UnsafeMutablePointer<UInt32> {
        return switch bank {
            case .a: GPIOa_BaseAddress
            case .b: GPIOb_BaseAddress
            case .c: GPIOc_BaseAddress
            case .d: GPIOd_BaseAddress
            case .e: GPIOe_BaseAddress
            case .f: GPIOf_BaseAddress
            case .g: GPIOg_BaseAddress
        }
    }

    enum Offsets {
        static let CRL = 0x0
        static let CRH = 0x4
        static let IDR = 0x8
        static let ODR = 0xc
    }
}

#else

#error("Unknown board")

#endif

func setRegisterBit(baseAddress: UnsafeMutablePointer<UInt32>, offset: Int, bit: Int, value: Int) {
    precondition(offset % 4 == 0)
    precondition(bit >= 0 && bit < 32)
    precondition(value >= 0 && value < 2)
    let p = baseAddress.advanced(by: offset / 4)
    let m = VolatileMappedRegister<UInt32>(unsafeBitPattern: UInt(bitPattern: p))
    let previousValue: UInt32 = m.load()
    let newValue: UInt32 = previousValue & ~(1 << UInt32(bit)) | (UInt32(value) << UInt32(bit))
    m.store(newValue)
}

func setRegisterTwoBitField(baseAddress: UnsafeMutablePointer<UInt32>, offset: Int, bitsStartingAt: Int, value: Int) {
    precondition(offset % 4 == 0)
    precondition(bitsStartingAt >= 0 && bitsStartingAt < 31)
    precondition(value >= 0 && value < 4)
    let p = baseAddress.advanced(by: offset / 4)
    let m = VolatileMappedRegister<UInt32>(unsafeBitPattern: UInt(bitPattern: p))
    let previousValue: UInt32 = m.load()
    let newValue: UInt32 = previousValue & ~(0b11 << UInt32(bitsStartingAt)) | (UInt32(value) << UInt32(bitsStartingAt))
    m.store(newValue)
}
