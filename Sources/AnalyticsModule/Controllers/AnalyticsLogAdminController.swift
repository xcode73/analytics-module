//
//  AnalyticsLogAdminController.swift
//  AnalyticsModule
//
//  Created by Tibor Bödecs on 2020. 11. 19..
//

import Fluent
import FeatherCore

struct AnalyticsLogAdminController: ListController, GetController {

    typealias Module = AnalyticsModule
    typealias Model = AnalyticsLogModel

    typealias ListApi = AnalyticsLogApi
    typealias GetApi = AnalyticsLogApi
    
    let dateFormatter = Application.dateFormatter()
    
    func listTable(_ models: [Model]) -> Table {
        Table(columns: ["path", "date", .init(id: "response_code", label: "Response code")], rows: models.map { model in
            TableRow(id: model.identifier, cells: [
                TableCell(model.path),
                TableCell(dateFormatter.string(from: model.date)),
                TableCell(model.responseCode),
            ])
        })
    }
    
    func detailFields(req: Request, model: Model) -> [DetailContext.Field] {
        [
            .init(label: "Id", value: model.identifier),
            .init(label: "Path", value: model.path),
            .init(label: "Date", value: dateFormatter.string(from: model.date)),
            .init(label: "Session", value: model.session ?? ""),
            .init(label: "Method", value: model.method),
            .init(label: "Headers", value: model.headers.debugDescription),
            .init(label: "IP", value: model.ip ?? ""),
            .init(label: "Origin", value: model.origin ?? ""),
            .init(label: "Referer", value: model.referer ?? ""),
            .init(label: "Language", value: model.language ?? ""),
            .init(label: "Region", value: model.region ?? ""),
            .init(label: "OS name", value: model.osName ?? ""),
            .init(label: "OS version", value: model.osVersion ?? ""),
            .init(label: "Browser name", value: model.browserName ?? ""),
            .init(label: "Browser version", value: model.browserVersion ?? ""),
            .init(label: "Engine name", value: model.engineName ?? ""),
            .init(label: "Engine version", value: model.engineVersion ?? ""),
            .init(label: "Device vendor", value: model.deviceVendor ?? ""),
            .init(label: "Device type", value: model.deviceType ?? ""),
            .init(label: "Device model", value: model.deviceModel ?? ""),
            .init(label: "CPU", value: model.cpu ?? ""),
            .init(label: "Response code", value: model.responseCode),
        ]
    }
}
