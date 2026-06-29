# rpi-pico-lldb
The sample code used in the [Try out LLDB debugging on Raspberry Pi Pico](https://docs.swift.org/embedded/documentation/embedded/lldbguide) Guided Example.

## Prerequisites
- Install **Swift with Embedded support**, **LLDB**, and **SVD2LLDB**.
- A **RP2350 / RP2040** board with access to SWD (debug) pins, and an LED. On-board LEDs may be used as long as they are connected directly to GPIO; otherwise, you may use an external LED.
- A **SWD / JTAG debugger**, allowing GDB remote debug protocol connections. If you have another Raspberry Pi Pico or a Raspberry Pi Debug Probe, you can use it for debugging, via OpenOCD.

## Project layout
- **[`start-tutorial/`](start-tutorial)** — Starting point for following along with the guide.
- **[`finished-tutorial/`](finished-tutorial)** — Completed version with the bugs fixed.

## Building
This project compiles for both RP2040 and RP2350. However, you will need to specify your board while compiling:

```shell
$ cd rpi-pico-lldb/start-tutorial; make BOARD=RP2040 // or BOARD=RP2350
```