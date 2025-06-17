# rpi-pico-blink

<img src="https://github.com/swiftlang/swift-embedded-examples/assets/1186214/f2c45c18-f9a4-48b4-a941-1298ecc942cb">

## Requirements

- A Raspberry Pi Pico (non-W) board. If you have a Pico W instead, this sample code will require modifications.

## How to build and run this example:

- Connect the Pico board via a USB cable to your Mac, and make sure it's in the USB Mass Storage firmware upload mode (either hold the BOOTSEL button while plugging the board, or make sure your Flash memory doesn't contain any valid firmware).
- Make sure you have a recent nightly Swift toolchain that has Embedded Swift support.
- Build and copy the program in the UF2 format to the Mass Storage device to trigger flashing the program into memory (after which the device will reboot and run the firmware):

``` console
$ cd rpi-pico-blink
$ make
$ cp .build/Application.uf2 /Volumes/RP2040
```

- The green LED should now be blinking in a pattern.
