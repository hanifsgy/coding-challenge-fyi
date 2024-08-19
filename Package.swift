// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "coding-challenge-fyi",
    platforms: [.macOS(.v14)],
    products: [
        .executable(name: "coding-challenge-fyi", targets: ["coding-challenge-fyi"]),
        .executable(name: "ccwc", targets: ["ccwc"]),
        .executable(name: "program2", targets: ["program2"])
    ],
    targets: [
        .executableTarget(name: "coding-challenge-fyi"),
        .executableTarget(name: "ccwc"),
        .executableTarget(name: "program2"),
        .testTarget(
            name: "coding-challenge-fyiTests",
            dependencies: ["coding-challenge-fyi", "ccwc", "program2"]),
    ]
)