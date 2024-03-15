//
//  SongDao.swift
//  Soundscape
//
//  Created by Aman Kumar on 14/03/24.
//

import Foundation

final class SongDao {
    static let shared = SongDao()
    
    let soundscapeDatabase: SoundscapeDatabase
    
    init(soundscapeDatabase: SoundscapeDatabase = SoundscapeDatabase()) {
        self.soundscapeDatabase = soundscapeDatabase
    }
    
    private func getEntityById(_ id: Int64)  throws  -> AudioFetchEntity?{
        let request = AudioFetchEntity.fetchRequest()
        request.fetchLimit = 1
        request.predicate = NSPredicate(
            format: "id == %lld", id)
        do {
            let context = soundscapeDatabase.container.viewContext
            let audioFetchEntities = try context.fetch(request)
            return audioFetchEntities.first
        } catch {
            throw error
        }
    }
    
    func saveSong(audioFetch: AudioFetch) throws -> () {
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
            let audioFetchEntity = AudioFetchEntity(context: soundscapeDatabase.container.viewContext)
            audioFetchEntity.id = audioFetch.id
            audioFetchEntity.name = audioFetch.name
            audioFetchEntity.assetPath = audioFetch.assetPath
            audioFetchEntity.image = audioFetch.image
            audioFetchEntity.type = audioFetch.type
            audioFetchEntity.isLiked = audioFetch.isLiked ?? false
        }
        soundscapeDatabase.saveContext()
    }
    
    func getAllSong() throws -> [AudioFetch] {
        let request = AudioFetchEntity.fetchRequest()
        return try soundscapeDatabase.container.viewContext.fetch(request).map({ audioFetchEntity in
            AudioFetch(id: audioFetchEntity.id,
                       name: audioFetchEntity.name!,
                       assetPath: audioFetchEntity.assetPath!,
                       image: audioFetchEntity.image!,
                       type: audioFetchEntity.type!,
                       isLiked: audioFetchEntity.isLiked)
        })
    }
    
    func deleteSong(audioFetch: AudioFetch) throws -> () {
        let audioFetchEntity = try getEntityById(audioFetch.id)!
        let context = soundscapeDatabase.container.viewContext
        context.delete(audioFetchEntity)
        do {
            try context.save()
        } catch {
            context.rollback()
            fatalError("Error: \(error.localizedDescription)")
        }
    }
    
    func updateSong(audioFetch: AudioFetch) throws -> () {
        let audioFetchEntity = try getEntityById(audioFetch.id)!
        audioFetchEntity.assetPath = audioFetch.assetPath
        audioFetchEntity.image = audioFetch.image
        audioFetchEntity.type = audioFetch.type
        soundscapeDatabase.saveContext()
    }
}
