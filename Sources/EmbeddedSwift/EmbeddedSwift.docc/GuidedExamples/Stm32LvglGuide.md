# Running LVGL on the STM32F746G-DISCO

Run a full graphical Swift firmware on the STM32F746G-DISCO board, driving an LVGL user interface on the onboard LCD with touch input.

This example demonstrates a complete baremetal graphical application: it links an ELF binary using `lld` and a custom linker script instead of the Mach-O toolchain the other STM32 examples use, so it builds identically on macOS and Linux hosts. It uses the LLVM Embedded Toolchain for Arm, the LVGL graphics library for UI rendering, and configures the STM32F746G's DRAM, LCD, touch panel, GPIO pins, and interrupts entirely from Swift and C startup code, with no other SDK or library dependencies.

<img src="https://github.com/user-attachments/assets/f29e0a62-2e40-4e02-85f5-573685084088" />

The same "business logic" code that drives the LVGL UI on the board also runs in a host OS "simulator" that renders the UI through SDL, so UI code can be developed and iterated on without hardware.

> Note: This is a baremetal example — there's no SDK or operating system involved. See <doc:Baremetal> for general guidance on baremetal Embedded Swift development. See <doc:Stm32BlinkGuide> for a much simpler baremetal STM32F746G-DISCO example that only toggles a GPIO pin.

[View the example source on GitHub.](https://github.com/swiftlang/swift-embedded-examples/tree/main/stm32-lvgl)

## Install dependencies

Install the [`stlink`](https://github.com/stlink-org/stlink) command line tools, for example with `brew install stlink`.

## Install Swift

Install the Swift toolchain version specified in this repository's `.swift-version` file. The recommended way to do this is with [swiftly](https://www.swift.org/swiftly/):

```shell
$ cd stm32-lvgl
$ swiftly install
```

Fetch the LVGL and LLVM Embedded Toolchain for Arm dependencies with the provided script:

```shell
$ ./fetch-dependencies.sh
```

## Build the project

Build the firmware:

```shell
$ make
```

## Run on a device

Connect the STM32F746G-DISCO board to your Mac using the ST-LINK USB port. Flash the firmware:

```shell
$ make flash
```

The UI animates on the board's LCD display, and the touch screen reacts to input.

## Run in the simulator

Build and run the same UI code in a desktop SDL simulator, without hardware:

```shell
$ make simulator
```

## Learn more about the linker script

The ELF linking, linker script, and packaging scheme are described in detail inside the [linker script](https://github.com/swiftlang/swift-embedded-examples/blob/main/stm32-lvgl/Sources/Support/linkerscript.ld).
