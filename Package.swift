// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "coding-challenge-fyi",
    platforms: [.macOS(.v14)],
    products: [
        .executable(name: "coding-challenge-fyi", targets: ["coding-challenge-fyi"]),
        .executable(name: "ccwc", targets: ["ccwc"]),
        .executable(name: "program2", targets: ["program2"]),
        .executable(name: "core", targets: ["core"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.3.0"),
    ],
    targets: [
        .target(name: "core", dependencies: [
            .product(name: "ArgumentParser", package: "swift-argument-parser"),
        ]),
        .executableTarget(name: "coding-challenge-fyi", dependencies: ["core"]),
        .executableTarget(name: "ccwc", dependencies: ["core"]),
        .executableTarget(name: "program2", dependencies: ["core"]),
        .testTarget(name: "ccwcTests", dependencies: ["ccwc"]),
        .testTarget(name: "coding-challenge-fyiTests", dependencies: ["coding-challenge-fyi"]),
    ]
)