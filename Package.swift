// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "SwiftUI-VerticalTabView",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "VTabView",
            targets: ["VTabView"])
    ],
    targets: [
        .target(name: "VTabView")
    ]
)
