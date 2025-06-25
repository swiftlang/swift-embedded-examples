# Basics of using Embedded Swift

Basic information for using Embedded Swift in typical embedded projects

## Using Embedded Swift

A typical setup and build and run cycle for an embedded development board involves:

1. Getting an SDK with the C compilers, headers and libraries for the target
2. Building the C source code, and Swift source code into object files.
3. Linking all the libraries, C object files, and Swift object files.
4. Post-processing the linked firmware into a flashable format (UF2, BIN, HEX, or bespoke formats)
5. Uploading the flashable binary to the board over a USB cable using some vendor-provided JTAG/SWD tool, by copying it to a fake USB Mass Storage volume presented by the board or a custom platform bootloader.
6. Restarting the board, observing physical effects of the firmware (LEDs light up) or UART output over USB, or presence on network, etc.

Many of these steps are out of scope for this document, because they are unrelated to Swift, and need to be set up and achieved independently of using Embedded Swift. For that, refer to your hardware vendor provided documentation.

This document only focuses on (2) from the list above, and it's important that you first get familiar with the details of firmware development for your board without Swift in the mix. Even if you want to build a completely pure Swift firmware, you are still going to need the vendor provided tooling for linking, post-processing, uploading, etc.

## Building code using Embedded Swift

A basic way to build a set of Swift source files in Embedded Swift mode, is to simply give the compiler the following:
1. a target triple
2. the `-enable-experimental-feature Embedded` flag
3. the set of source files that form the input module:

```shell
$ swiftc -target <target triple> -enable-experimental-feature Embedded -wmo \
  input1.swift input2.swift ... -c -o output.o
```

On macOS, it's common to have Xcode installed, which comes with a toolchain that does not support Embedded Swift yet. Unless you download, install, and activate a swift.org toolchain, you'll see this error:

```shell
$ swiftc input1.swift -enable-experimental-feature Embedded -wmo
<unknown>:0: error: unable to load standard library for target 'arm64-apple-macosx15.0'
```

To resolve that, install a nightly Swift toolchain using Swiftly. You can follow the guide at <doc:InstallEmbeddedSwift> for full instructions on that.

## Building Swift firmware for a concrete embedded target

To build Swift firmware (for now ignoring integration with SDKs, libraries and other pre-existing C code), we can use the `-target` argument to specify the CPU architecture. The target triple also decides whether the output object file will be an ELF file, or a Mach-O. For example:

```bash
# To build an ARMv7 Mach-O object file:
$ swiftc -target armv7-apple-none-macho -enable-experimental-feature Embedded -wmo \
  input1.swift input2.swift ... -c -o output.o

# To build an ARMv7 ELF object file:
$ swiftc -target armv7-none-none-eabi -enable-experimental-feature Embedded -wmo \
  input1.swift input2.swift ... -c -o output.o
```

> Note: Passing only a single `.swift` file to swiftc results in the generation of a `_main` symbol. During linking, this symbol could potentially clash with other objects that also define one. To avoid this, compile multiple Swift files together or use the `-parse-as-library` flag.

Additionally, you probably want to specify additional Clang and/or LLVM flags to get the compiler to produce code for the exact ISA and ABI you need for your target.

For example, a Raspberry Pi Pico / Pico W should target the ARMv6-M architecture via the `armv6m-*` target triple, but the `-mfloat-abi=soft` Clang option should also be used, and if you want to match ABI with libraries built with the GNU toolchain, you might also need `-fshort-enums`. To pass those to Swift, use the `-Xcc` prefix:

```bash
# To build an ELF object file for ARMv6-M with soft float ABI (floating-point arguments passed in integer registers) and "short enums":
$ swiftc -target armv6m-none-none-eabi -enable-experimental-feature Embedded -wmo \
   -Xcc -mfloat-abi=soft -Xcc -fshort-enums \
  input1.swift input2.swift ... -c -o output.o
```

This might not be obvious: `-Xcc` flags are typically only used to alter behavior of the Clang importer, but passing flags to Clang this way also works to specify LLVM target options like selecting a specific CPU architecture (`-march`, `-mcpu`, `-mmcu`), FPU unit availability (`-mfpu`), which registers are used to pass floating-point values (`-mfloat-abi`), and others.

## Integrating with existing embedded SDKs and build systems

It's very common to integrate with existing SDKs in embedded development. This typically involves:

1. **Setting up the build environment** with the right compiler flags, include paths, and linker settings to match the SDK's requirements.
2. **Creating a bridging header** that exposes the C functions and types from the SDK to Swift.
3. **Configuring the build system** to compile Swift code with the right flags and link it with the SDK's libraries.

Most embedded SDKs provide a build system integration, commonly with CMake, Make, or their own custom build scripts. For details and concrete examples of how to integrate with more common platforms, SDKs and build systems, see <doc:IntegratingWithPlatforms>.
