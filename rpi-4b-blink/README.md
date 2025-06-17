# rpi-4b-blink

<img src="assets/hero.jpg">

## Requirements

- A Raspberry Pi 4B board
- An SD Card, with a Raspberry Pi OS installed (this way, we don't need to create the configuration files from scratch). You may backup `kernel8.img` and `config.txt` if you need the Linux install later, since we will change these files.

## How to build and run this example:

- Make sure you have a recent nightly Swift toolchain that has Embedded Swift support.
- Build the program, then copy the kernel image to the SD card.
``` console
$ cd rpi-4b-blink
$ make
$ cp .build/release/Application.bin /Volumes/bootfs/kernel8.img
```
- If your original OS is not 64-bit, make sure to set `arm_64bit=1` in `config.txt`.
- Place the SD card in your Raspberry Pi 4B, and connect it to power.
- After the boot sequence, the green (ACT) led will start blinking in a regular pattern.
