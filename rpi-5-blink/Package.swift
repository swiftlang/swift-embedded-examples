// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "rpi-5-blink",
  products: [
    .executable(name: "Application", targets: ["Application"])
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-mmio.git", branch: "main")
  ],
  targets: [
    .executableTarget(
      name: "Application",
      dependencies: [
        .product(name: "MMIO", package: "swift-mmio"),
        "Support",
      ]),
    .target(name: "Support"),
  ])
