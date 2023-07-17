//
//  DeploymentTargetTestCoreDataApp.swift
//  DeploymentTargetTestCoreData
//
//  Created by Jill Allan on 17/07/2023.
//

import OSLog
import SwiftUI

@main
struct DeploymentTargetTestCoreDataApp: App {
    
    private let logger = Logger(
        subsystem: Bundle.main.bundleIdentifier!,
        category: String(describing: DeploymentTargetTestCoreDataApp.self)
    )
    
    @StateObject var dataController = CoreDataController()

    var body: some Scene {
        let _ = logger.debug("core data url string: \(dataController.container.persistentStoreDescriptions.first?.url?.absoluteString ?? "No url")")
        
        WindowGroup {
            ContentView()
                .environmentObject(dataController)
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
