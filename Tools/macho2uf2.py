#! /usr/bin/env -S uv run --script

# /// script
# dependencies = [
#   "macholib==1.16.3",
# ]
# ///

# This source file is part of the Swift open source project
#
# Copyright (c) 2023 Apple Inc. and the Swift project authors.
# Licensed under Apache License v2.0 with Runtime Library Exception
#
# See https://swift.org/LICENSE.txt for license information

#
# macho2uf2 -- Converts a statically-linked executable Mach-O into a flat "UF2" file
# suitable for flashing as a single contiguous blob onto some embedded devices, in
# particular Raspberry Pi Pico (W). Note that the UF2 format allows for discontiguous
# memory regions, but this utility does not support that.
#
# Usage:
#   $ macho2uf2.py <input> <output> --base-address <base-address> --segments
#       <segment-list>
#
# Example:
#   $ macho2uf2.py ./blink ./blink.uf2 --base-address 0x00200000 --segments
#       '__TEXT,__DATA,__VECTORS'
#
# Flash images:
#   By default, the UF2 file targets --base-address directly. For an image linked
#   to run from SRAM, the bootrom loads it into RAM and runs it, and nothing is
#   written to flash. With --flash, the UF2 file instead stores the image in flash,
#   and the image is copied into SRAM at --base-address and run from there on every
#   boot:
#   * RP2040: a second stage bootloader at the start of flash, built from
#     rp2040-boot2-copy-to-ram.S, copies the image into SRAM and jumps to its
#     first address, as the bootrom does for an SRAM image loaded through UF2.
#   * RP2350: an IMAGE_DEF block at the start of flash, with a LOAD_MAP item,
#     tells the bootrom to copy the image into SRAM ("packaged binary"), and a
#     VECTOR_TABLE item points at the vector table at the start of the image.
#   In both cases the image itself is stored at 0x10000100.
#
# Requirements and notes:
#   * The output UF2 file is a flat contiguous representation of the segments
#     (--segments) based on their VM addresses.
#   * The UF2 file's first byte corresponds to the specified base address
#     (--base-address).
#   * Any gaps between segments are filled with zero bytes.
#   * Because of that, you want the input Mach-O to have all segments "close", and not
#     have gaps.
#

import argparse
import os
import struct
import subprocess
import tempfile

from macholib import MachO
from macholib import mach_o

MY_DIR = os.path.dirname(os.path.abspath(__file__))

SRAM_BASE = 0x20000000
FLASH_BASE = 0x10000000
# The loader (RP2040 boot2, or RP2350 IMAGE_DEF block) is stored in the first
# 256 bytes of flash, and the image right after it.
FLASH_HEADER_SIZE = 0x100

# The RP2040 bootrom loads boot2 here (RP2040 datasheet, section 2.8.1).
RP2040_BOOT2_ADDRESS = 0x20041F00
RP2040_BOOT2_SOURCE = os.path.join(MY_DIR, "rp2040-boot2-copy-to-ram.S")
RP2040_BOOT2_PARAMETERS_OFFSET = 240
RP2350_SRAM_END = 0x20082000


def rp2040_boot2_crc32(data):
    # CRC-32/MPEG-2: polynomial 0x04c11db7, no reflection, initial value
    # 0xffffffff, no final XOR (RP2040 datasheet, section 2.8.1.3.1).
    crc = 0xFFFFFFFF
    for byte in data:
        crc ^= byte << 24
        for _ in range(8):
            if crc & 0x80000000:
                crc = ((crc << 1) ^ 0x04C11DB7) & 0xFFFFFFFF
            else:
                crc = (crc << 1) & 0xFFFFFFFF
    return crc


def rp2040_boot2(source_address, load_address, load_size):
    with tempfile.TemporaryDirectory() as tmpdir:
        obj = os.path.join(tmpdir, "boot2.o")
        subprocess.check_call(
            ["clang", "-arch", "armv6m", "-c", RP2040_BOOT2_SOURCE, "-o", obj]
        )
        macho = MachO.MachO(obj)
        assert len(macho.headers) == 1
        mh = macho.headers[0]
        text = None
        for command in mh.commands:
            if isinstance(command[1], mach_o.segment_command):
                for section in command[2]:
                    if section.sectname.decode().strip("\0") == "__text":
                        text = section
        assert text is not None, "boot2 has no __text section"
        assert text.nreloc == 0, "boot2 must not have relocations"
        assert text.size == 252, f"boot2 is {text.size} bytes, expected 252"
        with open(obj, "rb") as f:
            f.seek(mh.offset + text.offset)
            code = bytearray(f.read(text.size))

    offset = RP2040_BOOT2_PARAMETERS_OFFSET
    code[offset:offset + 12] = struct.pack(
        "<III", source_address, load_address, load_size
    )
    return bytes(code) + struct.pack("<I", rp2040_boot2_crc32(code))


