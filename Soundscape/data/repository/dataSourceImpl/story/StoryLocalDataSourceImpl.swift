//
//  StoryLocalDataSourceImpl.swift
//  Soundscape
//
//  Created by Aman Kumar on 21/03/24.
//

import Foundation

final class StoryLocalDataSourceImpl: StoryLocalDataSource {
    static let shared = StoryLocalDataSourceImpl()
    let storyDao: StoryDao
    
    init(storyDao: StoryDao = StoryDao.shared) {
        self.storyDao = storyDao
    }
    
    func getSavedStoryFromDB() async throws -> [AudioFetch] {
        return try storyDao.getAllStory()
    }
    
    func saveStoryToDB(audioFetch: AudioFetch) async throws -> () {
        return try storyDao.saveStory(audioFetch: audioFetch)
    }
    
    func deleteSavedStoryFromDB(audioFetch: AudioFetch) async throws -> () {
        return try storyDao.deleteStory(audioFetch: audioFetch)
    }
    
    func updateSavedStoryInDB(audioFetch: AudioFetch) async throws -> () {
        return try storyDao.updateStory(audioFetch: audioFetch)
    }
}
