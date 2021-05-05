//
//  File.swift
//  AnalyticsModule
//
//  Created by Tibor Bodecs on 2020. 08. 23..
//

import FeatherTest
import AnalyticsApi
@testable import AnalyticsModule


final class AnalyticsModuleTests: FeatherTestCase {
    
    override class func testModules() -> [FeatherModule] {
        [AnalyticsModule()]
    }
}
