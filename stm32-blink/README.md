# stm32-blink

This example shows a simple baremetal firmware for an STM32 board that blinks an LED repeatedly. The example does not use any vendor SDKs or external toolchains, the entire firmware is only built from code in this example directory.

<img src="https://github.com/swiftlang/swift-embedded-examples/assets/1186214/739e98fd-a438-4a64-a7aa-9dddee25034b">

## Requirements

- Connect the STM32F746G-DISCO board via the ST-LINK USB port to your Mac.
- Download and install a [recent nightly Swift toolchain](https://swift.org/download). Use the "Development Snapshot" from "main".
- Install the [`stlink`](https://github.com/stlink-org/stlink) command line tools, e.g. via `brew install stlink`.

## Building and running the firmware as Mach-O on macOS

- Build and upload the program to flash memory of the microcontroller:
```console
$ cd stm32-blink
$ export STM_BOARD=STM32F746G_DISCOVERY   # or NUCLEO_F103RB
$ ./build-macho.sh
$ st-flash --reset write .build/blink.bin 0x08000000
```
- The green LED next to the RESET button should now be blinking in a pattern.

## Building and running the firmware as ELF (on either macOS or Linux)

- Build and upload the program to flash memory of the microcontroller:
```console
$ cd stm32-blink
$ export STM_BOARD=STM32F746G_DISCOVERY   # or NUCLEO_F103RB
$ ./build-elf.sh
$ st-flash --format ihex --reset write .build/blink.hex
```
- The green LED next to the RESET button should now be blinking in a pattern.

## Binary size

The resulting size of the compiled and linked binary is very small (which shouldn't be surprising given that this toy example only blinks an LED), and demonstrates how the Embedded Swift compilation mode doesn't include unnecessary code or data in the resulting program:

```console
$ size -m .build/blink
Segment __TEXT: 656
  Section __text: 142
  total 142
Segment __VECTORS: 456
  Section __text: 456
  total 456
Segment __LINKEDIT: 188
total 1300
```

The binary contains only 142 bytes of code! Additionally, the vector table needed by the CPU is actually dominating the size of the final firmware. Note that the `__LINKEDIT` segment is discarded when forming the final `.bin` file, which is 1168 bytes in size:

```console
$ cat .build/blink.bin | wc -c
    1168
```
