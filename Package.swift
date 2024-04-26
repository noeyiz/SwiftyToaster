// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftyToast",
    platforms: [
        .iOS(.v13) // 최소 iOS 버전 지정
    ],
    products: [
        .library(
            name: "SwiftyToast",
            targets: ["SwiftyToast"])
    ],
    targets: [
        .target(
            name: "SwiftyToast",
            dependencies: [],
            path: "Sources",
            sources: ["Toaster.swift", "Toast.swift", "SwiftyToastDuration.swift", "SwiftyToastType.swift"]
        )
    ]
)
