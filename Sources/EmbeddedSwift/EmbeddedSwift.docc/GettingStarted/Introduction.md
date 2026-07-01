# Introducing Embedded Swift

Write Swift code for microcontrollers, embedded systems, and baremetal applications.

## Overview

Embedded Swift is an experimental and rapidly developing feature of the Swift language that enables development of baremetal, embedded and standalone software. It's a subset of the Swift language designed for producing small, efficient binaries with minimal dependencies, making it suitable for resource-constrained environments.

## How does Embedded Swift differ from regular Swift?

Regular Swift is not a good fit for small constrained environments like microcontrollers, mainly due to codesize and memory footprint. Regular Swift typically requires at least a few megabytes of code and data to support dynamic language features like reflection, and separately compiled generics with ABI stability. Embedded Swift, on the other hand, can be deployed to environments with as little as kilobytes of available memory. This is achieved by:

- Eliminating runtime type metadata where possible
- Removing reflection capabilities
- Using compile-time specialization (monomorphization) for generic code
- Minimizing dependencies on external libraries

It's also a good mental model to think of the Swift compiler in Embedded Swift mode as operating on a way a *traditional C compiler* does — specifically in the sense that the compiler produces an object file that does not call into or depend on symbols that are not explicitly used in the source code. This is achieved even for code that uses generics, protocols, tuples, arrays, and more — all the higher-level language features are "compiled out" (for example, generics are specialized), and standard library code is pulled into the object file as needed (for example, array implementation).

This results in properties that are a great fit for embedded software development:

- **Small binaries** that can be as tiny as a few hundred bytes for "Hello World"-like programs (fully self-contained).
- **No hidden runtime costs** – Embedded Swift's runtime library does not manage any data structures behind your back, is itself less than a kilobyte in size, and is eligible to be removed if unused.
- **No hidden allocations** which would cause unpredictable performance cliffs.
- **Full C/C++ interoperability** to directly interact with existing C libraries and hardware-specific code, making it easy to integrate with vendor SDKs.
- **Modern language features** like optionals, generics, and strong type safety are all available in Embedded Swift.
- **Full safety of Swift** is retained in Embedded Swift.

For a detailed introduction and motivation into Embedded Swift, please see "[A Vision for Embedded Swift](https://github.com/swiftlang/swift-evolution/blob/main/visions/embedded-swift.md)", a Swift Evolution document highlighting the main goals and approaches. Note that this is a historical document and does not capture latest development and further evolution. For an up-to-date in-depth breakdown of the language features of Embedded Swift, please see <doc:LanguageSubset>.

## What Embedded Swift is and isn't

- Embedded Swift **is** a way to produce small and freestanding binaries (with no, or trivial dependencies).
- Embedded Swift **is not** a complete one-click solution to program all embedded boards and MCUs.
- Embedded Swift **is** a compilation model that's analogous to a traditional C compiler in the sense that the compiler produces an object file (.o) that can be simply linked with your existing code, and it's not going to require you to port any libraries or runtimes.
- Embedded Swift **is not** a HAL, it's not an SDK for development, it's not a set of libraries to program peripherals using high-level APIs. It's instead a compilation mode that's suitable for creating these components.

## Platform support

The Swift toolchain has the ability to produce code for almost any standard ARM and RISC-V platform, and that makes Embedded Swift versatile and not limited to specific platforms or hardware devices. This way, Embedded Swift can potentially target many different microcontroller families and embedded devices.

Boards with active community support include the Raspberry Pi Pico, various STM32 development boards, various nRF52840 based boards and several ESP32 variants, with more platforms being regularly added as the community grows.

## Interoperability with existing SDKs

Software projects using Embedded Swift are typically developed in one of the following ways:

1. Integrating with an existing SDK (typically in C, or C++) that provides either an embedded OS, or OS-like facilities, hardware drivers, and overall functionality that's needed for embedded software.

2. Writing fully "baremetal" code, without any pre-existing setup or SDK. This is typically done for extremely constrained environments and/or when full control of every piece of code is needed.

Both the approaches are readily available in Embedded Swift, and the choice of which approach to use depends on your specific project requirements, hardware constraints, and development preferences. For integrating with existing SDKs, Swift's C/C++ interoperability makes it straightforward to call native SDK functions, while the baremetal approach gives you complete control over every aspect of your code's execution environment.

## Getting Started

Before diving into Embedded Swift development, you should have:

- Basic knowledge of the Swift programming language
- A Swift toolchain installed on your development host
- A target embedded platform in mind (for example, a Raspberry Pi Pico)
  - this can also be a simulated hardware platform (for example, in QEMU), or even a full desktop OS environment in case you're not interested in controlling low-level hardware or custom electronic peripherals

To start using Embedded Swift, please see the <doc:InstallEmbeddedSwift> page for installation instructions.

## Guided Tutorials

To help you get started with Embedded Swift, we've prepared several step-by-step guides that cover different platforms and use cases:

- <doc:macOSGuide> - Try out Embedded Swift on your development machine.
- <doc:RPiPicoGuide> - Build and run Swift code on a Raspberry Pi Pico.
- <doc:STM32BaremetalGuide> - Set up a baremetal Swift project for STM32 microcontrollers.

These guides provide a practical introduction to Embedded Swift development with specific hardware targets, showing you how to build, upload, and run your first Swift programs on embedded systems.

## Other Resources

For a deeper understanding of Embedded Swift concepts and philosophy, check out these resources:

- <doc:LanguageSubset> - Review which Swift language features are available in Embedded Swift.
- <doc:InstallEmbeddedSwift> - Detailed instructions for installing the required toolchain

For developers coming from embedded C/C++ backgrounds or those integrating Swift into existing projects:

- <doc:Basics> - Essential knowledge for using Embedded Swift effectively
- <doc:ConditionalCompilation> - How to share code between Embedded Swift and standard Swift
- <doc:Libraries> - Learn how libraries and modules work in Embedded Swift.
