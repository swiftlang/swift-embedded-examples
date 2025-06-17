/*===----------------------------------------------------------------------===*/
/*                                                                            */
/* This source file is part of the Swift open source project                  */
/*                                                                            */
/* Copyright (c) 2025 Apple Inc. and the Swift project authors.               */
/* Licensed under Apache License v2.0 with Runtime Library Exception          */
/*                                                                            */
/* See https://swift.org/LICENSE.txt for license information                  */
/*                                                                            */
/*===----------------------------------------------------------------------===*/

/*
 * This application uses ELF for linking, and uses the elf2hex.py post-processing tool for package the result into a
 * form suitable for flashing. The entire memory layout scheme (which this linker script participates in) is:
 *
 * - At normal application runtime, the expected memory layout is:
 *
 *     - 0x08000000-0x08100000 (flash) ... code + read-only globals
 *     - 0x20000000-0x20008000 (SRAM) ... stack
 *     - 0x20008000-0x20030000 (SRAM) ... read-write globals, and bss (zero initialized globals)
 *     - 0x20030000-0x20050000 (SRAM) ... heap
 *
 * - However, this layout cannot be flashed as is (because it uses the SRAM too), so a few more steps are needed.
 *
 * - In a linked ELF file, the memory locations of the sections match the expected runtime layout. The ELF file does not
 *   contain the stack and the heap, so we don't have to worry about those (there is also no expectation that the memory
 *   for those is zeroed out at program start).
 *
 * - The ELF file is given to the elf2hex.py tool, which will produce a .hex output, and we use the
 *   --relocate-data-segment flag to relocate the read-write globals region (0x20008000-0x20030000) into the flash
 *   region, concretely the region is appended at a 4-byte-aligned location after the other contents of the flash.
 *
 *     - This is concretely achieved using the __flash_data_start+__flash_data_len and __data_start+__data_end symbols
 *       defined in this linker script. The elf2hex.py script finds the addresses of these symbols and performs the
 *       relocation of those bytes.
 *     - Note that after the relocation, the segments in ELF headers (PT_LOAD commands) don't match the actual physical
 *       layout. However, this relocation is reversed at early startup time, so that at "normal" runtime, the layout is
 *       as expected. See below.
 *
 * - The ARM core loads the initial stack pointer, and initial program counter from the vector table which is placed at
 *   a well-known location, concretely the very beginning of flash, 0x08000000. The linker script places the .vectors
 *   section as the very first section into the flash to satisfy this. See Startup.c for the concrete content of the
 *   vector table, and how the initial SP and PC are set up.
 *
 * - The initial startup code (ResetISR in Startup.c) only does one setup step (enabling the FPU) before performing the
 *   reverse relocation of the data segment. The runtime back-relocation is simply a memcpy from __flash_data_start back
 *   into __data_start (in the SRAM region).
 *
 *     - During this and before this (e.g. when doing the FPU enablement), read-write globals cannot be used. Reading
 *       a read-write global won't read the correct initial value of that global.
 *     - That's why the ResetISR code is written as attribute((naked)) asm implementation. The implementation is also
 *       very simple and it's easy to see that it indeed does not touch any globals.
 *     - We expect that the implementation of memcpy is also not accessing any globals. This is a reasonable expectation
 *       on any embedded-friendly memcpy implementation.
 *
 * - After that, the normal runtime memory layout is matched, and the application continues to initialize itself and
 *   run.
 */

MEMORY
{
   flash (rx)      : ORIGIN = 0x08000000, LENGTH = 1024K  /* end: 0x08100000 */
   sram_stack (rw) : ORIGIN = 0x20000000, LENGTH = 32K    /* end: 0x20008000 */
   sram_data (rw)  : ORIGIN = 0x20008000, LENGTH = 160K   /* end: 0x20030000 */
   sram_heap (rw)  : ORIGIN = 0x20030000, LENGTH = 128K   /* end: 0x20050000 */
}

SECTIONS
{
  .text     : { *(.vectors*) ; *(.text*) } > flash
  .rodata   : { *(.rodata*) ; *(.got*) } > flash
   
  __flash_data_start = (. + 3) & ~ 3; /* 4-byte aligned end of text is where data is going to be placed (by elf2hex) */ 

  .bss      : { *(.bss*) } > sram_data
  .tbss      : { *(.tbss*) } > sram_data
  .data     : { *(.data*) } > sram_data
   
  __flash_data_len   = . - ORIGIN(sram_data);
  
  /* TODO: Add a safeguard to detect when adding data to flash would overflow the flash memory */
  
  /DISCARD/ : { *(.swift_modhash*) }
  
  /* ARM metadata sections */
  /DISCARD/ : { *(.ARM.attributes*) *(.ARM.exidx) }
  
  /* ELF metadata sections */
  .symtab   : { *(.symtab) }
  .strtab   : { *(.strtab) }
  .shstrtab : { *(.shstrtab) }
  .debug    : { *(.debug*) }
  .comment  : { *(.comment) }
}

__stack_start      = ORIGIN(sram_stack);
__stack_end        = ORIGIN(sram_stack) + LENGTH(sram_stack);

__data_start      = ORIGIN(sram_data);
__data_end        = ORIGIN(sram_data) + LENGTH(sram_data);

__heap_start      = ORIGIN(sram_heap);
__heap_end        = ORIGIN(sram_heap) + LENGTH(sram_heap);
