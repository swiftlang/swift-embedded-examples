# esp32-led-strip-sdk

This example demonstrates how to integrate with the ESP-IDF SDK via CMake and how to use the existing LED strip library to control WS8212 lights from Swift. This example is specifically made for the RISC-V MCUs from ESP32 (the Xtensa MCUs are not currently supported by Swift).

<img src="https://github.com/swiftlang/swift-embedded-examples/assets/1186214/15f8a3e0-953e-426d-ad2d-3902baf859be">

## Requirements

- Set up the [ESP-IDF](https://docs.espressif.com/projects/esp-idf/en/stable/esp32/) development environment. Follow the steps in the [ESP-IDF "Get Started" guide](https://docs.espressif.com/projects/esp-idf/en/v5.4/esp32c6/get-started/index.html).
  - Make sure you specifically set up development for RISC-V based Espressif chips, and not the Xtensa based products.
  
- Before trying to use Swift with the ESP-IDF SDK, make sure your environment works and can build the provided C/C++ sample projects, in particular:
  - Try building and running the "get-started/blink" example from ESP-IDF written in C.

## Building

- Make sure you have a recent nightly Swift toolchain that has Embedded Swift support.
- If needed, run export.sh to get access to the idf.py script from ESP-IDF.
- Specify the target board type by using `idf.py set-target`. Any RISC-V based Espressif chip is supported.
``` console
$ cd esp32-led-strip-sdk
$ . <path-to-esp-idf>/export.sh
$ idf.py set-target esp32c6  # or esp32c3, esp32p4, etc.
$ idf.py build
```

## Running

- Connect the ESP32-C6-DevKitC-1 board over a USB cable to your Mac.
- Wire up an external WS8212 LED strip and use GPIO pin 0 as the data pin. You might need to use a level shifter.
- Use `idf.py` to upload the firmware and to run it:

```console
$ idf.py flash
```

- The LED strip should now be animating a sequence of random colors moving in one direction.

### Simulating in VS Code

- Build the project, to generate binaries for simulation
- Install [Wokwi for VS Code](https://docs.wokwi.com/vscode/getting-started/).
- Open the `diagram.json` file.
- Click the Play button to start simulation.
- Click the Pause button to freeze simulation and display states of GPIOs.

