//
//  AnalyticsLogAdminController.swift
//  AnalyticsModule
//
//  Created by Tibor Bödecs on 2020. 11. 19..
//

import Fluent
import FeatherCore

struct AnalyticsLogAdminController: ListViewController, GetViewController {    
    typealias Module = AnalyticsModule
    typealias Model = AnalyticsLogModel

    var getView: String { "\(Module.name.capitalized)/Admin/\(Model.name.capitalized)/View" }
    var listView: String { "\(Module.name.capitalized)/Admin/\(Model.name.capitalized)/List" }

    var listAllowedOrders: [FieldKey] = [
        Model.FieldKeys.date,
        Model.FieldKeys.path,
    ]

    var listDefaultSort: ListSort { .desc }

    func listQuery(search: String, queryBuilder: QueryBuilder<AnalyticsLogModel>, req: Request) {
        queryBuilder.filter(\.$path ~~ search)
    }
}
