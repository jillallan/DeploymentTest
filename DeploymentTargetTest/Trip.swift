//
//  Trip.swift
//  DeploymentTargetTest
//
//  Created by Jill Allan on 16/07/2023.
//
//

import Foundation
import SwiftData

@Model final public class Trip {
    var name: String
    var startDate: Date
    var endDate: Date
    var steps: [Step]?

    init(name: String, startDate: Date, endDate: Date) {
        self.name = name
        self.startDate = startDate
        self.endDate = endDate
    }
}
