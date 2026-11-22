// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "swift-embedded-examples",
  products: [
    .library(name: "EmbeddedSwift", targets: ["EmbeddedSwift"]),
    .library(
      name: "EmbeddedPlatformBareMetal", targets: ["EmbeddedPlatformBareMetal"]),
    .library(
      name: "EmbeddedPlatformAllocator",
      targets: ["EmbeddedPlatformAllocator"]),
  ],
  dependencies: [
    .package(
      url: "https://github.com/swiftlang/swift-docc-plugin", from: "1.1.0")
  ],
  targets: [
    .target(name: "EmbeddedSwift"),

    // The Embedded Swift platform layer for the bare-metal examples.
    //
    // CEmbeddedPlatform is a copy of EmbeddedPlatform.h from the Swift
    // project (stdlib/public/EmbeddedPlatform/swift). The Swift targets
    // implement its functions with `@implementation @c`, so the compiler
    // compares each implementation with the header.
    .target(name: "CEmbeddedPlatform"),
    .target(
      name: "EmbeddedPlatformBareMetal",
      dependencies: ["CEmbeddedPlatform"],
      swiftSettings: [.enableExperimentalFeature("Extern")]),
    .target(
      name: "EmbeddedPlatformAllocator",
      dependencies: ["CEmbeddedPlatform"]),
  ])
