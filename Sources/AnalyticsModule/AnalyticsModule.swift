//
//  AnalyticsModule.swift
//  AnalyticsModule
//
//  Created by Tibor Bödecs on 2020. 11. 19..
//

import FeatherCore

final class AnalyticsModule: FeatherModule {

    static let moduleKey: String = "analytics"

    var bundleUrl: URL? {
        Bundle.module.resourceURL?.appendingPathComponent("Bundle")
    }

    func boot(_ app: Application) throws {
        app.migrations.add(AnalyticsMigration_v1_0_0())
        
        let router = AnalyticsRouter()
        try router.boot(routes: app.routes)
        app.hooks.register("admin-routes", use: router.adminRoutesHook)
        app.hooks.register("frontend-middlewares", use: frontendMiddlewaresHook)
        app.hooks.register("template-admin-menu", use: templateAdminMenuHook)
        app.hooks.register("user-permission-install", use: userPermissionInstallHook)
    }

    // MARK: - hooks

    func templateAdminMenuHook(args: HookArguments) -> TemplateDataRepresentable {
        [
            "name": "Analytics",
            "icon": "pie-chart",
            "permission": "analytics.module.access",
            "items": TemplateData.array([
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
    
    func userPermissionInstallHook(args: HookArguments) -> [[String: Any]] {
        []
//        AnalyticsModule.permissions +
//        [
//            [
//                "module": Self.name.lowercased(),
//                "context": AnalyticsLogModel.name.lowercased(),
//                "action": "list",
//                "name": "List analytics logs",
//            ],
//            [
//                "module": Self.name.lowercased(),
//                "context": AnalyticsLogModel.name.lowercased(),
//                "action": "get",
//                "name": "Get analytics log details",
//            ]
//        ]
        //AnalyticsLogModel.permissions
    }
}
