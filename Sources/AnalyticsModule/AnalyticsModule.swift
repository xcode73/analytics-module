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
        app.hooks.register(.adminRoutes, use: router.adminRoutesHook)
        app.hooks.register(.apiAdminRoutes, use: router.apiAdminRoutesHook)
        
        app.hooks.register(.adminMenu, use: adminMenuHook)
        app.hooks.register(.webMiddlewares, use: webMiddlewaresHook)
        app.hooks.register(.installPermissions, use: installPermissionsHook)
    }

    // MARK: - hooks

    func adminMenuHook(args: HookArguments) -> HookObjects.AdminMenu {
        .init(key: "analytics",
              item: .init(icon: "analytics", link: Self.adminLink, permission: Self.permission(for: .custom("admin")).identifier),
              children: [
                .init(link: .init(label: "Overview", url: "/admin/analytics/overview/")),
                .init(link: .init(label: "Logs", url: "/admin/analytics/logs/"), permission: nil),
              ])
    }

    func webMiddlewaresHook(args: HookArguments) -> [Middleware] {
        [
            AnalyticsMiddleware()
        ]
    }
    
    func installPermissionsHook(args: HookArguments) -> [PermissionCreateObject] {
        var permissions: [PermissionCreateObject] = [
            Self.hookInstallPermission(for: .custom("admin"))
        ]
        permissions += AnalyticsLogModel.hookInstallPermissions()
        
        return permissions
    }
}
