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

#include <stddef.h>
#include <stdint.h>

void enable_fpu(void) {
  *(volatile uint32_t *)0xE000ED88 |= (0xF << 20); // set CP10 and CP11 Full Access
}

// Reset entrypoint. Enables FPU, relocates the data sections from FLASH to DRAM
// and jumps to main (implemented in Application/Main.swift).
//
// See linkerscript.ld for a detailed explanation.
__attribute__((naked)) __attribute__((noreturn)) void ResetISR(void) {
  asm volatile("bl    enable_fpu");
  asm volatile("ldr   r0, =__data_start // dst");
  asm volatile("ldr   r1, =__flash_data_start // src");
  asm volatile("ldr   r2, =__flash_data_len // size");
  asm volatile("bl    memcpy");
  asm volatile("bl    main");

  // If main returns, spin.
  asm volatile("b     .");
}

// Implemented in Application/Interrupts.swift
void SystickTimerISR(void);
void LtdcIntHandlerISR(void);

void IntDefaultHandlerISR() { __builtin_trap(); }

// These are provided by the linker script
extern void *__stack_start;
extern void *__stack_end;

// Primary interrupt vector table
__attribute__((section(".vectors"))) const void *Vectors[] = {
    (void *)(((uintptr_t)&__stack_end) - 4), // initial SP
    ResetISR,                                //  1 0x04 The reset handler
    IntDefaultHandlerISR,                    //  2 0x08 The NMI handler
    IntDefaultHandlerISR,                    //  3 0x0C The hard fault handler
    IntDefaultHandlerISR,                    //  4 0x10 The MPU fault handler
    IntDefaultHandlerISR,                    //  5 0x14 The bus fault handler
    IntDefaultHandlerISR,                    //  6 0x18 The usage fault handler
    0,                                       //  7 0x1c Reserved
    0,                                       //  8 0x20 Reserved
    0,                                       //  9 0x24 Reserved
    0,                                       // 10 0x28 Reserved
    IntDefaultHandlerISR,                    // 11 0x2c SVCall handler
    IntDefaultHandlerISR,                    // 12 0x30 Debug monitor handler
    IntDefaultHandlerISR,                    // 13 0x34 Reserved
    IntDefaultHandlerISR,                    // 14 0x38 The PendSV handler
    SystickTimerISR,                         // 15 0x3c The SysTick handler
    IntDefaultHandlerISR,                    // 16 0x40
    IntDefaultHandlerISR,                    // 17 0x44
    IntDefaultHandlerISR,                    // 18 0x48
    IntDefaultHandlerISR,                    // 19 0x4C
    IntDefaultHandlerISR,                    // 20 0x50
    IntDefaultHandlerISR,                    // 21 0x54
    IntDefaultHandlerISR,                    // 22 0x58
    IntDefaultHandlerISR,                    // 23 0x5C
    IntDefaultHandlerISR,                    // 24 0x60
    IntDefaultHandlerISR,                    // 25 0x64
    IntDefaultHandlerISR,                    // 26 0x68
    IntDefaultHandlerISR,                    // 27 0x6C
    IntDefaultHandlerISR,                    // 28 0x70
    IntDefaultHandlerISR,                    // 29 0x74
    IntDefaultHandlerISR,                    // 30 0x78
    IntDefaultHandlerISR,                    // 31 0x7C
    IntDefaultHandlerISR,                    // 32 0x80
    IntDefaultHandlerISR,                    // 33 0x84
    IntDefaultHandlerISR,                    // 34 0x88
    IntDefaultHandlerISR,                    // 35 0x8c
    IntDefaultHandlerISR,                    // 36 0x90
    IntDefaultHandlerISR,                    // 37 0x94
    IntDefaultHandlerISR,                    // 38 0x98
    IntDefaultHandlerISR,                    // 39 0x9c
    IntDefaultHandlerISR,                    // 40 0xA0
    IntDefaultHandlerISR,                    // 41 0xA4
    IntDefaultHandlerISR,                    // 42 0xA8
    IntDefaultHandlerISR,                    // 43 0xAC
    IntDefaultHandlerISR,                    // 44 0xB0
    IntDefaultHandlerISR,                    // 45 0xB4
    IntDefaultHandlerISR,                    // 46 0xB8
    IntDefaultHandlerISR,                    // 47 0xBC
    IntDefaultHandlerISR,                    // 48 0xC0
    IntDefaultHandlerISR,                    // 49 0xC4
    IntDefaultHandlerISR,                    // 50 0xC8
    IntDefaultHandlerISR,                    // 51 0xCC
    IntDefaultHandlerISR,                    // 52 0xD0
    IntDefaultHandlerISR,                    // 53 0xD4
    IntDefaultHandlerISR,                    // 54 0xD8
    IntDefaultHandlerISR,                    // 55 0xDC
    IntDefaultHandlerISR,                    // 56 0xE0
    IntDefaultHandlerISR,                    // 57 0xE4
    IntDefaultHandlerISR,                    // 58 0xE8
    IntDefaultHandlerISR,                    // 59 0xEC
    IntDefaultHandlerISR,                    // 60 0xF0
    IntDefaultHandlerISR,                    // 61 0xF4
    IntDefaultHandlerISR,                    // 62 0xF8
    IntDefaultHandlerISR,                    // 63 0xFC
    IntDefaultHandlerISR,                    // 64 0x100
    IntDefaultHandlerISR,                    // 65 0x104
    IntDefaultHandlerISR,                    // 66 0x108
    IntDefaultHandlerISR,                    // 67 0x10C
    IntDefaultHandlerISR,                    // 68 0x110
    IntDefaultHandlerISR,                    // 69 0x114
    IntDefaultHandlerISR,                    // 70 0x118
    IntDefaultHandlerISR,                    // 71 0x11C
    IntDefaultHandlerISR,                    // 72 0x120
    IntDefaultHandlerISR,                    // 73 0x124
    IntDefaultHandlerISR,                    // 74 0x128
    IntDefaultHandlerISR,                    // 75 0x12C
    IntDefaultHandlerISR,                    // 76 0x130
    IntDefaultHandlerISR,                    // 77 0x134
    0,                                       // 78 0x138
    IntDefaultHandlerISR,                    // 79 0x13C
    IntDefaultHandlerISR,                    // 80 0x140
    IntDefaultHandlerISR,                    // 81 0x144
    IntDefaultHandlerISR,                    // 82 0x148
    IntDefaultHandlerISR,                    // 83 0x14C
    IntDefaultHandlerISR,                    // 84 0x150
    IntDefaultHandlerISR,                    // 85 0x154
    IntDefaultHandlerISR,                    // 86 0x158
    IntDefaultHandlerISR,                    // 87 0x15C
    IntDefaultHandlerISR,                    // 88 0x160
    IntDefaultHandlerISR,                    // 89 0x164
    IntDefaultHandlerISR,                    // 90 0x168
    IntDefaultHandlerISR,                    // 91 0x16C
    IntDefaultHandlerISR,                    // 92 0x170
    IntDefaultHandlerISR,                    // 93 0x174
    IntDefaultHandlerISR,                    // 94 0x178
    0,                                       // 95 0x17C
    0,                                       // 96 0x180
    IntDefaultHandlerISR,                    // 97 0x184
    0,                                       // 98 0x188
    0,                                       // 99 0x18C
    IntDefaultHandlerISR,                    // 100 0x190
    0,                                       // 101 0x194
    IntDefaultHandlerISR,                    // 102 0x198
    IntDefaultHandlerISR,                    // 103 0x19C
    LtdcIntHandlerISR,                       // 104 0x1A0
    0,                                       // 105 0x1A4
    0,                                       // 106 0x1A8
    IntDefaultHandlerISR,                    // 107 0x1AC
    IntDefaultHandlerISR,                    // 108 0x1B0
    IntDefaultHandlerISR,                    // 109 0x1B4
    IntDefaultHandlerISR,                    // 110 0x1B8
    IntDefaultHandlerISR,                    // 111 0x1BC
    IntDefaultHandlerISR,                    // 112 0x1C0
};

// ELF entrypoint, not actually called at runtime, but it's a GC root
void *_start_elf(void) { return (void *)&Vectors; }
