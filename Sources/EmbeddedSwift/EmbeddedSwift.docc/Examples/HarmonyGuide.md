# Building Harmony, a Bluetooth speaker and ferrofluid visualizer

@Metadata {
    @CallToAction(url: "https://github.com/swiftlang/swift-embedded-examples/tree/main/harmony", purpose: download, label: "Open on GitHub")
    @PageImage(purpose: card, source: "HarmonyGuide-card", alt: "The assembled Harmony Bluetooth speaker and ferrofluid visualizer.")
}

Build and flash Harmony, a Raspberry Pi Pico W firmware in Swift that streams Bluetooth audio and drives a ferrofluid visualizer.

Harmony integrates with the Pico SDK's CMake build system, similar to <doc:RPiPicoWBlinkGuide>, but combines several additional subsystems: BTstack for Bluetooth Classic and the A2DP/AVRCP profiles, an SBC audio decoder, a PIO-driven I2S audio pipeline, a quadrature encoder and button input, and a WS2812 LED strip driver, all written in Swift. See `harmony/README.md` for the Bill of Materials and hardware assembly details.

> Note: This example uses the Pico SDK's CMake build system, not a baremetal setup. See <doc:RPiPicoGuide> for the CMake and Pico SDK integration this example builds on.

## Install Swift

Follow the instructions in <doc:InstallEmbeddedSwift> to install the latest Swift development snapshot with Embedded Swift support. Confirm the installation by running `swift --version` — it reports a "6.2-dev" or newer development snapshot.

## Install dependencies

- A checkout of the [pico-sdk](https://github.com/raspberrypi/pico-sdk.git), with git submodules checked out.
- A checkout of [pico-extras](https://github.com/raspberrypi/pico-extras.git).
- CMake.
- The [Arm Embedded Toolchain](https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads).
- [OpenOCD](https://openocd.org/), for flashing over the Pico's debug port.

## Build the project

Navigate to the example directory, set the required environment variables, and configure the build:

```shell
$ cd harmony
$ export PICO_BOARD=pico_w
$ export PICO_SDK_PATH='<path-to-your-pico-sdk>'
$ export PICO_EXTRAS_PATH='<path-to-your-pico-extras>'
$ export PICO_TOOLCHAIN_PATH='<path-to-the-arm-toolchain>'
$ cmake -B build -G Ninja . -DCMAKE_EXPORT_COMPILE_COMMANDS=On
```

Build the project:

```shell
$ cmake --build build
```

## Run on a device

Connect the Pico to your Mac using USB, and put it into BOOTSEL mode by holding the BOOTSEL button while plugging it in. Flash the firmware with OpenOCD:

```shell
$ openocd -f interface/cmsis-dap.cfg -f target/rp2040.cfg -c "adapter speed 5000" -c "program build/app.elf verify reset exit"
```

After the device reboots, pair with it over Bluetooth and stream audio to hear it play through the speaker while the ferrofluid display reacts to the music.

## Monitor UART output

Connect to the Pico's UART using a serial terminal program, for example the macOS built-in `screen`:

```shell
$ screen /dev/cu.usbmodem<...> 115200
```
