// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftUI-VerticalTabView",
    products: [
        .library(
            name: "VTabView",
            targets: ["VTabView"])
    ],
    targets: [
        .target(name: "VTabView")
    ]
)
