# Echoing UART input on the ESP32

Run a Swift UART echo program on a RISC-V ESP32 device using the ESP-IDF SDK.

This example demonstrates how to use the ESP-IDF UART driver from Swift to build a simple echo application. It wraps the ESP-IDF UART APIs in a Swift-friendly `Uart` struct and redirects Swift's standard I/O (`print()` and `readLine()`) to a custom UART port, so ordinary Swift console code communicates over a serial connection. The target is the ESP32-C6, but any RISC-V based Espressif chip works.

The Swift code initializes UART1 on GPIO20 (TX) and GPIO19 (RX), redirects `stdin`/`stdout`/`stderr` to that port, and echoes every line it reads back to the sender:

```swift
@_cdecl("app_main")
func main() {
  print("Hello from Swift on ESP32-C6!")  // This will be printed to the console

  // Initialize UART1 with TX on GPIO20 and RX on GPIO19
  let uart = Uart(portNum: 1, txPin: 20, rxPin: 19)

  uart.redirectStdio()

  while let line = readLine(strippingNewline: false) {
    print(line, terminator: "")
  }
}
```

[View the example source on GitHub.](https://github.com/swiftlang/swift-embedded-examples/tree/main/esp32-uart-echo)

## Install ESP-IDF

Set up the [ESP-IDF](https://docs.espressif.com/projects/esp-idf/en/stable/esp32/) development environment by following the [ESP-IDF "Get Started" guide](https://docs.espressif.com/projects/esp-idf/en/v5.4/esp32c6/get-started/index.html).

> Important: Configure your environment specifically for RISC-V based Espressif chips. Embedded Swift doesn't support Xtensa-based products.

Before adding Swift, confirm that your setup can build the standard C/C++ sample projects. A good test is building and running the `get-started/hello_world` example from ESP-IDF.

## Install Swift

> Note: Embedded Swift is experimental. Public releases of Swift don't support Embedded Swift yet. See <doc:InstallEmbeddedSwift> for details.

Follow the instructions in <doc:InstallEmbeddedSwift> to install the latest Swift development snapshot with Embedded Swift support. Confirm the installation by running `swift --version` — it should report a "6.2-dev" or newer development snapshot.

## Build the project

Source the ESP-IDF environment script to make `idf.py` available in your shell:

```shell
$ . <path-to-esp-idf>/export.sh
```

Navigate to the example directory and set your target board. Any RISC-V based Espressif chip is supported:

```shell
$ cd esp32-uart-echo
$ idf.py set-target esp32c6  # or esp32c3, esp32p4, etc.
```

Build the project:

```shell
$ idf.py build
```

## Run on a device

Connect your ESP32 board to your Mac using USB. Then connect a USB-UART converter to the configured UART pins (example for ESP32-C6):

- TX (GPIO20) on the board to RX on the USB-UART converter
- RX (GPIO19) on the board to TX on the USB-UART converter
- GND on the board to GND on the USB-UART converter

Flash the firmware:

```shell
$ idf.py flash
```

Open a serial terminal connected to the USB-UART converter at 115200 baud:

```shell
$ picocom -b 115200 /dev/ttyUSB0
```

Type text and press Enter. The board echoes the text back to you.

## Modfy the configuration

The default UART configuration in `Main.swift` uses UART1, GPIO20 for TX, GPIO19 for RX, and a baud rate of 115200. To change these settings, modify the `Uart` initialization in `Main.swift`:

```swift
let uart = Uart(portNum: 1, txPin: 20, rxPin: 19, baudRate: 115200)
```
