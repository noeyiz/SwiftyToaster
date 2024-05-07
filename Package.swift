// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftyToaster",
    platforms: [
        .iOS(.v13) // 최소 iOS 버전 지정
    ],
    products: [
        .library(
            name: "SwiftyToaster",
            targets: ["SwiftyToaster"])
    ],
    targets: [
        .target(
            name: "SwiftyToaster",
            dependencies: [],
            path: "Sources",
            sources: ["Toaster.swift", "Toast.swift", "SwiftyToasterDuration.swift", "SwiftyToasterType.swift"]
        )
    ]
)
