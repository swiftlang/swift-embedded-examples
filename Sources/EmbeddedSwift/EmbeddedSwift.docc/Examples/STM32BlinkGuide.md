# Blinking an LED on the STM32F746G-DISCO

@Metadata {
    @CallToAction(url: "https://github.com/swiftlang/swift-embedded-examples/tree/main/stm32-blink", purpose: download, label: "Open on GitHub")
    @PageImage(purpose: card, source: "STM32BlinkGuide-card", alt: "An STM32F746G-DISCO board with its onboard LED lit.")
}

Run a baremetal Swift MMIO program that blinks an LED on the STM32F746G-DISCO board, with no vendor SDKs or external toolchains.

This example demonstrates how to build a baremetal Embedded Swift kernel image for the STM32F746G-DISCO board, generating register definitions with `svd2swift` and driving the GPIO peripheral directly through Swift MMIO. The entire firmware builds from code in the example directory alone. See <doc:STM32BaremetalGuide> for a from-scratch walkthrough of setting up a similar baremetal STM32 project.

<img src="https://github.com/swiftlang/swift-embedded-examples/assets/1186214/739e98fd-a438-4a64-a7aa-9dddee25034b">

The `Application` entry point enables the clock to GPIO port I, configures pin I1 as a push-pull output, and toggles it in an infinite loop:

```swift
import STM32F7X6
import Support

@main
struct Application {
  static func main() {
    rcc.ahb1enr.modify { rw in
      rw.raw.gpioien = 1
    }

    gpioi.moder.modify { $0.raw.moder1 = 0b1 }
    gpioi.otyper.modify { $0.raw.ot1 = 0b0 }
    gpioi.ospeedr.modify { $0.raw.ospeedr1 = 0b00 }
    gpioi.pupdr.modify { $0.raw.pupdr1 = 0b10 }

    var enable = false
    while true {
      gpioi.odr.modify { rw in
        rw.raw.odr1 = enable ? 1 : 0
      }
      enable.toggle()
      delay(milliseconds: 100)
    }
  }
}
```

> Note: This is a baremetal example — there's no SDK or operating system involved. See <doc:Baremetal> for general guidance on baremetal Embedded Swift development.

## Install dependencies

Install the [`stlink`](https://github.com/stlink-org/stlink) command line tools, for example with `brew install stlink`.

## Install Swift

Follow the instructions in <doc:InstallEmbeddedSwift> to install the latest Swift development snapshot with Embedded Swift support. Confirm the installation by running `swift --version` — it reports a "6.2-dev" or newer development snapshot.

## Build the project

Navigate to the example directory and build it:

```shell
$ cd stm32-blink
$ make
```

The Makefile drives `swift build` with a custom `armv7em-apple-none-macho` triple and toolset, then extracts a raw binary from the resulting Mach-O executable.

## Run on a device

Connect the STM32F746G-DISCO board to your Mac using the ST-LINK USB port. Flash the firmware:

```shell
$ st-flash --reset write .build/armv7em-apple-none-macho/release/Application.bin 0x08000000
```

The green LED next to the RESET button blinks in a regular pattern.

## Check the binary size

The compiled and linked binary is very small, demonstrating how Embedded Swift avoids including unnecessary code or data in the resulting program:

```console
$ size -m .build/armv7em-apple-none-macho/release/Application
Segment __TEXT: 656
  Section __text: 142
  total 142
Segment __VECTORS: 456
  Section __text: 456
  total 456
Segment __LINKEDIT: 188
total 1300
```

The binary contains only 142 bytes of code. The vector table required by the CPU dominates the size of the final firmware. The `__LINKEDIT` segment is discarded when forming the final `.bin` file, which comes out to 1168 bytes:

```console
$ cat .build/armv7em-apple-none-macho/release/Application.bin | wc -c
    1168
```
