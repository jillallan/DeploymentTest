//
//  dataController.swift
//  DeploymentTargetTest
//
//  Created by Jill Allan on 16/07/2023.
//

import CoreData
import Foundation

class CoreDataController: ObservableObject {

    let container: NSPersistentCloudKitContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentCloudKitContainer(name: "Main")
        
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(filePath: "/dev/null")
            
        } else {
            let appGroupID = "group.com.jillallan.DeploymentTargetTest"
            
            guard let appGroupContainer = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: appGroupID) else {
                fatalError("Shared file container could not be created.")
            }
            
            let url = appGroupContainer.appending(path: "Main.sqlite")
            container.persistentStoreDescriptions.first?.url = url
        }
        
        container.loadPersistentStores { storeDescription, error in
            if let error {
                fatalError("Fatal error loading store: \(error.localizedDescription)")
            }
        }
    }
}
