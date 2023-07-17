//
//  SwiftDataController.swift
//  DeploymentTargetTest
//
//  Created by Jill Allan on 17/07/2023.
//

import Foundation
import SwiftData

struct SwiftDataController {

    var container: ModelContainer
    
    init(inMemory: Bool = false) {
        let appGroupID = "group.com.jillallan.DeploymentTargetTest"
        
        if inMemory {
            let configuration = ModelConfiguration(inMemory: false, sharedAppContainerIdentifier: appGroupID)
            container = try! ModelContainer(for: [Trip.self], configuration)
            
//            SamplePersistanceStore.createData(modelContext: container.mainContext)
        } else {
            guard let appGroupContainer = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: appGroupID) else {
                fatalError("Shared file container could not be created.")
            }
            
            let url = appGroupContainer.appending(path: "Main.sqlite")
            
            do {
                container = try ModelContainer(for: [Trip.self], ModelConfiguration(url: url))
            } catch {
                fatalError("Shared file container could not be created.")
            }
        }
    }
}
