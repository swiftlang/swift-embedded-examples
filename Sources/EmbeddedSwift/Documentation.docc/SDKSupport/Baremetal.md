# Baremetal use of Embedded Swift

Programming without an SDK for maximum control and minimal size

## Overview

Developing in "baremetal mode" means programming directly for the hardware without any operating system or SDK abstractions. This provides maximum control and minimum codesize, but requires deeper understanding of the hardware.

Embedded Swift supports true baremetal development, where you directly program hardware peripherals by manipulating memory-mapped registers. This approach is suitable for:

- Extremely resource-constrained environments
- Safety-critical applications that need deterministic behavior
- Projects requiring full control over every aspect of the hardware
- Educational purposes to understand how hardware and software interact

## Key components of a baremetal project

A complete baremetal project typically includes:

1. **Startup code** - Sets up the initial environment before `main()` runs
2. **Interrupt vector table** - Maps hardware events to handler functions
3. **Linker script** - Defines memory layout and sections
4. **Hardware register definition code** - To interface with peripherals
5. **Runtime support** - E.g. implementations of functions like `memcpy` and `malloc`
6. **Application logic** - Your actual embedded application code

For a full working example of all these components, see <doc:STM32BaremetalGuide>. The rest of this document provides general platform-independent guidance when working in baremetal mode. However, much of the problem space of baremetal development is outside of the scope of this documentation, and requires deeper familiary with your specific setup. This information is typically provided by your board vendor, the spec of the MCU, the ISA spec of the execution core, the C toolchain documentation, ELF file format spec, and other similar sources.

## Hardware access patterns

### 1. Direct memory access using pointers

Note that using UnsafePointers to directly access registers at known addresses is not recommended in almost any situation because doing that correctly is tricky, it's inherently unsafe (and shifts the safety responsibility to the user) and can easily cause very hard to debug runtime problems. However, sometimes it might be neccessary to use this method.

One common issue when directly accessing hardware registers is that the compiler may optimize away repeated reads or writes, thinking they're redundant. This is a problem that's inherent to pointers in most programming languages (including C and C++).

```swift
// Accessing a register at address 0x40010000
let gpioBase = 0x40010000

// ❌ Do not do this - the memory write might be optimized out
let gpioDataRegister = UnsafeMutablePointer<UInt32>(bitPattern: gpioBase)!
gpioDataRegister.pointee |= (1 << 5) // Set bit 5
```

Hardware registers are volatile - their values can change independently of your program's execution (due to hardware events, interrupts, or peripheral operation). To ensure correct behavior, you must inform the compiler that these memory locations are volatile, preventing unwanted optimizations:

```swift
// Need to use these flags: -enable-experimental-feature Volatile
import _Volatile

// ✅ Use VolatileMappedRegister for volatile semantics
let gpioBase: UInt = 0x40010000
let gpioDataRegister = VolatileMappedRegister<UInt32>(unsafeBitPattern: gpioBase)
... = gpioDataRegister.load()
gpioDataRegister.store(1 << 5)
```

Whenever possible, consider using Swift MMIO (see below) which does also provide proper volatile semantics, but more importantly provides type safety on individual registers and their fields.

### 2. Using Swift MMIO for type-safe register access

Swift MMIO provides strongly-typed access to memory-mapped hardware and can automatically generate register definitions from SVD files. It can provide a higher-level type-safe access to hardware registers, for example:

```swift
// Type-safe register access
gpioa.odr.write { $0.odr5 = true } // Set pin 5 high
```

