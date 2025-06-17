// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "stm32-lcd-logo",
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
      swiftSettings: [
        .enableExperimentalFeature("InlineArrayTypeSugar"),
        .enableExperimentalFeature("SymbolLinkageMarkers"),
      ]),
    // SVD2Swift \
    // --input Sources/STM32F7X6/stm32f7x6.patched.svd \
    // --output Sources/STM32F7X6 \
    // --access-level public \
    // --indentation-width 2 \
    // --peripherals FLASH GPIOA GPIOB GPIOC GPIOD GPIOE GPIOF GPIOG GPIOH GPIOI GPIOJ GPIOK LTDC RCC
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
