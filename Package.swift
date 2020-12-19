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
        .package(url: "https://github.com/malcommac/UAParserSwift", from: "1.2.1"),
        .package(name: "ALanguageParser", url: "https://github.com/matsoftware/accept-language-parser", from: "1.0.0"),

        .package(url: "https://github.com/vapor/sql-kit.git", from: "3.0.0"),
            
        .package(url: "https://github.com/vapor/fluent-sqlite-driver", from: "4.0.0"),
        .package(url: "https://github.com/binarybirds/liquid-local-driver", from: "1.2.0-beta"),
        
        /// core modules
        .package(name: "system-module", url: "https://github.com/feather-modules/system", from: "1.0.0-beta"),
        .package(name: "user-module", url: "https://github.com/feather-modules/user", from: "1.0.0-beta"),
        .package(name: "api-module", url: "https://github.com/feather-modules/api", from: "1.0.0-beta"),
        .package(name: "admin-module", url: "https://github.com/feather-modules/admin", from: "1.0.0-beta"),
        .package(name: "frontend-module", url: "https://github.com/feather-modules/frontend", from: "1.0.0-beta"),
    ],
    targets: [
        .target(name: "AnalyticsModule", dependencies: [
            .product(name: "FeatherCore", package: "feather-core"),
            .product(name: "UAParserSwift", package: "UAParserSwift"),
            .product(name: "ALanguageParser", package: "ALanguageParser"),
            .product(name: "SQLKit", package: "sql-kit"),
        ], resources: [
            .copy("Bundle"),
        ]),
        .target(name: "Feather", dependencies: [
            .product(name: "FeatherCore", package: "feather-core"),
            
            .product(name: "FluentSQLiteDriver", package: "fluent-sqlite-driver"),
            .product(name: "LiquidLocalDriver", package: "liquid-local-driver"),
            
            /// core modules
            .product(name: "SystemModule", package: "system-module"),
            .product(name: "UserModule", package: "user-module"),
            .product(name: "ApiModule", package: "api-module"),
            .product(name: "AdminModule", package: "admin-module"),
            .product(name: "FrontendModule", package: "frontend-module"),
            
            .target(name: "AnalyticsModule"),
        ]),
        .testTarget(name: "AnalyticsModuleTests", dependencies: [
            .target(name: "AnalyticsModule"),
        ])
    ]
)
