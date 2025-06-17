# Swift 6 on NuttX RTOS using CMake

## Description

Run blink rv32-blink_leds (QEMU) example on NuttX RTOS.

> [!NOTE]
> CMake is adapted to build NuttX and NuttX-apps (Makefiles) with Swift 6.

## Requirements

- [NuttX](https://github.com/apache/nuttx) & [NuttX-apps](https://github.com/apache/nuttx-apps)
- [kconfig-frontends](https://bitbucket.org/nuttx/tools)
- [CMake](https://cmake.org/download/)
- [QEMU](https://www.qemu.org/)
- [Swift 6](https://swift.org/download/) - Swift 6.1 or greater
- [RISC-V GNU Toolchain](https://github.com/riscv-collab/riscv-gnu-toolchain/releases)

## How to build

```bash
# list all supported boards
cmake -B build -DLIST_ALL_BOARDS=ON | less
# build configuration
cmake -B build -GNinja -DBOARD_CONFIG=rv-virt:leds_swift -DENABLE_NUTTX_TRACE=[ON|OFF]
# build
cmake --build build
# clean
cmake --build build -t distclean
# export NuttX as library
cmake --build build -t nuttx-libs
```

- **Output**
```bash
qemu-system-riscv32 \
    -semihosting \
    -M virt,aclint=on \
    -cpu rv32 -smp 8 \
    -bios none \
    -kernel build/nuttx.elf -nographic
NuttShell (NSH) NuttX-12.7.0
nsh> leds_swift
leds_main: led_daemon started

led_daemon (pid# 4): Running
led_daemon: Opening /dev/userleds
led_daemon: Supported LEDs 0x7
led_daemon: LED set 0x1
board_userled: LED 1 set to 1
board_userled: LED 2 set to 0
board_userled: LED 3 set to 0
nsh> led_daemon: LED set 0x0
board_userled: LED 1 set to 0
board_userled: LED 2 set to 0
board_userled: LED 3 set to 0
led_daemon: LED set 0x1
board_userled: LED 1 set to 1
board_userled: LED 2 set to 0
board_userled: LED 3 set to 0
led_daemon: LED set 0x0
# [...] see output in QEMU
```

Quit from QEMU: `Ctrl-a x`

## References

- [Nuttx - Compiling with CMake](https://nuttx.apache.org/docs/latest/quickstart/compiling_cmake.html)
- [NuttX - C++ Example using CMake](https://nuttx.apache.org/docs/latest/guides/cpp_cmake.html)
- [NuttX - leds_rust](https://lupyuen.github.io/articles/rust6)
