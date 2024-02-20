// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "analytics-module",
    platforms: [
       .macOS(.v12)
    ],
    products: [
        .library(name: "AnalyticsModule", targets: ["AnalyticsModule"]),
    ],
    dependencies: [
        .package(url: "https://github.com/xcode73/feather-core", .branch("test-dev")),
        .package(url: "https://github.com/xcode73/analytics-objects", .branch("test-dev")),
        .package(url: "https://github.com/malcommac/UAParserSwift", from: "1.2.1"),
        .package(name: "ALanguageParser", url: "https://github.com/matsoftware/accept-language-parser", from: "1.0.0"),
        .package(url: "https://github.com/vapor/sql-kit.git", from: "3.28.0"),
    ],
    targets: [
        .target(name: "AnalyticsModule", dependencies: [
            .product(name: "Feather", package: "feather-core"),
            .product(name: "AnalyticsObjects", package: "analytics-objects"),
            .product(name: "UAParserSwift", package: "UAParserSwift"),
            .product(name: "ALanguageParser", package: "ALanguageParser"),
            .product(name: "SQLKit", package: "sql-kit"),
        ],
        resources: [
            .copy("Bundle"),
        ]),
    ]
)