See [Swift MMIO](https://github.com/swiftlang/swift-mmio/) for details and <doc:STM32BaremetalGuide> for a guided example of using it.

## Creating a linker script and data segment relocation

A baremetal project requires a custom linker script to properly place code and data in memory. This is a relatively complex task to get right, and requires understanding of the memory map, flash and RAM setup of your target device, as well as understanding the ELF file format and what code/data sections do you expect your entire program to use.

Besides just defining the position of code at runtime, a linker script needs to also:
- Handle and coordinate the initialization of "zero-fill" global variables (aka the BSS section)
- Handle and coordinate the initialization of non-zero writable global variables (copying initial values from flash to RAM)

Here's an incomplete sketch of an example linker script:

```
MEMORY
{
   flash (rx)  : ORIGIN = 0x08000000, LENGTH = 1024K
   sram (rwx)  : ORIGIN = 0x20000000, LENGTH = 320K
}

SECTIONS
{
  .text   : { *(.vectors*) ; *(.text*) } > flash
  .rodata : { *(.rodata*) ; *(.got*) } > flash
  .bss    : { *(.bss*) } > sram             ; needs runtime handling
  .data   : { *(.data*) } > sram AT>flash   ; needs runtime handling

  ...
}
```

A sketch of an example corresponding startup code (in C):

```c
void ResetISR(void) {
  // Initialize bss section
  uint8_t *bss = &__bss_start;
  while (bss < &__bss_end) *bss = 0;

  // Initialize read-write data section
  extern uint8_t __data_start_flash, __data_start, __data_end;
  uint8_t *src = &__data_start_flash;
  uint8_t *dst = &__data_start;
  while (dst < &__data_end) *dst++ = *src++;

  // Call main
  extern int main(void);
  main();

  // If main returns, loop forever
  while(1);
}
```

Both these code snippets are not fully functional, they are only demonstrating the complexity of what the linker script and startup code need to do to initialize global variables.

Tip: If this handling is not done correctly, a typical symptom is that global variables "don't work", i.e. reading from them doesn't yield the right value, and writing to them doesn't persist. A good way to double check this is by using a debugger, dumping memory at runtime and checking if it matches the virtual memory layout of the ELF file.

## Vector table and interrupts

The vector table is a critical component that maps hardware interrupts and exceptions to specific handler functions in your code. It's typically placed at the beginning of flash memory and contains function pointers that the processor uses when responding to various events.

The processor automatically jumps to the appropriate handler when an interrupt occurs by indexing into this table. If you don't provide a specific handler, it's common to point to a default handler that can help with debugging.

Example vector table structure:

```c
// Vector table for ARM Cortex-M
__attribute__((section(".vectors"))) const void *VectorTable[] = {
  (void*)0x20008000,  // Initial stack pointer
  ResetISR,           // Reset handler
  DefaultHandler,     // NMI handler
  DefaultHandler,     // Hard fault handler
  // Additional vectors as needed
};
```

If you want to actually handle an interrupt (e.g. a GPIO or UART interrupt) in your Swift code, you can forward declare the function in C, and define it using `@cdecl` in Swift:

```c
// In startup.c or header file
void UART1_IRQHandler(void);
```

```swift
// In Swift code
@_cdecl("UART1_IRQHandler")
func uartInterruptHandler() {
    // Handle UART interrupt in Swift
    // Clear interrupt flags, process received data, etc.
}
```

However, note that Swift currently does not provide any form of synchronization or "interrupt safety" for the code that executes the interrupt. Namely, if your interrupt handler modifies global variables that are also accessed by your main program, you need to be careful about data races and ensure proper synchronization (such as using atomic operations or disabling interrupts during critical sections). Additionally, interrupt handlers should be kept short and fast to avoid blocking other important system events.

## Building a minimal project

To build an Embedded Swift baremetal project with SwiftPM, you will need a setup like this:

- Your main application target defined in Package.swift.
- A helper C code helper target defined in Package.swift - this will contain your C startup code, vector table and possibly an assembly file.
- Invoke `swift build` with a `--triple` argument that specifies the target CPU architecture and output object file format.
- Use a `toolset.json` file that defines the common Swift and C compilation flags, and linking flags. This will e.g. enable the Embedded Swift mode when compiling Swift code, and point the linker at the right linker script.

Example file structure:

```
MyBaremetalProject/
├── Package.swift
├── toolset.json
├── Sources/
│   ├── MyApp/
│   │   └── main.swift
│   └── CStartup/
│       ├── startup.c
│       ├── linker.ld
│       └── include/
│           └── startup.h
└── README.md
```

Example toolset.json file:

```json
{
  "schemaVersion": "1.0",
  "swiftCompiler": {
    "extraCLIOptions": [
      "-enable-experimental-feature", "Embedded",
      "-Xclang-linker", "-nostdlib",
    ]
  },
  "linker": {
    "extraCLIOptions": [
      "-T", "Sources/CStartup/linker.ld",
      "--gc-sections",
    ]
  }
}
```

Example Package.swift file:

```swift
// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "MyBaremetalProject",
    products: [
        .executable(
            name: "MyBaremetalApp",
            targets: ["MyApp"]
        )
    ],
    targets: [
        .executableTarget(
            name: "MyApp",
            dependencies: ["CStartup"],
            swiftSettings: [
                .enableExperimentalFeature("Embedded")
            ]
        ),
        .target(
            name: "CStartup",
            publicHeadersPath: "include"
        )
    ]
)
```

Example compilation invocation:

```bash
swift build --triple armv7em-none-eabi --toolset toolset.json
```
