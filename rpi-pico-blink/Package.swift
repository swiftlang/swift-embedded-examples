// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "RP2040",
  products: [
    .executable(name: "Application", targets: ["Application"])
  ],
  targets: [
    .executableTarget(name: "Application", dependencies: ["RP2040"]),
    .target(name: "Support"),
    .target(name: "RP2040", dependencies: ["Support"]),
  ],
  swiftLanguageModes: [.v5])
