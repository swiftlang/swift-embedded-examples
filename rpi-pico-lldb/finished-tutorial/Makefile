##===----------------------------------------------------------------------===##
##
## This source file is part of the Swift open source project
##
## Copyright (c) 2024 Apple Inc. and the Swift project authors.
## Licensed under Apache License v2.0 with Runtime Library Exception
##
## See https://swift.org/LICENSE.txt for license information
##
##===----------------------------------------------------------------------===##

# Determine file paths
REPOROOT         := $(shell git rev-parse --show-toplevel)
TOOLSROOT        := $(REPOROOT)/Tools
MACHO2UF2        := $(TOOLSROOT)/macho2uf2.py
MACHO2ELF        := $(TOOLSROOT)/macho2elf.py
SWIFT_BUILD      := swift build
BUILD_SYSTEM     := native

# Board-specific configuration
ifndef BOARD
  $(error BOARD is required. Use: make BOARD=RP2040 or make BOARD=RP2350)
endif

BOARD_LC := $(shell echo $(BOARD) | tr A-Z a-z)

ifeq ($(BOARD_LC),rp2040)
  TOOLSET     := $(TOOLSROOT)/Toolsets/pico.json
  ARCH        := armv6m
  TRAIT       := RP2040
  PICO_FAMILY := rp2040
else ifeq ($(BOARD_LC),rp2350)
  TOOLSET     := $(TOOLSROOT)/Toolsets/pico2.json
  ARCH        := armv7em
  TRAIT       := RP2350
  PICO_FAMILY := rp2350
else
  $(error Unknown BOARD '$(BOARD)'. Use BOARD=RP2040 or BOARD=RP2350)
endif

# Setup tools and build flags
TARGET           := $(ARCH)-apple-none-macho
SWIFT_BUILD_ARGS := \
	--build-system $(BUILD_SYSTEM) \
	--configuration debug \
	--triple $(TARGET) \
	--toolset $(TOOLSET) \
	--traits $(TRAIT)
BUILDROOT        := $(shell $(SWIFT_BUILD) $(SWIFT_BUILD_ARGS) --show-bin-path)

.PHONY: build
build:
	@echo "building..."
	$(SWIFT_BUILD) \
		$(SWIFT_BUILD_ARGS) \
		-Xlinker -map -Xlinker $(BUILDROOT)/Application.mangled.map \
		--verbose

	@echo "demangling linker map..."
	cat $(BUILDROOT)/Application.mangled.map \
		| c++filt | swift demangle > $(BUILDROOT)/Application.map

	@echo "disassembling..."
	otool \
		-arch $(ARCH) -v -V -d -t \
		$(BUILDROOT)/Application \
		| c++filt | swift demangle > $(BUILDROOT)/Application.disassembly

	@echo "extracting binary..."
	$(MACHO2UF2) \
		$(BUILDROOT)/Application \
		$(BUILDROOT)/Application.uf2 \
		--pico-family $(PICO_FAMILY) \
		--base-address 0x20000000 \
		--segments '__TEXT,__DATA,__VECTORS,__RESET'
	
	

.PHONY: clean
clean:
	@echo "cleaning..."
	@swift package clean
	@rm -rf .build
