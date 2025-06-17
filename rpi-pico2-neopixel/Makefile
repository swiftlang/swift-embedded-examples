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
TOOLSET          := $(TOOLSROOT)/Toolsets/pico2.json
MACHO2UF2        := $(TOOLSROOT)/macho2uf2.py
SWIFT_BUILD      := swift build

# Setup tools and build flags
ARCH             := armv7em
TARGET           := $(ARCH)-apple-none-macho
SWIFT_BUILD_ARGS := \
	--configuration release \
	--triple $(TARGET) \
	--toolset $(TOOLSET) \
	--disable-local-rpath
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
		--pico-family rp2350 \
		--base-address 0x20000000 \
		--segments '__TEXT,__DATA,__VECTORS,__RESET'

.PHONY: clean
clean:
	@echo "cleaning..."
	@swift package clean
	@rm -rf .build
