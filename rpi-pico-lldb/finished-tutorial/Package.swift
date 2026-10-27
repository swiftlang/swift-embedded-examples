// swift-tools-version: 6.1

import PackageDescription

// The linker map is written by the Application's final link only, to a
// location which is the same for every build system.
let linkerMap = Context.packageDirectory + "/.build/Application.mangled.map"

// SwiftPM's Debug builds enable testability, which makes the linker driver
// pass -rdynamic and Apple ld treat every global as a dead-strip root. Nothing
// in a bare-metal image looks symbols up, so unexport them and let
// -dead_strip remove what the program does not reference.
let linkerFlags = [
  "-Xlinker", "-map", "-Xlinker", linkerMap,
  "-Xlinker", "-unexported_symbol", "-Xlinker", "*",
]

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
      ],
      linkerSettings: [
        .unsafeFlags(linkerFlags)
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
