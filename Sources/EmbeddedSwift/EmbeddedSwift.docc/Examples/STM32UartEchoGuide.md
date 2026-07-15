# Echoing UART input on the STM32F746G-DISCO

@Metadata {
    @CallToAction(url: "https://github.com/swiftlang/swift-embedded-examples/tree/main/stm32-uart-echo", purpose: download, label: "Open on GitHub")
    @PageImage(purpose: card, source: "STM32UartEchoGuide-card", alt: "A terminal echoing UART input from the STM32F746G-DISCO.")
}

Run a baremetal Swift program that echoes UART1 input on the STM32F746G-DISCO board, with no vendor SDKs or external toolchains.

This example demonstrates how to drive the STM32F7's USART peripheral directly through Swift MMIO, without depending on an SDK. The Swift code configures UART1 on pins A9 (TX) and B7 (RX), redirects `print()` and the C `putchar` entry point to that port, and echoes every received byte back over the wire.

```swift
import STM32F7X6
import Support

@main
public struct Application {
  public static func main() {
    // ... clock and GPIO configuration ...

    usart1.cr1.modify { rw in
      rw.raw.ue = 1  // Enable USART 1
      rw.raw.re = 1  // Enable RX
      rw.raw.te = 1  // Enable TX
    }

    print("Hello Swift!")

    while true {
      waitRxBufferFull()
      let byte = rx()
      tx(value: byte)
      waitTxBufferEmpty()
    }
  }
}

@_cdecl("putchar")
public func putchar(_ value: CInt) -> CInt {
  waitTxBufferEmpty()
  tx(value: UInt8(value))
  waitTxBufferEmpty()
  return 0
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
$ cd stm32-uart-echo
$ make
```

## Run on a device

Connect the STM32F746G-DISCO board to your Mac using the ST-LINK USB port. The board's ST-LINK interface exposes a "usbmodem" serial device under `/dev`. Open a serial terminal connected to it, for example with the macOS built-in `screen` program:

```shell
$ screen /dev/cu.usbmodem<...> 115200
```

Flash the firmware:

```shell
$ st-flash --reset write .build/armv7em-apple-none-macho/release/Application.bin 0x08000000
```

The terminal shows a "Hello Swift!" message. Typing into the terminal echoes each character back, since the board replies over the same UART connection.
