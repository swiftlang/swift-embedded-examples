// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "stm32-neopixel",
  products: [
    .executable(name: "Application", targets: ["Application"])
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-mmio", branch: "main")
  ],
  targets: [
    .executableTarget(
      name: "Application",
      dependencies: ["STM32F7X6", "Support"]),
    // SVD2Swift \
    // --input Sources/STM32F7X6/stm32f7x6.patched.svd \
    // --output Sources/STM32F7X6 \
    // --access-level public \
    // --indentation-width 2 \
    // --peripherals DMA1 DMA2 GPIOA GPIOB GPIOI RCC SPI1 SPI2 USART1
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
