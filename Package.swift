// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DPSwift",
    products: [
        .library(
            name: "DPSwift",
            targets: ["DPSwift"]
        )
    ],
    dependencies: [
        .package(name: "KeychainSwift", url: "https://github.com/evgenyneu/keychain-swift.git", .exact("19.0.0"))
    ],
    targets: [
        .target(
            name: "DPSwift",
            dependencies: ["KeychainSwift"],
            path: "Sources"
        )
    ]
)
