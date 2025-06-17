# stm32-lvgl

<img src="https://github.com/user-attachments/assets/f29e0a62-2e40-4e02-85f5-573685084088" />

This sample code is demonstrating a "full" graphical firmware running on an STM32 microcontroller board, concretely the STM32F746G "Discovery" board. It shows using:

- **ELF file format**, linking with lld, with a custom simple linker script (and thus it builds identically on both macOS and Linux hosts)
- **LLVM Embedded Toolchain for ARM**
- **LVGL** graphical/input/animation library
- The **DRAM, LCD, touch panel, GPIO pins and interrupts** on the STM32F746G
- **No other SDKs or library dependencies** -- all the startup code, including MCU, board and peripheral initialization is done in Swift source code

Additionally, this sample code:

- Has **LSP integration** set up via the `.sourcekit-lsp/config.json` file, confirmed to work in multiple code editors (VS Code, Sublime Text, Zed)
- Uses **SwiftPM's toolset.json** to define compiler and linker flags
- Has a host OS (macOS, Linux) **"simulator" using SDL** that can use the same "business logic" code to render the same LVGL UI.

## How to build and run this example:

1. Connect the STM32F746G-DISCO board via the ST-LINK USB port to your Mac.
2. Install the right Swift toolchain specified in this repo's `.swift-version` file. This is best done using `swiftly`:
```console
$ swiftly install  # Run in the project's directory
```
3. Install the `stlink` (https://github.com/stlink-org/stlink) command line tools, e.g. via `brew install stlink`.
4. Run a provided shell script that fetches the LVGL and LLVM dependencies:
```console
$ ./fetch-dependencies.sh
```
5. Build the firmware by running make:
```console
$ make
```
6. Flash the built firmware by running make with the following target:
```console
$ make flash
```

You should now see the UI animating on the board's LCD display, and the touch screen should react to inputs.

Optionally, you can also run build and run the code in a desktop OS SDL "simulator" by:
```console
$ make simulator
```

## Additional information

- The ELF linking, linker script and packaging scheme is destribed in detail [inside the linker script](Sources/Support/linkerscript.ld).
