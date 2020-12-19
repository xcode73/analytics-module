//
//  AnalyticsModule+Install.swift
//  AnalyticsModule
//
//  Created by Tibor Bodecs on 2020. 12. 19..
//

import FeatherCore

extension AnalyticsModule {

    func userPermissionInstallHook(args: HookArguments) -> [[String: Any]] {
        AnalyticsModule.permissions +
        [
            [
                "module": Self.name.lowercased(),
                "context": AnalyticsLogModel.name.lowercased(),
                "action": "list",
                "name": "List analytics logs",
            ]
        ]
        //AnalyticsLogModel.permissions
    }
}
