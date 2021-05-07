//
//  AnalyticsRouter.swift
//  AnalyticsModule
//
//  Created by Tibor Bödecs on 2020. 11. 19..
//

import FeatherCore

struct AnalyticsRouter: FeatherRouter {

    let adminController = AnalyticsAdminController()
    let logController = AnalyticsLogAdminController()
    
    func adminRoutesHook(args: HookArguments) {
        let adminRoutes = args.routes
        
        adminRoutes.get("analytics", use: SystemAdminMenuController(key: "analytics").moduleView)
        
        let moduleRoutes = adminRoutes.grouped(AnalyticsModule.moduleKeyPathComponent)
        
        let logRoutes = moduleRoutes.grouped(AnalyticsLogModel.modelKeyPathComponent)
        logController.setupListRoute(on: logRoutes)
        logController.setupGetRoute(on: logRoutes)

        moduleRoutes.get("overview", use: adminController.overviewView)
    }
    
    func apiAdminRoutesHook(args: HookArguments) {
        let apiRoutes = args.routes

        let moduleRoutes = apiRoutes.grouped(AnalyticsModule.moduleKeyPathComponent)
        
        let logRoutes = moduleRoutes.grouped(AnalyticsLogModel.modelKeyPathComponent)
        logController.setupListApiRoute(on: logRoutes)
        logController.setupGetApiRoute(on: logRoutes)
    }

}
