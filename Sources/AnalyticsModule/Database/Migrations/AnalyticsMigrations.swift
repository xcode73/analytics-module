//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2021. 12. 26..
//

struct AnalyticsMigrations {

    struct v1: AsyncMigration {

        func prepare(on db: Database) async throws {
            try await db.schema(AnalyticsLogModel.schema)
                .id()
                .field(AnalyticsLogModel.FieldKeys.v1.date, .date, .required)
                .field(AnalyticsLogModel.FieldKeys.v1.session, .string)
                .field(AnalyticsLogModel.FieldKeys.v1.method, .string, .required)
                .field(AnalyticsLogModel.FieldKeys.v1.url, .string, .required)
                .field(AnalyticsLogModel.FieldKeys.v1.headers, .json, .required)
                .field(AnalyticsLogModel.FieldKeys.v1.ip, .string)
                .field(AnalyticsLogModel.FieldKeys.v1.path, .string, .required)
                .field(AnalyticsLogModel.FieldKeys.v1.referer, .string)
                .field(AnalyticsLogModel.FieldKeys.v1.origin, .string)
                .field(AnalyticsLogModel.FieldKeys.v1.language, .string)
                .field(AnalyticsLogModel.FieldKeys.v1.region, .string)
                .field(AnalyticsLogModel.FieldKeys.v1.osName, .string)
                .field(AnalyticsLogModel.FieldKeys.v1.osVersion, .string)
                .field(AnalyticsLogModel.FieldKeys.v1.browserName, .string)
                .field(AnalyticsLogModel.FieldKeys.v1.browserVersion, .string)
                .field(AnalyticsLogModel.FieldKeys.v1.engineName, .string)
                .field(AnalyticsLogModel.FieldKeys.v1.engineVersion, .string)
                .field(AnalyticsLogModel.FieldKeys.v1.deviceVendor, .string)
                .field(AnalyticsLogModel.FieldKeys.v1.deviceType, .string)
                .field(AnalyticsLogModel.FieldKeys.v1.deviceModel, .string)
                .field(AnalyticsLogModel.FieldKeys.v1.cpu, .string)
                .field(AnalyticsLogModel.FieldKeys.v1.responseCode, .string, .required)
                .create()
        }
        
        func revert(on db: Database) async throws {
            try await db.schema(AnalyticsLogModel.schema).delete()
        }
    }
}
