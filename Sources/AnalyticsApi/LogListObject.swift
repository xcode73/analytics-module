//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2021. 04. 28..
//

import Foundation

public struct LogListObject: Codable {

    public var id: UUID
    
    public init(id: UUID) {
        self.id = id
    }

}
