# Try out Embedded Swift on macOS

Tutorial for building a simple program for your host OS with Embedded Swift

## Overview

While desktop operating systems like macOS and Linux are not the typical targets for Embedded Swift, you **absolutely can** build code for them using the Embedded Swift mode. This is useful for experimentation, trying out Embedded Swift, or to be able to iterate fast on an idea for some code that doesn't really need the physical device to work.

The simplest program in Embedded Swift can just be a regular "Hello, World":

```swift
// HelloEmbedded.swift
print("Hello, Embedded Swift 😊")
```

And building it into an executable can be done by calling the `swiftc` compiler directly, but we'll want to add flags to enable Embedded Swift, and also Whole Module Optimization.

```shell
$ swiftc HelloEmbedded.swift -o HelloEmbedded -enable-experimental-feature Embedded -wmo
```

This will produce a regular executable binary, and we can execute it right away:

```shell
$ ./HelloEmbedded
Hello, Embedded Swift 😊
```
Hooray! Our first *host-side* Embedded Swift program is working!

## Details

Looking closer, this binary *does not actually depend on the Swift runtime in the OS* (all Embedded Swift binaries carry their runtime+stdlib dependencies within), but it is still a *dynamically-linked executable*, so it's not fully standalone in the embedded sense:

```shell
$ otool -L HelloEmbedded
HelloEmbedded:
        /usr/lib/libSystem.B.dylib (compatibility version 1.0.0, current version 1000.0.0)
```

However, the singular object file that was used to build this executable was produced by the compiler in the same fashion that a real embedded build would. If we ask the compiler and linker to minimize the size of the outputs and to remove any unused code, we can observe that the binary has no dependencies other than `putchar` from `libSystem` and that the machine code section is very small (176 bytes in the `__text` section):

```shell
$ swiftc HelloEmbedded.swift -o HelloEmbedded -enable-experimental-feature Embedded -wmo -Osize -Xlinker -dead_strip

$ nm -um HelloEmbedded
                 (undefined) external _putchar (from libSystem)

$ size -m HelloEmbedded
Segment __TEXT: 16384
        Section __text: 176
...
```

In contrast, if compiled without the Embedded Swift flags, we can see the dependencies on the Swift runtime in the OS:

```shell
$ swiftc HelloEmbedded.swift -o HelloEmbedded

$ otool -L HelloEmbedded
HelloEmbedded:
        /usr/lib/libSystem.B.dylib (compatibility version 1.0.0, current version 1000.0.0)
        /usr/lib/swift/libswiftCore.dylib (compatibility version 1.0.0, current version 0.0.0)
        /usr/lib/swift/libswiftSwiftOnoneSupport.dylib (compatibility version 1.0.0, current version 0.0.0)
```

## Where to go next

- The [Embedded Swift Vision Document](https://github.com/swiftlang/swift-evolution/blob/main/visions/embedded-swift.md) will give you an overview of the approaches and goals of Embedded Swift, and also what exactly is in the Embedded Swift language subset.
- The [collection of Embedded Swift example projects](https://github.com/swiftlang/swift-embedded-examples) on GitHub shows on which embedded devices can Swift work today, and the examples can also be used as templates for your own projects.
- The [Tools page](https://www.swift.org/tools/#editors) has guides for setting up Swift integration in your editor to enable features like indexing, autocomplete, jump-to-definition, and others.
- The [Swift forums](https://forums.swift.org/) are the best place to ask questions, give feedback or share your cool projects.
