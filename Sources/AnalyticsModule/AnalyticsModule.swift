//
//  AnalyticsModule.swift
//  AnalyticsModule
//
//  Created by Tibor Bödecs on 2020. 11. 19..
//

import FeatherCore

final class AnalyticsModule: ViperModule {

    static var name: String = "analytics"

    var router: ViperRouter? { AnalyticsRouter() }
    
    var migrations: [Migration] {
        [
            AnalyticsMigration_v1_0_0(),
        ]
    }

    static var bundleUrl: URL? {
        Bundle.module.resourceURL?.appendingPathComponent("Bundle")
    }

    func boot(_ app: Application) throws {
        app.hooks.register("admin", use: (router as! AnalyticsRouter).adminRoutesHook)
        app.hooks.register("frontend-middlewares", use: frontendMiddlewaresHook)
        app.hooks.register("leaf-admin-menu", use: leafAdminMenuHook)
        app.hooks.register("user-permission-install", use: userPermissionInstallHook)
    }

    // MARK: - hooks

    func leafAdminMenuHook(args: HookArguments) -> LeafDataRepresentable {
        [
            "name": "Analytics",
            "icon": "pie-chart",
            "permission": "analytics.module.access",
            "items": LeafData.array([
                [
                    "url": "/admin/analytics/overview/",
                    "label": "Overview",
                ],
                [
                    "url": "/admin/analytics/logs/",
                    "label": "Logs",
                    "permission": "analytics.logs.list",
                ],
            ])
        ]
    }

    func frontendMiddlewaresHook(args: HookArguments) -> [Middleware] {
        [AnalyticsMiddleware()]
    }
}
