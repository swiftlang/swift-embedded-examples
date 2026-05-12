# Integrating with embedded platforms

Understand the common patterns and approaches for integrating Swift with existing embedded systems

## Overview

Most embedded platforms provide SDKs consisting of drivers, libraries, and HAL (Hardware Abstraction Layer) components, typically written in the C language. Embedded Swift's C interoperability makes it possible to seamlessly integrate with these existing SDKs.

This will enable using the entire API surface of an SDK directly from Swift, and is usually the easiest way to get started — because all functionality from the SDK will simply be available in your Swift code. Additionally, you could build Swift wrappers around the C SDK to provide a more idiomatic Swift API. This approach requires a bit more work but can result in a more ergonomic and type-safe interface, leveraging Swift's strong type system and safety features to prevent common errors when interacting with low-level hardware.

Alternatively, for the most constrained environments or when you need complete control over the hardware, you can develop baremetal Swift applications without relying on any SDK. This approach requires implementing your own hardware initialization code and peripheral drivers directly in Swift or in C with Swift wrappers. Baremetal development gives you the maximum flexibility but requires deeper understanding of the target hardware.

## Common Integration Patterns

### Using a Bridging Header

The simplest method for integrating with an embedded platform SDK is using a bridging header that imports the necessary C headers:

```c
// BridgingHeader.h
#include "platform_specific_header.h"
#include "hardware_drivers.h"
```

When compiling Swift code, include this header:

```bash
swiftc -enable-experimental-feature Embedded -wmo \
  -import-bridging-header BridgingHeader.h \
  -target <target-triple> \
  YourSwiftCode.swift -c -o output.o
```

Using a bridging header is discouraged when building an entire set of Swift libraries, but it's a very simple approach when the goal is to simply add a single Swift module into an existing software ecosystem.

### Integrating with Build Systems

Most embedded platforms use one of these build systems:

1. **CMake**.
2. **Make**.
3. **Platform-specific build tools** - These usually allow integration of custom build steps.

For (1) and (2), articles will be added to this documentation in the future.
For (3), it is always possible to manually invoke the Swift compiler (`swiftc`) with the right flags to produce a .o file that can be further used in the build system. Follow the <doc:Basics> article for details.

### Matching platform's ISA and ABI

When integrating Swift code with embedded platforms, it's crucial to properly match the Instruction Set Architecture (ISA) and Application Binary Interface (ABI) of the target system. The Swift compiler needs specific arguments to generate code that's compatible with the target microcontroller's architecture and calling conventions. Mismatches in these settings can lead to hard-to-debug issues or even complete failure to execute.

Different microcontrollers require specific target triples and compiler flags to generate appropriate machine code. Here are common configurations you'll need:

- **ARM Cortex-M0/M0+**: `-target armv6m-none-none-eabi` - For low-power, minimal ARM cores
- **ARM Cortex-M3/M4**: `-target armv7m-none-none-eabi` - For more capable 32-bit ARM cores
- **ARM Cortex-M4F** (with FPU): `-target armv7em-none-none-eabi -Xcc -mfloat-abi=hard -Xcc -mfpu=fpv4-sp-d16` - For cores with hardware floating-point
- **RISC-V**: `-target riscv32-none-none-elf` - For RISC-V based microcontrollers

Additional important compiler flags to consider include:
- `-Xcc -mfloat-abi=[soft|hard]` - Determines whether floating-point arguments are passed in integer registers (soft) or floating-point registers (hard)
- `-Xcc -fshort-enums` - Makes enums use the smallest possible integer type, important for ABI compatibility with C code
- `-Xcc -mcpu=specific-cpu` - Specifies the exact CPU model for more optimized code generation
- `-Xfrontend -function-sections` - Places each function in its own section, enabling better dead code elimination during linking (this is a recommended setting for ELF targets)

## Platform Examples

### Raspberry Pi Pico

For detailed instructions on integrating with the Raspberry Pi Pico SDK, see <doc:IntegrateWithPico>.

### ESP32

Note that only chips based on RISC-V architecture (e.g. ESP32-C3, ESP32-C6, ESP32-P4) are supported with Embedded Swift. The Xtensa ISA (used in e.g. ESP8266 or ESP32-S2 and ESP32-S3) is not supported.

For ESP microcontrollers using the ESP-IDF framework, an article will be added to this documentation in the future.

### STM32

STM32 microcontrollers can be programmed with Embedded Swift in two ways:

1. Using the STM32Cube HAL/LL libraries - This requires proper integration with the STM32Cube build system
2. Bare-metal approach - See <doc:STM32BaremetalGuide> for details

### Zephyr

For detailed documentation on how to integrate Embedded Swift with Zephyr, see <doc:IntegrateWithZephyr>.

### Bare-metal Development

For completely bare-metal development without any SDK, see <doc:Baremetal> for guidance on implementing the necessary startup code and hardware initialization.

## Tips & tricks

- Using `print()` in your Swift code creates a dependency on `putchar`, which must be provided by your platform. Make sure your embedded environment has this C standard library function available if you plan to use Swift's printing functionality.

- For debugging, consider implementing a custom print handler by implementing a C function called `putchar` that redirects output to your debug channel (UART, SWO, RTT, etc.). Many embedded platforms already do that by default.

- Use the `-g` compiler flag during development to include debug information, making it easier to trace issues with a debugger like GDB or OpenOCD.

- Use optimization flags to control code size and performance:
  - Use `-Onone` during development for faster compilation and better debugging
  - Use `-O` or `-Osize` for release builds to minimize code size and maximize performance
  - Consider `-Osize` specifically for extremely constrained memory environments

- When you cannot use `-Onone` (e.g. because the resulting binary size exceeds the platform limits), but you still want to maximize debuggability, use the `-assert-config=Debug` flag. This enables assertions, and also extra debug prints on failures.

Remember that Embedded Swift is designed to have minimal impact on the overall system architecture, allowing you to start with small Swift components and gradually expand your Swift codebase as you become more comfortable with the language in embedded contexts.
