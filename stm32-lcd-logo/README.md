# stm32-lcd-logo

<img src="https://github.com/swiftlang/swift-embedded-examples/assets/1186214/9e117d81-e808-493e-a20c-7284ea630f37">

## How to build and run this example:

- Connect the STM32F746G-DISCO board via the ST-LINK USB port to your Mac.
- Make sure you have a recent nightly Swift toolchain that has Embedded Swift support.
- Install the `stlink` (https://github.com/stlink-org/stlink) command line tools, e.g. via `brew install stlink`.
- Build and upload the program to flash memory of the STM:
```console
$ cd stm32-lcd-logo
$ make
$ st-flash --reset write .build/lcd-logo.bin 0x08000000
```
- The LCD display on the board should now be showing a bouncing animating Swift logo on a fading background, and the user LED on should be blinking.

Resulting size of the compiled and linked binary follows (3.5 kB of code + 10 kB of pixel data):
```console
$ size -m .build/lcd-logo
Segment __TEXT: 14376
  Section __text: 3604
  Section __const: 10000
  total 13604
Segment __DATA: 8
  Section __nl_symbol_ptr: 4
  Section __data: 4
  total 8
Segment __VECTORS: 456
  Section __text: 456
  total 456
Segment __LINKEDIT: 1056
total 15896
```
