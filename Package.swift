// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "coding-challenge-fyi",
    platforms: [.macOS(.v14)],
    products: [
        .library(
            name: "coding-challenge-fyi",
            targets: ["coding-challenge-fyi"]),
    ],
    targets: [
        .target(
            name: "coding-challenge-fyi"),
        .testTarget(
            name: "coding-challenge-fyiTests",
            dependencies: ["coding-challenge-fyi"]),
    ]
)
