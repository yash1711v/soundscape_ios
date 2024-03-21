//
//  StoryRepositoryImpl.swift
//  Soundscape
//
//  Created by Aman Kumar on 21/03/24.
//

import Foundation
import Firebase

final class StoryRepositoryImpl: StoryRepository {
    static let shared = StoryRepositoryImpl()
    
    let storyLocalDataSource: StoryLocalDataSource
    let storyFirebaseDataSource: StoryFirebaseDataSource
    
    init(storyLocalDataSource: StoryLocalDataSource = StoryLocalDataSourceImpl.shared,
         storyFirebaseDataSource: StoryFirebaseDataSource = StoryFirebaseDataSourceImpl.shared) {
        self.storyLocalDataSource = storyLocalDataSource
        self.storyFirebaseDataSource = storyFirebaseDataSource
    }
    

    func getSavedStory() async throws -> [AudioFetch] {
        let uid = Auth.auth().currentUser?.uid
        if uid == nil {
            return try await storyLocalDataSource.getSavedStoryFromDB()
        } else {
            do {
                // Retrieve saved songs from local database
                let savedStoryFromLocalDB = try await storyLocalDataSource.getSavedStoryFromDB()
                
                if savedStoryFromLocalDB.isEmpty {
                    // Local database is empty, populate it from Firebase
                    let savedStoryFromFirebase = try await storyFirebaseDataSource.getSavedStoryFromFb()
                    // Populate the local database with songs from Firebase
                    for story in savedStoryFromFirebase {
                        try await storyLocalDataSource.saveStoryToDB(audioFetch: story)
                    }
                    // Return saved songs from firebase database as its already fetched
                    return savedStoryFromFirebase
                } else {
                    // Local database is not empty, return saved songs from local database
                    return savedStoryFromLocalDB
                }
            } catch {
                throw error
            }
        }
    }
    
    func saveStory(audioFetch: AudioFetch) async throws {
        let uid = Auth.auth().currentUser?.uid
        if uid == nil {
            return try await storyLocalDataSource.saveStoryToDB(audioFetch: audioFetch)
        } else {
            do {
                let fbSave = try await storyFirebaseDataSource.saveStoryToFb(audioFetch: audioFetch)
                if fbSave {
                    try await storyLocalDataSource.saveStoryToDB(audioFetch: audioFetch)
                }
            } catch {
                throw error
            }
        }
    }
    
    func deleteSavedStory(audioFetch: AudioFetch) async throws {
        let uid = Auth.auth().currentUser?.uid
        if uid == nil {
            return try await storyLocalDataSource.deleteSavedStoryFromDB(audioFetch: audioFetch)
        } else {
            do {
                let fbDelete = try await storyFirebaseDataSource.deleteSavedStoryFromFb(audioFetch: audioFetch)
                if fbDelete {
                    try await storyLocalDataSource.deleteSavedStoryFromDB(audioFetch: audioFetch)
                }
            } catch {
                throw error
            }
        }
    }
    
    func updateSavedStory(audioFetch: AudioFetch) async throws {
        let uid = Auth.auth().currentUser?.uid
        if uid == nil {
            return try await storyLocalDataSource.updateSavedStoryInDB(audioFetch: audioFetch)
        } else {
            do {
                let fbUpdate = try await storyFirebaseDataSource.saveStoryToFb(audioFetch: audioFetch)
                if fbUpdate {
                    try await storyLocalDataSource.updateSavedStoryInDB(audioFetch: audioFetch)
                }
            } catch {
                throw error
            }
        }
    }
    
}

