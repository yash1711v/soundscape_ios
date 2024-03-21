//
//  StoryLocalDataSource.swift
//  Soundscape
//
//  Created by Aman Kumar on 21/03/24.
//

import Foundation

protocol StoryLocalDataSource {
    // MARK: DB calling functions (crud)
    func getSavedStoryFromDB() async throws -> [AudioFetch]
    func saveStoryToDB(audioFetch: AudioFetch) async throws -> ()
    func deleteSavedStoryFromDB(audioFetch: AudioFetch) async throws -> ()
    func updateSavedStoryInDB(audioFetch: AudioFetch) async throws -> ()
}
