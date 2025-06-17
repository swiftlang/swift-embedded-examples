##===----------------------------------------------------------------------===##
##
## This source file is part of the Swift open source project
##
## Copyright (c) 2025 Apple Inc. and the Swift project authors.
## Licensed under Apache License v2.0 with Runtime Library Exception
##
## See https://swift.org/LICENSE.txt for license information
##
##===----------------------------------------------------------------------===##

# Paths
REPOROOT         := $(shell git rev-parse --show-toplevel)
TOOLSROOT        := $(REPOROOT)/Tools
TOOLSET          := $(PWD)/toolset.json
ELF2HEX          := $(TOOLSROOT)/elf2hex.py
SWIFT_BUILD      := swift build
NM               := nm
LLVM_TOOLCHAIN   := $(PWD)/llvm-toolchain

# Flags
ARCH             := armv7em
TARGET           := $(ARCH)-none-none-eabi
SWIFT_BUILD_ARGS := \
	--configuration release \
	--triple $(TARGET) \
	--toolset $(TOOLSET) \
	--product Application
BUILDROOT        := $(shell $(SWIFT_BUILD) $(SWIFT_BUILD_ARGS) --show-bin-path)

.PHONY: build
build:
	@echo "checking dependencies..."

	if [[ ! -d $(PWD)/lvgl ]]; then echo "\n  *** LVGL checkout not found, please run ./fetch-dependencies.sh\n" ; exit 1 ; fi
	if [[ ! -d $(PWD)/llvm-toolchain ]]; then echo "\n  *** LLVM toolchain checkout not found, please run ./fetch-dependencies.sh\n" ; exit 1 ; fi

	mkdir -p .build

	@echo "configuring LVGL..."
	cmake -B .build/lvgl -G Ninja ./lvgl \
        -DCMAKE_EXPORT_COMPILE_COMMANDS=On \
        -DTOOLCHAIN_PATH=$(LLVM_TOOLCHAIN) \
        -DCMAKE_TOOLCHAIN_FILE=../clang-arm-toolchain.cmake \
        -DLV_CONF_PATH=../Sources/CLVGL/include/lv_conf.h

	@echo "building LVGL..."
	cmake --build .build/lvgl
	
	@echo "building..."
	$(SWIFT_BUILD) \
		$(SWIFT_BUILD_ARGS) \
		--verbose

	@echo "disassembling..."
	$(LLVM_TOOLCHAIN)/bin/llvm-objdump --all-headers --disassemble --mcpu=cortex-m7 \
		$(BUILDROOT)/Application \
		| c++filt | swift demangle > $(BUILDROOT)/Application.disassembly

	@echo "extracting binary..."
	$(ELF2HEX) \
		$(BUILDROOT)/Application $(BUILDROOT)/Application.hex --relocate
	ls -al $(BUILDROOT)/Application.hex
	@echo "\n   *** All done, build succeeded!\n"

flash:
	@echo "flashing..."
	st-flash --reset --format ihex write $(BUILDROOT)/Application.hex
	
simulator:
	mkdir -p .build

	@echo "configuring LVGL..."
	cmake -B .build/lvgl-host -G Ninja ./lvgl \
        -DCMAKE_EXPORT_COMPILE_COMMANDS=On \
        -DLV_CONF_PATH=../Sources/CLVGL/include/lv_conf.h

	@echo "building LVGL..."
	cmake --build .build/lvgl-host
	
	@echo "building..."
	$(SWIFT_BUILD) \
	    --configuration release \
		--product HostSDLApp \
		--verbose
	
	@echo "running..."
	$(PWD)/.build/release/HostSDLApp

.PHONY: clean
clean:
	@echo "cleaning..."
	@swift package clean
	@rm -rf .build
