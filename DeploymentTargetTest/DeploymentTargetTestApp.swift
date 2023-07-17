//
//  DeploymentTargetTestApp.swift
//  DeploymentTargetTest
//
//  Created by Jill Allan on 11/07/2023.
//

import OSLog
import SwiftData
import SwiftUI


@main
struct DeploymentTargetTestApp: App {
    
    private let logger = Logger(
        subsystem: Bundle.main.bundleIdentifier!,
        category: String(describing: DeploymentTargetTestApp.self)
    )
    
    var swiftDataController = SwiftDataController()
    
    var body: some Scene {
        let _ = logger.debug("swift data url string: \(swiftDataController.container.configurations.first?.url.absoluteString ?? "No url")")

        WindowGroup {
            ContentView()
        }
    }
}
