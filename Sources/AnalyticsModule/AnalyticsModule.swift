//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2021. 12. 26..
//

@_exported import FeatherCore
@_exported import AnalyticsApi

public extension HookName {
    //    static let permission: HookName = "permission"
}

struct AnalyticsModule: FeatherModule {
    
    var bundleUrl: URL? {
        Bundle.module.resourceURL?.appendingPathComponent("Bundle")
    }

    let router = AnalyticsRouter()
    
    func boot(_ app: Application) throws {
        app.migrations.add(AnalyticsMigrations.v1())

        app.hooks.register(.installUserPermissions, use: installUserPermissionsHook)
        app.hooks.register(.adminRoutes, use: router.adminRoutesHook)
        app.hooks.register(.apiRoutes, use: router.apiRoutesHook)
        app.hooks.register(.adminCss, use: adminCssHook)
        app.hooks.register(.adminWidgets, use: adminWidgetsHook)
        app.hooks.register(.webMiddlewares, use: webMiddlewaresHook)
    }
    
    func adminCssHook(args: HookArguments) -> [OrderedHookResult<String>] {
        [
            .init("/css/analytics/admin.css", order: 42)
        ]
    }
    
    func adminWidgetsHook(args: HookArguments) -> [OrderedHookResult<TemplateRepresentable>] {
        if args.req.checkPermission(Analytics.permission(for: .detail)) {
            return [
                .init(AnalyticsAdminWidgetTemplate(), order: 300),
            ]
        }
        return []
    }

    func webMiddlewaresHook(args: HookArguments) -> [Middleware] {
        [
            AnalyticsLogMiddleware(),
        ]
    }
    
    func installUserPermissionsHook(args: HookArguments) -> [User.Permission.Create] {
        var permissions = Analytics.availablePermissions()
        permissions += Analytics.Log.availablePermissions()
        return permissions.map { .init($0) } 
    }
}
