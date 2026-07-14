# Driving a NeoPixel LED on the Raspberry Pi Pico 2

Run a baremetal Swift program that drives a WS2812 NeoPixel RGB LED from an RP2350's PIO block, with no SDK or operating system.

This example demonstrates how to program the RP2350's PIO (Programmable I/O) peripheral directly from Swift MMIO register definitions, without depending on the Pico SDK. A small hand-assembled PIO program drives the WS2812 protocol's timing-sensitive single-wire signal, and the CPU feeds pixel data into the PIO's TX FIFO. The example targets a "SparkFun Pro Micro - RP2350" board, but works with other RP2350 boards.

The `configurePio` function loads the WS2812 PIO program and configures its clock divider and pin mapping, and `pioWritePixel` feeds a single pixel's color into the state machine's FIFO:

```swift
func pioWritePixel(_ hsv: HSV8Pixel) {
  let rgb = RGB8Pixel(hsv)

  // Pixels need to be G R B 0 left to right.
  let ws2812Value: UInt32 =
    UInt32(rgb.green) << 24 | UInt32(rgb.red) << 16 | UInt32(rgb.blue) << 8

  func txFifoFull() -> Bool {
    pio0.fstat.read().raw.txfull & 0x1 != 0
  }

  while txFifoFull() {}

  pio0.txf[0].write { w in
    w.raw.txf0 = ws2812Value
  }
}
```

> Note: This is a baremetal example — there's no SDK or operating system involved. See <doc:Baremetal> for general guidance on baremetal Embedded Swift development.

[View the example source on GitHub.](https://github.com/swiftlang/swift-embedded-examples/tree/main/rpi-pico2-neopixel)

## Install Swift

Follow the instructions in <doc:InstallEmbeddedSwift> to install the latest Swift development snapshot with Embedded Swift support. Confirm the installation by running `swift --version` — it reports a "6.2-dev" or newer development snapshot.

## Set the configuration

The example hardcodes the GPIO pin driving the NeoPixel in the `LED_PIN` constant in `Application.swift`. The "SparkFun Pro Micro - RP2350" needs no changes, but other boards need this constant adjusted to match their wiring:

```diff
-let LED_PIN: UInt32 = 25
+let LED_PIN: UInt32 = 18
```

## Build the project

Navigate to the example directory and build it:

```shell
$ cd rpi-pico2-neopixel
$ make
```

## Run on a device

Connect the Pico 2 board to your Mac using USB, and make sure it's in USB Mass Storage firmware upload mode (hold the BOOTSEL button while plugging in the board, or make sure the flash memory doesn't already contain valid firmware).

Copy the UF2 firmware to the mounted volume:

```shell
$ cp .build/release/Application.uf2 /Volumes/RP2350
```

The RGB LED animates through the color wheel.
