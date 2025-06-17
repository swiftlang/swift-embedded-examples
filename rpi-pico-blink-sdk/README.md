# rpi-pico-blink-sdk

This example demonstrates how to integrate with the Pico SDK which is using CMake as its build system -- the simplest way to integrate with it is to also use CMake to build a Swift firmware application on top of the SDK and the libraries from it.

<img src="https://github.com/swiftlang/swift-embedded-examples/assets/1186214/f2c45c18-f9a4-48b4-a941-1298ecc942cb">

## Requirements

- A Raspberry Pi Pico (non-W) board. If you have a Pico W instead, refer to the [rpi-picow-blink-sdk](../rpi-picow-blink-sdk) sample instead.
- Follow the setup steps at https://datasheets.raspberrypi.com/pico/getting-started-with-pico.pdf, in particular you'll need:
  - A checkout of the [pico-sdk](https://github.com/raspberrypi/pico-sdk.git), with git submodules checked out. If you'd like to try RISC-V support for RP2350, you'll need Pico SDK 2.1.0 or later.
  - A checkout of the [pico-examples](https://github.com/raspberrypi/pico-examples.git).
  - CMake.
  - The [Arm Embedded Toolchain](https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads), or the RISC-V toolchain if you want to build for the RISC-V cores on the RP2350.
- Before trying to use Swift with the Pico SDK, make sure your environment works and can build the provided C/C++ sample projects, in particular:
  - Try building and running the "blink" example from pico-examples written in C.


## Building

- Make sure you have a recent nightly Swift toolchain that has Embedded Swift support.
- Build and copy the program in the UF2 format to the Mass Storage device to trigger flashing the program into memory (after which the device will reboot and run the firmware):

``` console
$ cd rpi-pico-blink-sdk
$ export PICO_BOARD='<board-name>' # Examples: pico, pico2
$ export PICO_PLATFORM='<optional-platform-name>' # Optional; useful if you'd like to compile for RISC-V. Examples: rp2040, rp2350-arm-s, rp2350-riscv 
$ export PICO_SDK_PATH='<path-to-your-pico-sdk>'
$ export PICO_TOOLCHAIN_PATH='<path-to-the-compiler-toolchain>' # A default `brew` install will be located at `/Applications/ArmGNUToolchain/[version]/arm-none-eabi`. This can also be a RISC-V toolchain for the RP2350.
$ cmake -B build -G Ninja . -DCMAKE_EXPORT_COMPILE_COMMANDS=On
$ cmake --build build
```

## Running

- Connect the Pico board via a USB cable to your Mac, and make sure it's in the USB Mass Storage firmware upload mode (either hold the BOOTSEL button while plugging the board, or make sure your Flash memory doesn't contain any valid firmware).
- Copy the UF2 firmware to the Mass Storage device:

```console
$ cp build/swift-blinky.uf2 /Volumes/RP2040
```

- The green LED should now be blinking in a pattern.
