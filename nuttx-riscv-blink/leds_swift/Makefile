############################################################################
# apps/examples/leds_swift/Makefile
#
# Copyright (c) 2024 Apple Inc. and the Swift project authors.
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.  The
# ASF licenses this file to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance with the
# License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
# License for the specific language governing permissions and limitations
# under the License.
#
############################################################################

include $(APPDIR)/Make.defs

# Blink in Swift Embedded Example

MAINSRC = $(wildcard *.swift) $(wildcard *.h)

# leds_swift built-in application info

SWIFTFLAGS += -import-bridging-header BridgingHeader.h -I$(TOPDIR)/include
SWIFTFLAGS += -Xfrontend -function-sections -Xfrontend -disable-stack-protector
SWIFTFLAGS += -Xfrontend -enable-single-module-llvm-emission
PROGNAME  = $(CONFIG_EXAMPLES_LEDS_SWIFT_PROGNAME)
PRIORITY  = $(CONFIG_EXAMPLES_LEDS_SWIFT_PRIORITY)
STACKSIZE = $(CONFIG_EXAMPLES_LEDS_SWIFT_STACKSIZE)
MODULE    = $(CONFIG_EXAMPLES_LEDS_SWIFT)

include $(APPDIR)/Application.mk
