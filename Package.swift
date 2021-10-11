// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DPSwift",
    platforms: [
        .iOS(.v11),
    ],
    products: [
        .library(
            name: "DPSwift",
            targets: ["DPSwift"]
        )
    ],
    dependencies: [
        .package(
            name: "KeychainSwift",
            url: "https://github.com/evgenyneu/keychain-swift.git",
            .exact("19.0.0")
        ),
        .package(
            name: "Kingfisher",
            url: "https://github.com/onevcat/Kingfisher.git",
            .exact("6.3.0")
        )
    ],
    targets: [
        .target(
            name: "DPSwift",
            dependencies: [
                "KeychainSwift",
                "Kingfisher"
            ],
            path: "Sources"
        )
    ]
)
