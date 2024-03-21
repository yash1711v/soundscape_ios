//
//  StoryDao.swift
//  Soundscape
//
//  Created by Aman Kumar on 21/03/24.
//

import Foundation

final class StoryDao {
    static let shared = StoryDao()
    
    let soundscapeDatabase: SoundscapeDatabase
    
    init(soundscapeDatabase: SoundscapeDatabase = SoundscapeDatabase.shared) {
        self.soundscapeDatabase = soundscapeDatabase
    }
    
    private func getEntityById(_ id: Int64)  throws  -> StoryFetchEntity?{
        let request = StoryFetchEntity.fetchRequest()
        request.fetchLimit = 1
        request.predicate = NSPredicate(
            format: "id == %lld", id)
        do {
            let context = soundscapeDatabase.container.viewContext
            let storyFetchEntities = try context.fetch(request)
            return storyFetchEntities.first
        } catch {
            throw error
        }
    }
    
    func saveStory(audioFetch: AudioFetch) throws -> () {
        // Check if an entity with the same ID already exists
        if let existingEntity = try getEntityById(audioFetch.id) {
            // Update existing entity with new data
            existingEntity.name = audioFetch.name
            existingEntity.assetPath = audioFetch.assetPath
            existingEntity.image = audioFetch.image
            existingEntity.type = audioFetch.type
            existingEntity.isLiked = audioFetch.isLiked ?? false
        } else {
            // Create a new entity
            let storyFetchEntity = StoryFetchEntity(context: soundscapeDatabase.container.viewContext)
            storyFetchEntity.id = audioFetch.id
            storyFetchEntity.name = audioFetch.name
            storyFetchEntity.assetPath = audioFetch.assetPath
            storyFetchEntity.image = audioFetch.image
            storyFetchEntity.type = audioFetch.type
            storyFetchEntity.isLiked = audioFetch.isLiked ?? false
        }
        try soundscapeDatabase.saveContext()
    }
    
    func getAllStory() throws -> [AudioFetch] {
        let request = StoryFetchEntity.fetchRequest()
        return try soundscapeDatabase.container.viewContext.fetch(request).map({ storyFetchEntity in
            AudioFetch(id: storyFetchEntity.id,
                       name: storyFetchEntity.name!,
                       assetPath: storyFetchEntity.assetPath!,
                       image: storyFetchEntity.image!,
                       type: storyFetchEntity.type!,
                       isLiked: storyFetchEntity.isLiked)
        })
    }
    
    func deleteStory(audioFetch: AudioFetch) throws -> () {
        guard let storyFetchEntity = try getEntityById(audioFetch.id) else {
            throw DBError.deleteError
        }
        let context = soundscapeDatabase.container.viewContext
        context.delete(storyFetchEntity)
        do {
            try context.save()
        } catch {
            context.rollback()
            fatalError("Error: \(error.localizedDescription)")
        }
    }
    
    func updateStory(audioFetch: AudioFetch) throws -> () {
        let storyFetchEntity = try getEntityById(audioFetch.id)!
        storyFetchEntity.assetPath = audioFetch.assetPath
        storyFetchEntity.image = audioFetch.image
        storyFetchEntity.type = audioFetch.type
        try soundscapeDatabase.saveContext()
    }
}