def rp2350_image_def(source_address, load_address, load_size):
    # A single-block loop with an IMAGE_DEF (RP2350 datasheet, section 5.9).
    words = [
        0xFFFFDED3,  # PICOBIN_BLOCK_MARKER_START
        # IMAGE_TYPE item: EXE, Secure, Arm, RP2350.
        0x10210142,
        # VECTOR_TABLE item: the vector table is at the start of the image, the
        # same place the bootrom looks for it when the image is loaded through
        # UF2 into SRAM.
        0x00000203,
        load_address,
        # LOAD_MAP item with one absolute entry: copy the image from flash into
        # SRAM before running it.
        0x81000406,
        source_address,
        load_address,
        load_address + load_size,  # runtime end address
        0x000007FF,  # LAST item, 7 words of items before it
        0x00000000,  # link to self: this is the only block in the loop
        0xAB123579,  # PICOBIN_BLOCK_MARKER_END
    ]
    return struct.pack(f"<{len(words)}I", *words)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("input")
    parser.add_argument("output")
    parser.add_argument("--base-address", required=True)
    parser.add_argument("--segments", required=True)
    parser.add_argument("--pico-family", required=True)
    parser.add_argument(
        "--flash",
        action="store_true",
        help="store the image in flash, and copy it into SRAM at --base-address"
        " on every boot",
    )
    args = parser.parse_args()
    args.base_address = int(args.base_address, 16)
    args.segments = args.segments.split(",")
    if args.pico_family == "rp2040":
        family_id = 0xE48BFF56
        add_errata_block = False
    elif args.pico_family == "rp2350":
        family_id = 0xE48BFF59
        add_errata_block = True
    else:
        assert False

    subprocess.check_call(
        [
            MY_DIR + "/macho2bin.py",
            args.input,
            args.input + ".bin",
            "--base-address",
            "0x%08x" % args.base_address,
            "--segments",
            ",".join(args.segments),
        ]
    )

    def emit_block(output, block, vmaddr, block_number, num_blocks, family_id):
        assert len(block) <= 256

        if len(block) < 256:
            block += b"\0" * (256 - len(block))

        # UF2_Block header
        output += struct.pack("<I", 0x0A324655)  # magicStart0
        output += struct.pack("<I", 0x9E5D5157)  # magicStart1
        output += struct.pack("<I", 0x2000)  # flags: familyID present
        output += struct.pack("<I", vmaddr)  # targetAddr
        output += struct.pack("<I", 256)  # payloadSize
        output += struct.pack("<I", block_number)  # blockNo
        output += struct.pack("<I", num_blocks)  # numBlocks
        output += struct.pack(
            "<I", family_id
        )  # fileSize / familyID: rp2040/rp2350 family ID

        # Data
        if len(block) < 476:
            block += b"\0" * (476 - len(block))
        output += block

        # UF2_Block footer
        output += struct.pack("<I", 0x0AB16F30)  # magicEnd

        return output

    with open(args.input + ".bin", "rb") as f:
        payload = f.read()
    target_address = args.base_address

    if args.flash:
        assert SRAM_BASE <= args.base_address < SRAM_BASE + 0x10000000, (
            "--flash requires an image linked to run from SRAM, but the base"
            f" address is 0x{args.base_address:08x}"
        )
        # The loaders copy whole words.
        payload += b"\0" * (-len(payload) % 4)
        load_address = args.base_address
        load_size = len(payload)
        source_address = FLASH_BASE + FLASH_HEADER_SIZE
        if args.pico_family == "rp2040":
            assert load_address + load_size <= RP2040_BOOT2_ADDRESS, (
                f"the image (0x{load_address:08x}-0x{load_address + load_size:08x})"
                f" overlaps boot2 at 0x{RP2040_BOOT2_ADDRESS:08x}"
            )
            header = rp2040_boot2(source_address, load_address, load_size)
        else:
            assert load_address + load_size <= RP2350_SRAM_END, (
                f"the image (0x{load_address:08x}-0x{load_address + load_size:08x})"
                f" does not fit in SRAM"
            )
            header = rp2350_image_def(source_address, load_address, load_size)
        assert len(header) <= FLASH_HEADER_SIZE
        header += b"\0" * (FLASH_HEADER_SIZE - len(header))
        payload = header + payload
        target_address = FLASH_BASE

    output = b""
    if add_errata_block:
        # RP2350-E10 errata
        block = struct.pack("<I", 0xEFEFEFEF) * 64
        vmaddr = 0x10FFFF00
        output = emit_block(output, block, vmaddr, 0, 2, 0xE48BFF57)

    total_size = len(payload)
    num_blocks = (total_size + 255) // 256
    for block_number in range(num_blocks):
        block = payload[block_number * 256:(block_number + 1) * 256]
        vmaddr = target_address + block_number * 256
        output = emit_block(
            output, block, vmaddr, block_number, num_blocks, family_id
        )

    with open(args.output, "wb") as f:
        f.write(output)

    print(
        f"Produced {args.output} with total size {len(output)} (0x{len(output):0x})"
        f" bytes, payload size {total_size} (0x{total_size:0x}) bytes"
    )

    if args.flash:
        print(
            f"The image is stored in flash at 0x{FLASH_BASE + FLASH_HEADER_SIZE:08x}"
            f" and copied into SRAM at 0x{args.base_address:08x} on every boot."
        )
    elif SRAM_BASE <= args.base_address < SRAM_BASE + 0x10000000:
        # RP2040 and RP2350 map SRAM at 0x20000000. An image loaded there runs
        # from RAM and is not written to flash, so it is lost when the board
        # loses power.
        print(
            f"Note: the image targets SRAM (base address 0x{args.base_address:08x})."
            " It runs from RAM and is lost when the board loses power. Use --flash"
            " to store it in flash."
        )


if __name__ == "__main__":
    main()
