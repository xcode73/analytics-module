// swift-tools-version:5.7
import PackageDescription
import Foundation

let package = Package(
    name: "analytics-module",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .library(name: "AnalyticsModule", targets: ["AnalyticsModule"]),
        .library(name: "AnalyticsApi", targets: ["AnalyticsApi"]),
    ],
    dependencies: [
        .package(url: "https://github.com/xcode73/feather-core.git", branch: "main"),
        .package(url: "https://github.com/malcommac/UAParserSwift.git", from: "1.2.1"),
        .package(url: "https://github.com/matsoftware/accept-language-parser.git", from: "1.1.0"),
        .package(url: "https://github.com/vapor/sql-kit.git", from: "3.30.0"),
    ],
    targets: [
        .target(name: "AnalyticsApi", dependencies: [
            .product(name: "FeatherCoreApi", package: "feather-core"),
        ]),
        .target(name: "AnalyticsModule", dependencies: [
            .product(name: "FeatherCore", package: "feather-core"),
            .product(name: "UAParserSwift", package: "UAParserSwift"),
            .product(name: "ALanguageParser", package: "ALanguageParser"),
            .product(name: "SQLKit", package: "sql-kit"),
            .target(name: "AnalyticsApi")
        ],
        resources: [
//            .copy("Bundle"),
        ]),
    ]
)
