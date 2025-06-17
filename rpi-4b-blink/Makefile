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
TOOLSET          := $(TOOLSROOT)/Toolsets/rpi-5-elf.json
LLVM_OBJCOPY     := llvm-objcopy
SWIFT_BUILD      := swift build

# Flags
ARCH             := aarch64
TARGET           := $(ARCH)-none-none-elf
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
		--verbose

	@echo "extracting binary..."
	$(LLVM_OBJCOPY) \
		-O binary \
		"$(BUILDROOT)/Application" \
		"$(BUILDROOT)/Application.bin" \


.PHONY: clean
clean:
	@echo "cleaning..."
	@swift package clean
	@rm -rf .build
