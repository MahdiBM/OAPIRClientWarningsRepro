// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OAPIRClientWarningsRepro",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "OAPIRClientWarningsRepro",
            targets: ["OAPIRClientWarningsRepro"]),
    ],
    dependencies: [
        /// Current stuff. Will emit warnings.
        .package(url: "https://github.com/apple/swift-openapi-runtime", branch: "main")
        /// My edition. Won't emit warnings.
//        .package(
//            url: "https://github.com/mahdibm/swift-openapi-runtime",
//            branch: "better-sendability"
//        )
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "OAPIRClientWarningsRepro",
            dependencies: [
                .product(name: "OpenAPIRuntime", package: "swift-openapi-runtime")
            ],
            swiftSettings: [
                /// `minimal` / `targeted` / `complete`
                .unsafeFlags(["-strict-concurrency=targeted"]),
            ]
        ),
        .testTarget(
            name: "OAPIRClientWarningsReproTests",
            dependencies: ["OAPIRClientWarningsRepro"]),
    ]
)
