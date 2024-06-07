// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "analytics-module",
    platforms: [
       .macOS(.v12)
    ],
    products: [
        .library(name: "AnalyticsModule", targets: ["AnalyticsModule"]),
        .library(name: "AnalyticsApi", targets: ["AnalyticsApi"]),
    ],
    dependencies: [
//        .package(url: "git@github.com:xcode73/feather-core.git", branch: "main"),
        .package(path: "../feather-core"),
        .package(url: "git@github.com:malcommac/UAParserSwift.git", from: "1.2.1"),
        .package(name: "ALanguageParser", url: "git@github.com:matsoftware/accept-language-parser.git", from: "1.0.0"),
        .package(url: "git@github.com:vapor/sql-kit.git", from: "3.30.0"),
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
