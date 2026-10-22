// swift-tools-version: 6.0

import PackageDescription

// The linker map is written by the Application's final link only, to a
// location which is the same for every build system.
let linkerMap = Context.packageDirectory + "/.build/Application.mangled.map"

let package = Package(
  name: "stm32-uart-echo",
  products: [
    .executable(name: "Application", targets: ["Application"])
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-mmio", branch: "main")
  ],
  targets: [
    .executableTarget(
      name: "Application",
      dependencies: ["STM32F7X6", "Support"],
      linkerSettings: [
        .unsafeFlags(["-Xlinker", "-map", "-Xlinker", linkerMap])
      ]),
    // SVD2Swift \
    // --input Sources/STM32F7X6/stm32f7x6.patched.svd \
    // --output Sources/STM32F7X6 \
    // --access-level public \
    // --indentation-width 2 \
    // --peripherals GPIOA GPIOB RCC USART1
    .target(
      name: "STM32F7X6",
      dependencies: [
        .product(name: "MMIO", package: "swift-mmio")
      ],
      plugins: [
        // Plugin disabled because SwiftPM is slow.
        // .plugin(name: "SVD2SwiftPlugin", package: "swift-mmio")
      ]),
    .target(name: "Support"),
  ],
  swiftLanguageModes: [.v5])
