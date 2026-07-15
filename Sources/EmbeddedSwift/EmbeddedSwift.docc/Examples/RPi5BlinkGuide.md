# Blinking an LED on the Raspberry Pi 5

@Metadata {
    @CallToAction(url: "https://github.com/swiftlang/swift-embedded-examples/tree/main/rpi-5-blink", purpose: download, label: "Open on GitHub")
}

Run a baremetal Swift MMIO program that blinks the Raspberry Pi 5's status LED, with no SDK or operating system.

This example demonstrates how to build a baremetal Embedded Swift kernel image for the Raspberry Pi 5 using Swift MMIO for type-safe register access, without depending on an SDK. The Swift code toggles the board's green (ACT) status LED, which is wired through the RP1 southbridge chip's GPIO controller. See <doc:RPi4bBlinkGuide> for the closely related Raspberry Pi 4B example — the two differ mainly in their GPIO register offsets and base address, since the Pi 5 drives its LED through the RP1 chip instead of the SoC's own GPIO controller.

The GPIO registers are described as Swift MMIO register types, and an `Application` entry point configures the pin as an output and toggles it in an infinite loop:

```swift
@RegisterBlock
struct GPIO {
  @RegisterBlock(offset: 0x00008)
  var gioiodir: Register<GIOIODIR>
  @RegisterBlock(offset: 0x00004)
  var giodata: Register<GIODATA>
}

let gpio = GPIO(unsafeAddress: 0x10_7d51_7c00)

@main
struct Application {
  static func main() {
    setLedOutput()
    while true {
      ledOn()
      delay()
      ledOff()
      delay()
    }
  }
}
```

> Note: This is a baremetal example — there's no SDK or operating system involved. See <doc:Baremetal> for general guidance on baremetal Embedded Swift development.

## Install Swift

Follow the instructions in <doc:InstallEmbeddedSwift> to install the latest Swift development snapshot with Embedded Swift support. Confirm the installation by running `swift --version` — it reports a "6.2-dev" or newer development snapshot.

## Prepare an SD card

Prepare an SD card with a Raspberry Pi OS install on it, so the required boot partition and configuration files already exist. Back up `kernel8.img` and `kernel_2712.img` from the SD card if you need the Linux install later, since this example replaces one of these kernel images.

## Build the project

Navigate to the example directory and build it:

```shell
$ cd rpi-5-blink
$ make
```

This produces `.build/release/Application.bin`, the raw kernel image extracted from the built ELF executable.

## Run on a device

Copy the kernel image to the SD card's boot partition, and remove the existing `kernel_2712.img` so the Raspberry Pi 5's newer boot process picks up the Embedded Swift kernel instead:

```shell
$ cp .build/release/Application.bin /Volumes/bootfs/kernel8.img
$ rm /Volumes/bootfs/kernel_2712.img
```

Alternatively, rename `Application.bin` to `kernel_2712.img` directly, or set a custom kernel filename with the `kernel=` setting in `config.txt`.

Place the SD card in the Raspberry Pi 5 and connect it to power. After the boot sequence, the green (ACT) LED blinks in a regular pattern.
