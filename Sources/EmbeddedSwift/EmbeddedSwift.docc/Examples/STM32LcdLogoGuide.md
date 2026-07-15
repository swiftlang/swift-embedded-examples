# Animating a Swift logo on the STM32F746G-DISCO's LCD

@Metadata {
    @CallToAction(url: "https://github.com/swiftlang/swift-embedded-examples/tree/main/stm32-lcd-logo", purpose: download, label: "Open on GitHub")
}

Run a baremetal Swift program that drives the STM32F746G-DISCO's onboard LCD panel, animating a bouncing Swift logo on a fading background.

This example demonstrates how to configure the STM32F7's LTDC (LCD-TFT Display Controller) peripheral directly through Swift MMIO, without depending on an SDK. It sets up a background layer with a color that fades in and out, and a foreground layer containing pixel data for a Swift logo that bounces around the screen.

<img src="https://github.com/swiftlang/swift-embedded-examples/assets/1186214/9e117d81-e808-493e-a20c-7284ea630f37">

The `Application` entry point configures flash wait states and the LTDC clock, then loops forever, moving the logo layer and adjusting the background color:

```swift
import STM32F7X6
import Support

@main
struct Application {
  static func main() {
    configureFlash()
    initializeLTCD()
    ltdc.configure()

    var logoPosition = Point(x: 100, y: 100)
    var logoDelta = Point(x: 1, y: 1)

    while true {
      delay(milliseconds: 10)

      if logoPosition.x <= 0 || logoPosition.x >= maxLogoPosition.x {
        logoDelta.x *= -1
      }
      if logoPosition.y <= 0 || logoPosition.y >= maxLogoPosition.y {
        logoDelta.y *= -1
      }
      logoPosition = logoPosition.offset(by: logoDelta)
      ltdc.set(layer: 1, position: logoPosition)
    }
  }
}
```

> Note: This is a baremetal example — there's no SDK or operating system involved. See <doc:Baremetal> for general guidance on baremetal Embedded Swift development. See <doc:STM32BlinkGuide> for a simpler baremetal STM32F746G-DISCO example that only toggles a GPIO pin.

## Install dependencies

Install the [`stlink`](https://github.com/stlink-org/stlink) command line tools, for example with `brew install stlink`.

## Install Swift

Follow the instructions in <doc:InstallEmbeddedSwift> to install the latest Swift development snapshot with Embedded Swift support. Confirm the installation by running `swift --version` — it reports a "6.2-dev" or newer development snapshot.

## Build the project

Navigate to the example directory and build it:

```shell
$ cd stm32-lcd-logo
$ make
```

## Run on a device

Connect the STM32F746G-DISCO board to your Mac using the ST-LINK USB port. Flash the firmware:

```shell
$ st-flash --reset write .build/lcd-logo.bin 0x08000000
```

The LCD display shows a bouncing, animated Swift logo on a fading background, and the user LED blinks.

## Check the binary size

The compiled and linked binary is around 14 KB, split between roughly 3.5 KB of code and 10 KB of pixel data for the logo:

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
