# Raspberry Pi Pico Blink (Pico SDK)

Tutorial for targetting a Raspberry Pi Pico as an embedded device that runs a simple Swift program

In this guide we'll be targeting a Raspberry Pi Pico as the embedded device that our Swift application will run on. If you don't physically have one, don't worry! You can still run the application in an online emulator.

## Installing Swift

> Note: Embedded Swift is experimental. Public releases of Swift do not support Embedded Swift, yet. See <doc:InstallEmbeddedSwift> for details.

To install Swift for embedded development, follow the instructions in <doc:InstallEmbeddedSwift>, which guides you through using `swiftly` to install the latest development snapshot with Embedded Swift support.

To test that you have Swift installed, run `swift --version` from your shell or terminal app. It should say "6.2-dev" or similar, confirming you have a "Development Snapshot" toolchain.

## Installing dependencies for embedded development

Install the Raspberry Pi Pico SDK, and the Arm Embedded Toolchain by following the [Getting Started With Pico guide](https://datasheets.raspberrypi.com/pico/getting-started-with-pico.pdf).
Export three environment variables to match your setup and hardware:

```shell
$ export PICO_BOARD=pico
$ export PICO_SDK_PATH=...       # location to your Pico SDK
$ export PICO_TOOLCHAIN_PATH=... # location to the Arm Embedded Toolchain
```

If you have the Wi-Fi enabled Pico W board instead of the regular Pico, note that you will need a slightly different setup described in the [Pico W example project](https://github.com/swiftlang/swift-embedded-examples/tree/main/rpi-picow-blink-sdk), and just specifying `PICO_BOARD=pico_w` is not going to work.

Install [CMake 3.29](https://cmake.org/) or newer.

To test that you have all the necessary parts installed, you can run the following commands in a terminal:

```shell
$ swift --version
Apple Swift version 6.2-dev (LLVM 81ab6d9f7e4810f, Swift 9cc1947527bacea)
$ cmake --version
cmake version 3.29.2
$ echo $PICO_BOARD
pico
$ ls $PICO_SDK_PATH
CMakeLists.txt          README.md               external/               pico_sdk_version.cmake  tools/
CONTRIBUTING.md         cmake/                  lib/                    src/
LICENSE.TXT             docs/                   pico_sdk_init.cmake     test/
$ ls $PICO_TOOLCHAIN_PATH
13.2.Rel1-darwin-arm64-arm-none-eabi-manifest.txt  include/                                           share/
arm-none-eabi/                                     lib/
bin/                                               libexec/
```

## Building a "blinky" embedded app

The standard "Hello, World" in embedded development is a program that repeatedly blinks an LED. Let's build one. The following setup can be also found in [swift-embedded-examples](https://github.com/swiftlang/swift-embedded-examples/blob/main/rpi-pico-blink-sdk/README.md), but we're going to show below that all you need is just three files.
Let's create a new empty directory and prepare a simple structure for a CMake-based project that can be used on top of the Pico SDK:

```
embedded-swift-tutorial
├── BridgingHeader.h
├── CMakeLists.txt
└── Main.swift
```

The Main.swift and BridgingHeader.h files can initially have the following basic content:

```swift
// Main.swift
let led = UInt32(PICO_DEFAULT_LED_PIN)
gpio_init(led)
gpio_set_dir(led, /*out*/true)
while true {
  gpio_put(led, true)
  sleep_ms(250)
  gpio_put(led, false)
  sleep_ms(250)
}
```

```c
// BridgingHeader.h
#include "pico/stdlib.h"
```

To build on top of the Pico SDK's CMake support, we need a bit more CMake logic in the CMakeLists.txt file:

```cmake
# CMakeLists.txt
cmake_minimum_required(VERSION 3.29)
include($ENV{PICO_SDK_PATH}/external/pico_sdk_import.cmake)

set(CMAKE_Swift_COMPILATION_MODE wholemodule)
set(CMAKE_Swift_COMPILER_WORKS YES)

project(blinky)
pico_sdk_init()
enable_language(Swift)

add_executable(blinky Main.swift)
set_target_properties(blinky PROPERTIES LINKER_LANGUAGE CXX)

# Clear the default COMPILE_OPTIONS which include C specific compiler flags that the Swift compiler will not accept
# Instead, set those options to only apply when compiling C code.
set_target_properties(pico_standard_link PROPERTIES INTERFACE_COMPILE_OPTIONS "")
target_compile_options(pico_standard_link INTERFACE "$<$<COMPILE_LANGUAGE:C>:SHELL: -ffunction-sections -fdata-sections>")

set(SWIFT_INCLUDES)
foreach(dir ${CMAKE_C_IMPLICIT_INCLUDE_DIRECTORIES})
    string(CONCAT SWIFT_INCLUDES ${SWIFT_INCLUDES} "-Xcc ")
    string(CONCAT SWIFT_INCLUDES ${SWIFT_INCLUDES} "-I${dir} ")
endforeach()

target_compile_options(blinky PUBLIC "$<$<COMPILE_LANGUAGE:Swift>:SHELL:
        -enable-experimental-feature Embedded
        -target armv6m-none-none-eabi -Xcc -mfloat-abi=soft -Xcc -fshort-enums -Xfrontend -function-sections
        -import-bridging-header ${CMAKE_CURRENT_LIST_DIR}/BridgingHeader.h
        ${SWIFT_INCLUDES}
    >")

target_link_libraries(blinky pico_stdlib hardware_uart hardware_gpio)
pico_add_extra_outputs(blinky)
```

Now we're ready to configure and build this firmware for the Pico. Run the following commands:

```shell
$ cmake -B build -G Ninja .    # configure step
$ cmake --build build          # build step
```

The build should succeed and produce the firmware in several formats (ELF, HEX, UF2), including some information dump files (DIS, ELF.MAP):

```shell
$ ls -al build/blinky*
-rwxr-xr-x  1 kuba  staff   8.0K Jan  1 12:00 build/blinky.bin*
-rw-r--r--  1 kuba  staff   145K Jan  1 12:00 build/blinky.dis
-rwxr-xr-x  1 kuba  staff    30K Jan  1 12:00 build/blinky.elf*
-rw-r--r--  1 kuba  staff   222K Jan  1 12:00 build/blinky.elf.map
-rw-r--r--  1 kuba  staff    23K Jan  1 12:00 build/blinky.hex
-rw-r--r--  1 kuba  staff    16K Jan  1 12:00 build/blinky.uf2
```

## Running the firmware on a device

If you have a Raspberry Pi Pico, we're now going to upload the built firmware and run it. If you don't have one, skip to the next section and run the exact same firmware file **in an emulator instead**.

Connect the Raspberry Pi Pico board via a USB cable to your Mac, and make sure it's in the USB Mass Storage firmware upload mode. This is normally the case if you have never uploaded any firmware yet – the Pico boots to the firmware upload mode if its memory doesn't contain any valid firmware. Once a valid firmware is uploaded, the device will run that firmware after plugging in. To go back to the firmware upload mode, *hold the BOOTSEL button while plugging in the board*.

The Pico should then show up as a mounted volume in /Volumes (as RPI-RP2 in this case):

```shell
$ ls -al /Volumes
lrwxr-xr-x   1 root  wheel     1B Jan  1 12:00 Macintosh HD@ -> /
drwx------   1 kuba  staff    16K Dec 31  1969 RPI-RP2/
```

Copy the UF2 file to this volume:

```shell
$ cp build/blinky.uf2 /Volumes/RPI-RP2
```

This will make the Pico automatically install the firmware, reboot itself, and run the firmware.

The green LED should now be blinking repeatedly. Hooray! Our first Embedded Swift program is running on an embedded device!

## Running the firmware in an emulator

If you don't have a physical Pico, or if you want to iterate quickly, [Wokwi](https://wokwi.com/) is free online emulator of various embedded microcontrollers, including a Raspberry Pi Pico. It executes the same firmware binary that you would normally upload to a physical device, and emulates one instruction at a time.

Open a [new Pico project in Wokwi](https://wokwi.com/projects/new/pi-pico). Instead of using the code editor to write C code, press F1 and choose "Upload Firmware and Start Simulation". Then select the UF2 file that our build process produced.

Once you upload the UF2 file to Wokwi, the simulation will start, and the LED should begin blinking repeatedly. Hooray! Our first Embedded Swift program is running in an emulator!
