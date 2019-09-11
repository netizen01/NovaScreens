// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NovaScreens",
    products: [
        .library(name: "NovaScreens", targets: ["NovaScreens"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(name: "NovaScreens", dependencies: [])
    ]
)
