# Blinking LEDs on NuttX RTOS with QEMU

Run a Swift LED-blink program on Apache NuttX RTOS, emulated on a RISC-V QEMU target.

This example demonstrates how to build a NuttX application in Swift using CMake to drive the NuttX and NuttX-apps Makefile-based build system. The Swift code implements the `leds_swift` NuttX example app, which spawns a background task that cycles the emulated board's user LEDs. The example targets the `rv-virt` QEMU board, so no physical hardware is required.

The Swift code provides the `leds_swift_main` entry point that NuttX invokes when the `leds_swift` command runs from the NuttX shell (NSH). It starts a background task, `led_daemon`, implemented in C, that cycles the LEDs:

```swift
@_cdecl("leds_swift_main")
public func cMain(
  _ argc: Int32, _ argv: UnsafeMutablePointer<UnsafeMutablePointer<Int8>?>
) -> Int32 {
  let ret = task_create(
    "led_daemon",
    LEDS_PRIORITY,
    LEDS_STACKSIZE,
    led_daemon,
    nil)

  if ret < 0 {
    print("leds_main: ERROR: Failed to start led_daemon")
    return ret
  }

  print("leds_main: led_daemon started")
  return 0
}
```

## Install dependencies

Install the following tools:

- [NuttX](https://github.com/apache/nuttx) and [NuttX-apps](https://github.com/apache/nuttx-apps) — the CMake build fetches these automatically, so cloning them isn't required.
- [kconfig-frontends](https://bitbucket.org/nuttx/tools)
- [CMake](https://cmake.org/download/)
- [QEMU](https://www.qemu.org/)
- [RISC-V GNU Toolchain](https://github.com/riscv-collab/riscv-gnu-toolchain/releases)

## Install Swift

> Note: Embedded Swift is experimental. Public releases of Swift don't support Embedded Swift yet. See <doc:InstallEmbeddedSwift> for details.

Follow the instructions in <doc:InstallEmbeddedSwift> to install the latest Swift development snapshot with Embedded Swift support. Confirm the installation by running `swift --version` — it reports a "6.2-dev" or newer development snapshot. Swift 6.1 or newer is required.

## Build the project

Navigate to the example directory and configure the build for the `rv-virt` board with the `leds_swift` example enabled:

```shell
$ cd nuttx-riscv-blink
$ cmake -B build -GNinja -DBOARD_CONFIG=rv-virt:leds_swift
```

Build the project:

```shell
$ cmake --build build
```

## Run in QEMU

Run the resulting `nuttx.elf` binary in QEMU:

```shell
$ qemu-system-riscv32 \
    -semihosting \
    -M virt,aclint=on \
    -cpu rv32 -smp 8 \
    -bios none \
    -kernel build/nuttx.elf -nographic
```

At the NuttX shell prompt, run the `leds_swift` command:

```console
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
```

The emulated LEDs cycle in a binary counting pattern. Quit QEMU with `Ctrl-a x`.

## Try additional CMake targets

The project's `CMakeLists.txt` provides a few extra targets:

```shell
$ cmake -B build -DLIST_ALL_BOARDS=ON | less  # list all supported boards
$ cmake --build build -t distclean            # clean the NuttX build
$ cmake --build build -t nuttx-libs           # export NuttX as a library
```
