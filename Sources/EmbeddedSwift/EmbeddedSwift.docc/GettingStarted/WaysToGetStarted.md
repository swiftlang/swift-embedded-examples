# Getting started with Embedded Swift

Possible directions to explore to start using Embedded Swift

## Introduction

Embedded Swift is a way to write code for embedded systems using the Swift programming language. Depending on the use case, there are different ways of using it, different ways of integrating with existing ecosystems, and different setups for different hardware devices. This guide will help you explore various paths to get started with embedded development using Swift.

Before diving into Embedded Swift development, you should have:

- Basic knowledge of the Swift programming language
- A Swift toolchain installed on your development host
- A target embedded platform in mind (e.g. a Raspberry Pi Pico)
  - this can also be a simulated hardware platform (e.g. in QEMU), or even a full desktop OS environment in case you're not interested in controlling low-level hardware or custom electronic peripherals
  
> Note: Embedded Swift is experimental. Public releases of Swift do not support Embedded Swift, yet. See <doc:InstallEmbeddedSwift> for details.

## Guided Tutorials

To help you get started with Embedded Swift, we've prepared several step-by-step guides that cover different platforms and use cases:

- <doc:macOSGuide> - Try out Embedded Swift on your development machine
- <doc:PicoGuide> - Build and run Swift code on a Raspberry Pi Pico
- <doc:STM32BaremetalGuide> - Set up a baremetal Swift project for STM32 microcontrollers

These guides provide a practical introduction to Embedded Swift development with specific hardware targets, showing you how to build, upload, and run your first Swift programs on embedded systems.

## Other Resources

For a deeper understanding of Embedded Swift concepts and philosophy, check out these resources:

- <doc:Introduction> - Learn about the core concepts and philosophy of Embedded Swift
- <doc:LanguageSubset> - Understand which Swift language features are available in Embedded Swift
- <doc:InstallEmbeddedSwift> - Detailed instructions for installing the required toolchain

For developers coming from embedded C/C++ backgrounds or those integrating Swift into existing projects:

- <doc:Basics> - Essential knowledge for using Embedded Swift effectively
- <doc:ConditionalCompilation> - How to share code between Embedded Swift and standard Swift
- <doc:Libraries> - Understanding how libraries work in Embedded Swift
