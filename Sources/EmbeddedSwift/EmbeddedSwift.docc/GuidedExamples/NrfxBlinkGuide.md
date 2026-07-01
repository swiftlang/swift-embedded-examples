# Blinking an LED on Nordic nRF with Zephyr

Run a Swift LED-blink program on an Arm Cortex-M nRF board using the Zephyr RTOS SDK.

This example demonstrates how to integrate with the Zephyr SDK using CMake and West, and how to build a Swift firmware application on top of Zephyr and its libraries. The example was tested on an nRF52840-DK board, but it also works on other Zephyr-supported boards.

<img src="https://github.com/swiftlang/swift-embedded-examples/assets/1186214/ae3ff153-dd33-4460-8a08-4eac442bf7b0">

The Swift code toggles the board's LED using Zephyr's GPIO API, driven from a `static func main()` entry point required by Zephyr's Swift integration:

```swift
@main
struct Main {
  static func main() {
    // Note: & in Swift is not the "address of" operator, but on a global variable declared in C
    // it will give the correct address of the global.
    gpio_pin_configure_dt(
      &led0, GPIO_OUTPUT | GPIO_OUTPUT_INIT_HIGH | GPIO_OUTPUT_INIT_LOGICAL)
    while true {
      gpio_pin_toggle_dt(&led0)
      k_msleep(100)
    }
  }
}
```

## Install Zephyr

Download and install [Zephyr](https://docs.zephyrproject.org/latest/), and make sure you are set up for development with it by following the [Zephyr Getting Started Guide](https://docs.zephyrproject.org/latest/develop/getting_started/index.html). In particular, you'll need:

- CMake, Ninja, and other build tools.
- The West build system.
- A Python virtual environment for Zephyr.
- The Zephyr SDK/toolchain.
- Host flash/debug tools for the board you're using. For example, the nRF52840-DK board needs the [nRF Util](https://www.nordicsemi.com/Products/Development-tools/nRF-Util).

Before adding Swift, confirm that your setup can build the standard C/C++ sample projects. A good test is building and running the "simple/blink" example from Zephyr.

See <doc:IntegrateWithZephyr> for more details on how Swift integrates with Zephyr's CMake and West build system.

## Install Swift

> Note: Embedded Swift is experimental. Public releases of Swift don't support Embedded Swift yet. See <doc:InstallEmbeddedSwift> for details.

Follow the instructions in <doc:InstallEmbeddedSwift> to install the latest Swift development snapshot with Embedded Swift support. Confirm the installation by running `swift --version` and ensure that it reports a "6.2-dev" or newer development snapshot.

## Build the project

Activate the Zephyr virtual environment, then build the program, specifying the target board with the `-DBOARD=...` CMake setting:

```shell
$ cd nrfx-blink-sdk
$ source ~/zephyrproject/.venv/bin/activate
(.venv) cmake -B build -G Ninja -DBOARD=nrf52840dk/nrf52840 -DUSE_CCACHE=0 .
(.venv) cmake --build build
```

## Run on a device

Connect the nRF52840-DK board to your Mac using a USB cable connected to the J-Link connector on the board.

Use the `nrfutil device` command to upload the firmware and run it:

```shell
(.venv) nrfutil device program --firmware build/zephyr/zephyr.hex
(.venv) nrfutil device fw-verify --firmware build/zephyr/zephyr.hex
(.venv) nrfutil device reset
```

The green LED blinks in a pattern.
