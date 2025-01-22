// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "Les3devCapacitorWebview",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "Les3devCapacitorWebview",
            targets: ["WebviewPlugin"])
    ],
    dependencies: [
        .package(url: "https://github.com/ionic-team/capacitor-swift-pm.git", from: "7.0.0")
    ],
    targets: [
        .target(
            name: "WebviewPlugin",
            dependencies: [
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "Cordova", package: "capacitor-swift-pm")
            ],
            path: "ios/Sources/WebviewPlugin"),
        .testTarget(
            name: "WebviewPluginTests",
            dependencies: ["WebviewPlugin"],
            path: "ios/Tests/WebviewPluginTests")
    ]
)