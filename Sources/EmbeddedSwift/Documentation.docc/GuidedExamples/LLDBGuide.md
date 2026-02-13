# LLDB Guide (work in progress)
🚧 Under construction...

Tutorial for using LLDB when debugging your Swift Embedded code.

In this guide, we’ll build a sample embedded app for a **TODO: Board Name** that contains a bug. We’ll then use LLDB to identify the bug, and fix it.

## Prerequisites
- Install Swift, LLDB, and SVD2LLDB (instructions below)
- A **TODO: Board Name** board
- A SWD / JTAG debugger

## Installing Swift, LLDB and SVD2LLDB
> Note: Embedded Swift is experimental. Public releases of Swift do not support Embedded Swift, yet. See doc:InstallEmbeddedSwift for details.

To install Swift for embedded development, follow the instructions in doc:InstallEmbeddedSwift, which guides you through using swiftly to install the latest development snapshot with Embedded Swift support. The toolchain will include the LLDB Debugger, so you don't need to install it separately.

To install SVD2LLDB, which is an LLDB plugin to enhance firmware debugging by providing semantic access to hardware registers in debug sessions, follow the instructions [in the swift-mmio docs](https://swiftpackageindex.com/apple/swift-mmio/0.1.1/documentation/svd2lldb).

If you're new to LLDB, apart from this guide, we recommend you check out [the related WWDC sessions](https://developer.apple.com/videos/play/wwdc2022/110370), and the [LLDB docs](https://lldb.llvm.org).

## Building our embedded app
TODO: add app

## Running the firmware and debugging using LLDB
TODO: add debug info
