// swift-tools-version: 6.0

import PackageDescription

// The linker map is written by the Application's final link only, to a
// location which is the same for every build system.
let linkerMap = Context.packageDirectory + "/.build/Application.mangled.map"

let package = Package(
  name: "RP2040",
  products: [
    .executable(name: "Application", targets: ["Application"])
  ],
  targets: [
    .executableTarget(
      name: "Application",
      dependencies: ["RP2040"],
      linkerSettings: [
        .unsafeFlags(["-Xlinker", "-map", "-Xlinker", linkerMap])
      ]),
    .target(name: "Support"),
    .target(name: "RP2040", dependencies: ["Support"]),
  ],
  swiftLanguageModes: [.v5])
