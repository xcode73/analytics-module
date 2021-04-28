//
//  AnalyticsRouter.swift
//  AnalyticsModule
//
//  Created by Tibor Bödecs on 2020. 11. 19..
//

import FeatherCore

struct AnalyticsRouter: RouteCollection {

//    let adminOverview = AnalyticsOverviewAdminController()
//    let adminLog = AnalyticsLogAdminController()

    func boot(routes: RoutesBuilder) throws {
        
    }
    
    func adminRoutesHook(args: HookArguments) {
        let routes = args.routes
        
//        let modulePath = routes.grouped(AnalyticsModule.pathComponent)
//        let logs = modulePath.grouped(AnalyticsLogModel.pathComponent)
//        adminLog.setupListRoute(on: logs)
//        adminLog.setupGetRoute(on: logs)
        
//        modulePath.get("overview", use: adminOverview.overviewView)
    }

}
