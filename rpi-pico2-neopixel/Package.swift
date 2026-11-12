// swift-tools-version: 6.0

import PackageDescription

// The linker map is written by the Application's final link only, to a
// location which is the same for every build system.
let linkerMap = Context.packageDirectory + "/.build/Application.mangled.map"

let package = Package(
  name: "rpi-pico2-neopixel",
  products: [
    .executable(name: "Application", targets: ["Application"])
  ],
  dependencies: [
    .package(name: "swift-embedded-examples", path: ".."),
    .package(url: "https://github.com/apple/swift-mmio.git", branch: "main"),
  ],
  targets: [
    .executableTarget(
      name: "Application",
      dependencies: [
        "RP2350",
        "Support",
        .product(
          name: "EmbeddedPlatformBareMetal", package: "swift-embedded-examples"),
        .product(
          name: "EmbeddedPlatformAllocator",
          package: "swift-embedded-examples"),
      ],
      linkerSettings: [
        .unsafeFlags(["-Xlinker", "-map", "-Xlinker", linkerMap])
      ]),
    .target(
      name: "RP2350",
      dependencies: [
        .product(name: "MMIO", package: "swift-mmio")
      ],
      plugins: [
        .plugin(name: "SVD2SwiftPlugin", package: "swift-mmio")
      ]),
    .target(name: "Support"),
  ],
  swiftLanguageModes: [.v5])
