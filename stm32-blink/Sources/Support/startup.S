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

  .extern _memcpy
  .extern _main

  .text
  .thumb
  .section __TEXT,__text,regular,pure_instructions
  .syntax unified

// reset handler, main entry point
  .balign 4
  .global _reset
  .thumb_func
_reset:
  ldr   r0, =0x20010000 // dst
  ldr   r1, =0x08000000 // src
  ldr   r2, =segment$start$__VECTORS
  ldr   r3, =segment$end$__DATA
  subs  r2, r3, r2 // size = segment$end$__DATA - segment$start$__TEXT

  // memcpy (r0: dst = 0x20010000, r1: src = 0x08000000, r2: size = ...)
  // Relocate ourselves: copy the entire image (VECTORS, TEXT, DATA segments)
  // from flash memory (non-writable) to RAM (writable), so that globals can be
  // written to.
  bl    _memcpy

  // Cannot jump to main normally, because that would call main using a relative
  // offset, which would result in a call to the pre-relocation address.
  // Loading address of main into a register will give us the post-relocation
  // address.
  ldr   r0, =_main
  blx   r0

  // Loop forever if main returns.
  b     .
