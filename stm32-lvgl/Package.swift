// swift-tools-version: 5.10

import PackageDescription

let package = Package(
  name: "stm32-lvgl",
  platforms: [
    .macOS(.v11)
  ],
  products: [
    .executable(name: "Application", targets: ["Application"])
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-mmio", branch: "main"),
    .package(url: "https://github.com/ctreffs/SwiftSDL2.git", from: "1.4.0"),
  ],
  targets: [
    //
    // FIRMWARE TARGETS
    //

    .executableTarget(
      name: "Application",
      dependencies: [
        "Registers",
        "Support",
        "CLVGL",
      ]),

    // SVD2Swift \
    // --input Tools/SVDs/stm32f7x6.patched.svd \
    // --output stm32-lvgl/Sources/STM32F7x6 \
    // --peripherals FLASH LTDC RCC PWR FMC SCB DBGMCU USART1 STK NVIC SYSCFG \
    //               GPIOA GPIOB GPIOC GPIOD GPIOE GPIOF GPIOG GPIOH GPIOI GPIOJ GPIOK \
    //               I2C1 I2C2 I2C3 I2C4 \
    // --access-level public
    .target(
      name: "Registers",
      dependencies: [
        .product(name: "MMIO", package: "swift-mmio")
      ]),

    .target(name: "Support"),

    .target(name: "CLVGL"),

    //
    // HOST TARGETS
    //

    .executableTarget(
      name: "HostSDLApp",
      dependencies: [
        .product(name: "SDL", package: "SwiftSDL2"),
        "CLVGL",
      ],
      swiftSettings: [.enableExperimentalFeature("Extern")],
      linkerSettings: [.unsafeFlags(["-L.build/lvgl-host/lib", "-llvgl", "-llvgl_demos"])]),
  ])
