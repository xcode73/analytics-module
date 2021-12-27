//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2021. 12. 26..
//

import SwiftHtml

struct AnalyticsAdminWidgetTemplate: TemplateRepresentable {
    
    @TagBuilder
    func render(_ req: Request) -> Tag {
        H2("Analytics")
        Ul {
            Li {
                A("Overview")
                    .href("/admin/analytics/overview/")
            }
            if req.checkPermission(Analytics.Log.permission(for: .list)) {
                Li {
                    A("Logs")
                        .href("/admin/analytics/logs/")
                }
            }
        }
    }
}
