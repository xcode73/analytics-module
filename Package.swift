// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "analytics-module",
    platforms: [
       .macOS(.v10_15)
    ],
    products: [
        .library(name: "AnalyticsModule", targets: ["AnalyticsModule"]),
    ],
    dependencies: [
        .package(url: "https://github.com/binarybirds/feather-core", from: "1.0.0-beta"),
        .package(url: "https://github.com/binarybirds/UAParserSwift", from: "1.2.1"),
        .package(name: "ALanguageParser", url: "https://github.com/matsoftware/accept-language-parser", from: "1.0.0"),
    ],
    targets: [
        .target(name: "AnalyticsModule", dependencies: [
            .product(name: "FeatherCore", package: "feather-core"),
            .product(name: "UAParserSwift", package: "UAParserSwift"),
            .product(name: "ALanguageParser", package: "ALanguageParser"),
        ], resources: [
            .copy("Bundle"),
        ]),
        .testTarget(name: "AnalyticsModuleTests", dependencies: [
            .target(name: "AnalyticsModule"),
        ])
    ]
)
