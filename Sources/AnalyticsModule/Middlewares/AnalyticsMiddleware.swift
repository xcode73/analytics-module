//
//  AnalyticsMiddleware.swift
//  AnalyticsModule
//
//  Created by Tibor Bodecs on 2020. 11. 19..
//

import FeatherCore
import UAParserSwift
import ALanguageParser

struct AnalyticsMiddleware: Middleware {

    func respond(to req: Request, chainingTo next: Responder) -> EventLoopFuture<Response> {
        /// NOTE: frontend middlewares are enabled for install paths as well, so we have to skip those...
        guard !req.url.path.hasPrefix("/install/") else {
            return next.respond(to: req)
        }
        return next.respond(to: req).flatMap { response in
            let referer = req.headers.first(name: "referer")
            let origin = req.headers.first(name: "origin")
            let ip = req.headers.first(name: "X-Forwarded-For")
            let userAgent = req.headers.first(name: "user-agent") ?? ""
            let acceptLanguage = req.headers.first(name: "accept-language") ?? ""
            let ua = UAParser(agent: userAgent)
            let al = ALanguageParser.parse(acceptLanguage).first

            var headers: [String: String] = [:]
            for header in req.headers {
                headers[header.name] = header.value
            }
            /// NOTE: we should get the IP as well
            let log = AnalyticsLogModel(session: req.session.id?.string,
                                        method: req.method.rawValue,
                                        url: req.url.string,
                                        headers: headers,
                                        ip: ip,
                                        path: req.url.path,
                                        referer: referer,
                                        origin: origin,
                                        language: al?.code,
                                        region: al?.region,
                                        osName: ua.os?.name,
                                        osVersion: ua.os?.version,
                                        browserName: ua.browser?.name,
                                        browserVersion: ua.browser?.version,
                                        engineName: ua.engine?.name,
                                        engineVersion: ua.engine?.version,
                                        deviceVendor: ua.device?.vendor,
                                        deviceType: ua.device?.type,
                                        deviceModel: ua.device?.model,
                                        cpu: ua.cpu?.identifier,
                                        responseCode: String(response.status.code))
            return log.create(on: req.db).map { response }
        }
    }
}
