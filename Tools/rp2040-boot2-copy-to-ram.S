//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift open source project
//
// Copyright (c) 2026 Apple Inc. and the Swift project authors.
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
//
//===----------------------------------------------------------------------===//

// RP2040 second stage bootloader ("boot2") that copies a RAM image from flash
// into SRAM and runs it. macho2uf2.py --flash assembles this file and places
// it at the start of flash, followed by the image.
//
// On a flash boot, the RP2040 bootrom copies the first 256 bytes of flash to
// SRAM at 0x20041f00, checks that their last 4 bytes are a CRC32 of the first
// 252, and jumps to 0x20041f00 (RP2040 datasheet, section 2.8.1). The bootrom
// stack is below 0x20041f00, so the image may use all of SRAM up to there.
//
// This code must be position independent, must not use relocations, and must
// assemble to exactly 252 bytes. macho2uf2.py fills in the three parameter
// words at the end and appends the CRC32.

    .syntax unified
    .thumb
    .text
    .p2align 2

    .thumb_func
_boot2:
    // Configure the flash interface for XIP with standard 03h serial read
    // commands by calling the bootrom function flash_enter_cmd_xip ('CX').
    // The bootrom has already connected the flash pins and left XIP mode.
    movs  r0, #0x18
    ldrh  r2, [r0]              // rom_table_lookup
    movs  r0, #0x14
    ldrh  r0, [r0]              // rom_func_table
    ldr   r1, =('C' | ('X' << 8))
    blx   r2                    // r0 = rom_table_lookup(rom_func_table, 'CX')
    blx   r0                    // flash_enter_cmd_xip()

    // Copy the image from flash into SRAM, one word at a time.
    ldr   r0, Lsource_address
    ldr   r1, Lload_address
    ldr   r2, Lload_size
    adds  r2, r1                // r2 = end of the image in SRAM
Lcopy:
    ldmia r0!, {r3}
    stmia r1!, {r3}
    cmp   r1, r2
    blo   Lcopy

    // Enter the image at its first address, the same way the bootrom starts a
    // RAM image loaded through UF2.
    ldr   r0, Lload_address
    adds  r0, #1                // Thumb bit
    bx    r0

    .ltorg

    // Parameters, filled in by macho2uf2.py.
    .org  240
Lsource_address:
    .long 0                     // Flash address of the image
Lload_address:
    .long 0                     // SRAM address to copy the image to and run it
Lload_size:
    .long 0                     // Image size in bytes, a nonzero multiple of 4
