//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2021. 12. 26..
//

struct AnalyticsRouter: FeatherRouter {
 
    let adminController = AnalyticsAdminController()
    
    let logAdminController = AnalyticsLogAdminController()
    let logApiController = AnalyticsLogApiController()

    func adminRoutesHook(args: HookArguments) {
    
        logAdminController.setUpListRoutes(args.routes)
        logAdminController.setUpDetailRoutes(args.routes)

        args.routes.grouped("analytics").get("overview", use: adminController.overviewView)
        
        args.routes.get("analytics") { req -> Response in
            let template = AdminModulePageTemplate(.init(title: "Analytics", message: "module information", links: [
                .init(label: "Overview", path: "/admin/analytics/overview/"),
                .init(label: "Logs", path: "/admin/analytics/logs/"),
            ]))
            return req.templates.renderHtml(template)
        }
    }
    
    func apiRoutesHook(args: HookArguments) {
        logApiController.setUpListRoutes(args.routes)
        logApiController.setUpDetailRoutes(args.routes)
    }
}

