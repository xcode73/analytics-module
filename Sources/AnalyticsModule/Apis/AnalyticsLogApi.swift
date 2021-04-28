//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2021. 04. 28..
//

import AnalyticsModuleApi
import FeatherCore

extension LogListObject: Content {}
extension LogGetObject: Content {}


struct AnalyticsLogApi: ListApiRepresentable, GetApiRepresentable {
    typealias Model = AnalyticsLogModel

    typealias ListObject = LogListObject
    typealias GetObject = LogGetObject
        
    func mapList(model: Model) -> ListObject {
        .init(id: model.id!)
    }
    
    func mapGet(model: Model) -> GetObject {
        .init(id: model.id!)
    }
}

