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
    
    func saveContext() {
        let context = container.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
}
