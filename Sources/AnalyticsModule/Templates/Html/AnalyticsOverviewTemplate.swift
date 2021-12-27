//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2021. 12. 26..
//

import SwiftHtml

struct AnalyticsOverviewTemplate: TemplateRepresentable {
    
    var context: AnalyticsOverviewContext
    
    init(_ context: AnalyticsOverviewContext) {
        self.context = context
    }
    
    @TagBuilder
    func render(_ req: Request) -> Tag {
        AdminIndexTemplate(.init(title: "")) {
            Div {
                Header {
                    H1("Analytics")
                    P("Overview")
                }
                .class("lead")
                
                Section {
                    Div {
                        Div {
                            Span {
//                                Img(src: "/img/svg/eye.svg", alt: "Total page views")
                            }
                            H2("\(context.totalPageViews) page views")
                            P("Total number of unique page views")
                                .class("note")
                        }
                        .class("content")
                    }
                    .class("card")
                    
                    for metric in context.metrics {
                        Div {
                            Div {
                                Span {
//                                    Img(src: "/img/svg/\(metric.icon).svg", alt: metric.name)
                                }
                                H2(metric.name)
                                
                                for group in metric.groups {
                                    Span {
                                        Span("")
                                    }
                                    .class("bar-chart")
                                    .style("width: \(group.percent)%")
                                    
                                    Div {
                                        Div {
                                            Text("\(group.count) &middot; \(group.name)")
                                        }
                                        Div {
                                            Text("\(group.percent)%")
                                        }
                                        .class("right")
                                    }
                                    .class("grid-2")
                                }
                                
                                P("\(metric.total) &middot; total")
                                    .class(["note", "center"])
                            }
                            .class("content")
                        }
                        .class("card")
                    }
                }
                
            }
            .id("analytics-overview")
            .class("container")
        }
        .render(req)
    }
}


  
                    
                
