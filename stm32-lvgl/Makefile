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
TOOLSET          := $(CURDIR)/toolset.json
ELF2HEX          := $(TOOLSROOT)/elf2hex.py
SWIFT_BUILD      := swift build
BUILD_SYSTEM     := native
NM               := nm
LLVM_TOOLCHAIN   := $(CURDIR)/llvm-toolchain
BUILD_SYSTEM     := native

# The swiftbuild backend runs compile tasks from outside the package directory, so the relative
# include path in toolset.json must be absolute. Generate a patched copy for that backend; the
# native build keeps using toolset.json as is.
ifeq ($(BUILD_SYSTEM),swiftbuild)
ifeq ($(origin TOOLSET),file)
TOOLSET_SRC      := $(TOOLSET)
TOOLSET          := $(CURDIR)/.build/toolset.swiftbuild.json
$(shell mkdir -p $(CURDIR)/.build && sed -e 's|"-Illvm-toolchain|"-I$(CURDIR)/llvm-toolchain|' $(TOOLSET_SRC) > $(TOOLSET))
endif
endif

# Flags
ARCH             := armv7em
TARGET           := $(ARCH)-none-none-eabi
SWIFT_BUILD_ARGS := \
	--build-system $(BUILD_SYSTEM) \
	--configuration release \
	--triple $(TARGET) \
	--toolset $(TOOLSET) \
	--product Application
BUILDROOT        := $(shell $(SWIFT_BUILD) $(SWIFT_BUILD_ARGS) --show-bin-path)

.PHONY: build
build:
	@echo "checking dependencies..."

	if [[ ! -d $(CURDIR)/lvgl ]]; then echo "\n  *** LVGL checkout not found, please run ./fetch-dependencies.sh\n" ; exit 1 ; fi
	if [[ ! -d $(CURDIR)/llvm-toolchain ]]; then echo "\n  *** LLVM toolchain checkout not found, please run ./fetch-dependencies.sh\n" ; exit 1 ; fi

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
	    --build-system $(BUILD_SYSTEM) \
	    --configuration release \
		--product HostSDLApp \
		--verbose

	@echo "running..."
	$(CURDIR)/.build/release/HostSDLApp

.PHONY: clean
clean:
	@echo "cleaning..."
	@swift package clean
	@rm -rf .build
