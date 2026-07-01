# Embedded Swift

Develop baremetal, embedded, and standalone software in Swift using Embedded Swift's compilation and language mode.

## Overview

Embedded Swift provides a compilation model tailored to microcontrollers and other resource-constrained devices, producing small, freestanding binaries with no hidden runtime costs. The mode eliminates dynamic language features like reflection and runtime type metadata, replacing them with compile-time specialization so that generics, protocols, and other high-level Swift features compile down to code comparable to a traditional C compiler's output. Embedded Swift also provides full C and C++ interoperability, letting you integrate with existing vendor SDKs and hardware drivers, or write fully baremetal code with no SDK at all.

![A collage of embedded devices running Embedded Swift.](embedded-hero.png)

Embedded Swift also retains modern language features such as optionals, generics, and strong type safety, along with support for Unicode-compliant strings, conditional compilation, and library linkage models suited to embedded targets. You can rely on the full safety guarantees of Swift even when targeting devices with as little as kilobytes of available memory.

Embedded Swift is strictly a *subset* of the Swift language, not a separate dialect, so code written for Embedded Swift also compiles and behaves identically in full Swift. This makes it possible to share code between an embedded target and full Swift using conditional compilation, and to prototype or test your logic on macOS or Linux before deploying it to a physical device.

Boards with active community support include the Raspberry Pi Pico, various STM32 development boards, several ESP32 variants, and nRF52840-based boards, with more platforms being regularly added as the community grows. Whichever hardware you target, you can choose between integrating with an existing vendor SDK or writing fully baremetal code for maximum control.

@Metadata {
    @TechnologyRoot
}

## Topics

### Essentials

- <doc:Introduction>
- <doc:LanguageSubset>
- <doc:InstallEmbeddedSwift>
- <doc:Basics>

### Language features

- <doc:Strings>
- <doc:ConditionalCompilation>
- <doc:Libraries>
- <doc:ExternalDependencies>
- <doc:Existentials>
- <doc:NonFinalGenericMethods>

### STM32 examples

- <doc:STM32BaremetalGuide>
- <doc:Stm32BlinkGuide>
- <doc:Stm32UartEchoGuide>
- <doc:Stm32NeopixelGuide>
- <doc:Stm32LcdLogoGuide>
- <doc:Stm32LvglGuide>

### ESP32 examples

- <doc:ESP32Guide>
- <doc:ESP32UartEchoGuide>
- <doc:ESP32LedStripGuide>

### Raspberry Pi examples

- <doc:PicoGuide>
- <doc:Rpi4bBlinkGuide>
- <doc:Rpi5BlinkGuide>
- <doc:PicoWBlinkGuide>
- <doc:RpiPicoBlinkGuide>
- <doc:RpiPico2NeopixelGuide>
- <doc:HarmonyGuide>
- <doc:LLDBGuide>

### Other platform examples

- <doc:macOSGuide>
- <doc:NrfxBlinkGuide>
- <doc:NuttXRiscvBlinkGuide>

<!-- ### Build system support

- <doc:IntegrateWithBazel>
- <doc:IntegrateWithCMake>
- <doc:IntegrateWithMake>
- <doc:IntegrateWithSwiftPM>
- <doc:IntegrateWithXcode>
-->

### SDK support

- <doc:IntegratingWithPlatforms>
- <doc:Baremetal>
<!-- - <doc:IntegrateWithESP> -->
- <doc:IntegrateWithPico>
- <doc:IntegrateWithZephyr>

### Compiler development and details

- <doc:ABI>
- <doc:Status>
