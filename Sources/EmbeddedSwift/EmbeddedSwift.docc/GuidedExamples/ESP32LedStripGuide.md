# Driving a WS2812 LED strip on the ESP32

Run a Swift program that animates a WS2812 LED strip on a RISC-V ESP32 device using the ESP-IDF SDK.

This example demonstrates how to integrate with the ESP-IDF SDK using CMake along with the existing LED strip library to control WS2812 lights from Swift. The target is the ESP32-C6-DevKitC-1 board, driving the strip's data pin from GPIO pin 0 over SPI. Any RISC-V based Espressif chip works.

<img src="https://github.com/swiftlang/swift-embedded-examples/assets/1186214/15f8a3e0-953e-426d-ad2d-3902baf859be">

The Swift code wraps the ESP-IDF LED strip driver in a `LedStrip` struct, and an `app_main` entry point — the standard C entry point for ESP-IDF applications — animates a single random-colored pixel in an infinite loop:

```swift
@_cdecl("app_main")
func main() {
  print("Hello from Swift on ESP32-C6!")

  let n = 1
  let ledStrip = LedStrip(gpioPin: 8, maxLeds: n)
  ledStrip.clear()

  var colors: [LedStrip.Color] = .init(repeating: .off, count: n)
  while true {
    colors.removeLast()
    colors.insert(.lightRandom, at: 0)

    for index in 0..<n {
      ledStrip.setPixel(index: index, color: colors[index])
    }
    ledStrip.refresh()

    let blinkDelayMs: UInt32 = 500
    vTaskDelay(blinkDelayMs / (1000 / UInt32(configTICK_RATE_HZ)))
  }
}
```

[View the example source on GitHub.](https://github.com/swiftlang/swift-embedded-examples/tree/main/esp32-led-strip-sdk)

## Install ESP-IDF

Set up the [ESP-IDF](https://docs.espressif.com/projects/esp-idf/en/stable/esp32/) development environment by following the [ESP-IDF "Get Started" guide](https://docs.espressif.com/projects/esp-idf/en/v5.4/esp32c6/get-started/index.html).

> Important: Configure your environment specifically for RISC-V based Espressif chips. Embedded Swift doesn't support Xtensa-based products.

Before adding Swift, confirm that your setup can build the standard C/C++ sample projects. A good test is building and running the `get-started/blink` example from ESP-IDF.

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
$ cd esp32-led-strip-sdk
$ idf.py set-target esp32c6  # or esp32c3, esp32p4, etc.
```

Build the project:

```shell
$ idf.py build
```

## Run on a device

Connect the ESP32-C6-DevKitC-1 board to your Mac using USB. Wire up an external WS2812 LED strip and use GPIO pin 0 as the data pin. You might need to use a level shifter.

Flash the firmware:

```shell
$ idf.py flash
```

The LED strip animates a sequence of random colors moving in one direction.

## Simulate with Wokwi

If you don't have a physical device, you can simulate the firmware directly in VS Code. To do this:

1. Build the project to generate the firmware binaries as shown above.
2. Install the [Wokwi for VS Code](https://docs.wokwi.com/vscode/getting-started/) extension.
3. Open the `diagram.json` file in VS Code.
4. Click the Play button to start the simulation.
5. Click the Pause button at any time to freeze the simulation and inspect the current state of the GPIO pins.
