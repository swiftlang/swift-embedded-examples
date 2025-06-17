# rpi-5-blink

<img src="assets/hero.jpg">

## Requirements

- A Raspberry Pi 5 board
- An SD Card, with a Raspberry Pi OS installed (this way, we don't need to create the configuration files from scratch). You may backup `kernel8.img` and `kernel_2712.img` if you need the Linux install later, since we will change these files.

## How to build and run this example:

- Make sure you have a recent nightly Swift toolchain that has Embedded Swift support.
- Build the program, then copy the kernel image to the SD card.
``` console
$ cd rpi-5-blink
$ make
$ cp .build/release/Application.bin /Volumes/bootfs/kernel8.img # Copy kernel image to SD card
$ rm /Volumes/bootfs/kernel_2712.img # Delete this kernel image so our kernel8.img is used
$ # You can also rename our kernel8.img to kernel_2712.img, or set it to anything you want and specify "kernel=[your-img-name]" in config.txt.
```
- Place the SD card in your Raspberry Pi 5, and connect it to power.
- After the boot sequence, the green (ACT) led will start blinking in a regular pattern.
