# Blinking an LED in Morse code on the Raspberry Pi Pico

@Metadata {
    @CallToAction(url: "https://github.com/swiftlang/swift-embedded-examples/tree/main/rpi-pico-blink", purpose: download, label: "Open on GitHub")
}

Run a baremetal Swift program on a Raspberry Pi Pico that spells "Hello Swift!" in Morse code on the onboard LED, with no SDK or operating system.

This example demonstrates how to build a baremetal Embedded Swift kernel image for the Raspberry Pi Pico's RP2040 chip from scratch, without depending on the Pico SDK. The package provides its own `RP2040` hardware abstraction layer that wraps the chip's memory-mapped registers (GPIO, clocks, resets, the SIO block, and more), a `crt0.S` startup file, and a `Package.swift` built with a custom Mach-O toolset that gets converted to the UF2 firmware format. See <doc:RPiPicoGuide> for the CMake-based Pico SDK approach to this same board.

The `Application` entry point configures the LED pin as an output, then loops forever, blinking out the message using dots and dashes:

```swift
import RP2040

@main
struct Application {
  static var board: RP2040! = nil

  static func main() {
    board = RP2040()
    board.setMode(.output, pin: .d22)

    let str: StaticString = "Hello Swift!"
    while true {
      str.withUTF8Buffer { buffer in
        for ch in buffer {
          emit(ch)
        }
        delay(7)
      }
    }
  }
}
```

> Note: This is a baremetal example — there's no SDK or operating system involved. See <doc:Baremetal> for general guidance on baremetal Embedded Swift development.

## Install Swift

Follow the instructions in <doc:InstallEmbeddedSwift> to install the latest Swift development snapshot with Embedded Swift support. Confirm the installation by running `swift --version` — it reports a "6.2-dev" or newer development snapshot.

## Build the project

Navigate to the example directory and build it:

```shell
$ cd rpi-pico-blink
$ make
```

The Makefile drives `swift build` with a custom `armv6m-apple-none-macho` triple and toolset, then converts the resulting Mach-O binary to the UF2 firmware format using `Tools/macho2uf2.py`.

## Run on a device

Connect the Pico board to your Mac using USB, and make sure it's in USB Mass Storage firmware upload mode (hold the BOOTSEL button while plugging in the board, or make sure the flash memory doesn't already contain valid firmware).

Copy the UF2 firmware to the mounted volume:

```shell
$ cp .build/Application.uf2 /Volumes/RP2040
```

The onboard LED blinks the message in Morse code repeatedly.
