# esp32-uart-echo

This example demonstrates how to use the ESP-IDF UART driver from Swift to create a simple echo application. It wraps the ESP-IDF UART APIs in a Swift-friendly `Uart` struct and redirects Swift's standard I/O (`print()` and `readLine()`) to a custom UART port. This example is specifically made for the RISC-V MCUs from Espressif (the Xtensa MCUs are not currently supported by Swift).

## Features

- Swift wrapper around ESP-IDF UART driver APIs
- Redirect `stdin`/`stdout`/`stderr` to a custom UART port
- Use Swift's native `readLine()` and `print()` for UART communication
- Simple echo functionality: receives data and sends it back

## Requirements

- Set up the [ESP-IDF](https://docs.espressif.com/projects/esp-idf/en/stable/esp32/) development environment. Follow the steps in the [ESP32-C6 "Get Started" guide](https://docs.espressif.com/projects/esp-idf/en/v5.4/esp32c6/get-started/index.html).
  - Make sure you specifically set up development for RISC-V based Espressif chips, and not the Xtensa based products.

- Before trying to use Swift with the ESP-IDF SDK, make sure your environment works and can build the provided C/C++ sample projects, in particular:
  - Try building and running the "get-started/hello_world" example from ESP-IDF written in C.

## Building

- Make sure you have a recent nightly Swift toolchain that has Embedded Swift support.
- If needed, run export.sh to get access to the idf.py script from ESP-IDF.
- Specify the target board type by using `idf.py set-target`. Any RISC-V based Espressif chip is supported.

```console
$ cd esp32-uart-echo
$ . <path-to-esp-idf>/export.sh
$ idf.py set-target esp32c6 # or esp32c3, esp32p4, etc.
$ idf.py build
```

## Running

This example uses ESP32-C6 as a reference, but any RISC-V based Espressif chip can be used. Adjust the GPIO pins according to your development kit.

- Connect your board over a USB cable to your computer.
- Connect a USB-UART converter to the configured UART pins (example for ESP32-C6):
  - TX (GPIO20) -> RX on USB-UART converter
  - RX (GPIO19) -> TX on USB-UART converter
  - GND -> GND on USB-UART converter
- Use `idf.py` to upload the firmware:

```console
$ idf.py flash
```

- Open a serial terminal (e.g., `picocom`, `minicom`, or `screen`) connected to the USB-UART converter at 115200 baud:

```console
$ picocom -b 115200 /dev/ttyUSB0
```

- Type text and press Enter. The text will be echoed back to you.

## Configuration

The default UART configuration in `Main.swift`:

- **Port**: UART1
- **TX Pin**: GPIO20
- **RX Pin**: GPIO19
- **Baud Rate**: 115200

To change these settings, modify the `Uart` initialization in `Main.swift`:

```swift
let uart = Uart(portNum: 1, txPin: 20, rxPin: 19, baudRate: 115200)
```
