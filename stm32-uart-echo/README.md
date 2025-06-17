# stm32-uart-echo

This demo is designed to run on an STM32 microcontroller, concretely the STM32F746G Discovery Kit, and implements a simple "echo" service over UART.

## How to build and run this example:

- Connect the STM32F746G-DISCO board via the ST-LINK USB port to your Mac.
- Open a separate terminal window and run a serial UART monitor program. For example, the macOS built-in `screen` program is able to do that (but there are other popular alternatives, like `minicom`). The ST-LINK device shows up as a "usbmodem" device under `/dev`.
```console
$ screen /dev/cu.usbmodem<...> 115200
```
- Make sure you have a recent nightly Swift toolchain that has Embedded Swift support.
- Install the `stlink` (https://github.com/stlink-org/stlink) command line tools, e.g. via `brew install stlink`.
- Build and upload the program to flash memory of the STM:
```console
$ cd stm32-uart-echo
$ make
$ st-flash --reset write .build/release/Application.bin 0x08000000
```
- The other terminal that runs the UART monitoring program should now be showing a "Hello Swift" message and if you type into the terminal, you will see the letter show up (as they are replied back over the UART).
