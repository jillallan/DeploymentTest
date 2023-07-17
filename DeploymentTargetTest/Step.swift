//
//  Step.swift
//  DeploymentTargetTest
//
//  Created by Jill Allan on 16/07/2023.
//
//

import Foundation
import SwiftData

@Model final public class Step {
    var timestamp: Date
    var name: String
    var trip: Trip?
    
    init(timestamp: Date, name: String) {
        self.timestamp = timestamp
        self.name = name
    }
}
