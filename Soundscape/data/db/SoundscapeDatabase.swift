//
//  SoundscapeDatabase.swift
//  Soundscape
//
//  Created by Aman Kumar on 14/03/24.
//

import Foundation
import CoreData

final class SoundscapeDatabase {
    static let shared = SoundscapeDatabase()
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "Soundscape") // MARK: db name
        container.loadPersistentStores { description, error in
            if error != nil {
                fatalError("Cannot Load Core Data Model")
            }
        }
    }
    
    func saveContext() throws {
        let context = container.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("DEBUG: Database error \(error.localizedDescription)")
                throw DBError.dataSourceError
            }
        }
    }
    
    func deleteDatabase() async throws {
        guard let storeURL = container.persistentStoreDescriptions.first?.url else {
            return
        }
        do {
            try container.persistentStoreCoordinator.destroyPersistentStore(at: storeURL, ofType: NSSQLiteStoreType, options: nil)
            try container.persistentStoreCoordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
        } catch {
            // Handle error
            print("Error deleting database: \(error.localizedDescription)")
            throw DBError.dataSourceError
        }
    }
}
