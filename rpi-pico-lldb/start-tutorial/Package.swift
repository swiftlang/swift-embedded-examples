// swift-tools-version: 6.1

import PackageDescription

let package = Package(
  name: "rpi-pico-lldb",
  products: [
    .executable(name: "Application", targets: ["Application"])
  ],
  traits: [
    "RP2040",
    "RP2350",
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-mmio.git", branch: "main")
  ],
  targets: [
    .executableTarget(
      name: "Application",
      dependencies: [
        .target(name: "RP2040", condition: .when(traits: ["RP2040"])),
        .target(name: "RP2350", condition: .when(traits: ["RP2350"])),
        .product(name: "MMIO", package: "swift-mmio"),
        "Support",
      ]),
    .target(
      name: "RP2350",
      dependencies: [
        .product(name: "MMIO", package: "swift-mmio")
      ],
      plugins: [
        .plugin(name: "SVD2SwiftPlugin", package: "swift-mmio")
      ]),
    .target(
      name: "RP2040",
      dependencies: [
        .product(name: "MMIO", package: "swift-mmio")
      ],
      plugins: [
        .plugin(name: "SVD2SwiftPlugin", package: "swift-mmio")
      ]),
    .target(
      name: "Support",
      cSettings: [
        .define("RP2040", .when(traits: ["RP2040"])),
        .define("RP2350", .when(traits: ["RP2350"])),
      ]),
  ],
  swiftLanguageModes: [.v5])
