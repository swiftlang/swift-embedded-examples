#!/bin/bash

set -vex

# Determine file paths
REPOROOT=$(git rev-parse --show-toplevel)
TOOLSROOT="$REPOROOT/Tools"
SRCROOT="$REPOROOT/stm32-blink"
BUILDROOT="$SRCROOT/.build"

# Clean the build directory
rm -r "$BUILDROOT" || true

# Setup tools and build flags
TARGET=armv7em-apple-none-macho

if [[ ! "$STM_BOARD" ]] ; then
	echo "STM_BOARD must be set to STM32F746G_DISCOVERY or NUCLEO_F103RB"
	exit 1
fi

SWIFT_EXEC=${SWIFT_EXEC:-$(xcrun -f swiftc)}
SWIFT_FLAGS="-target $TARGET -Osize"
SWIFT_FLAGS+=" -import-bridging-header $SRCROOT/BridgingHeader.h -wmo -enable-experimental-feature Embedded"
SWIFT_FLAGS+=" -Xcc -ffreestanding"
SWIFT_FLAGS+=" -D${STM_BOARD}"

CLANG_EXEC=${CLANG_EXEC:-$(xcrun -f clang)}
CLANG_FLAGS="-target $TARGET -Oz"

LD_EXEC=${LD_EXEC:-$CLANG_EXEC}
LD_FLAGS="-target $TARGET -nostdlib -static -Wl,-e,_reset -dead_strip -Wl,-no_zero_fill_sections -Wl,-segalign,4 -Wl,-segaddr,__VECTORS,0x08000000 -Wl,-seg1addr,0x08000200 -Wl,-pagezero_size,0"

PYTHON_EXEC=${PYTHON_EXEC:-$(xcrun -f python3)}
MACHO2BIN="$TOOLSROOT/macho2bin.py"

# Create build directory
mkdir -p "$BUILDROOT"

# Build Swift sources
# shellcheck disable=SC2086 # intentional splitting
"$SWIFT_EXEC" $SWIFT_FLAGS -c "$SRCROOT/"*.swift -o "$BUILDROOT/blink.o"

# Build C sources
# shellcheck disable=SC2086 # intentional splitting
"$CLANG_EXEC" $CLANG_FLAGS -c "$SRCROOT/Startup.c" -o "$BUILDROOT/Startup.o"

# Link objects into executable
# shellcheck disable=SC2086 # intentional splitting
"$LD_EXEC" $LD_FLAGS "$BUILDROOT/blink.o" "$BUILDROOT/Startup.o" -o "$BUILDROOT/blink"

# Extract sections from executable into flashable binary
"$PYTHON_EXEC" "$MACHO2BIN" "$BUILDROOT/blink" "$BUILDROOT/blink.bin" --base-address 0x08000000 --segments '__TEXT,__DATA,__VECTORS'

# Echo final binary path
ls -al "$BUILDROOT/blink.bin"
