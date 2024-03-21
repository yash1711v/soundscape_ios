//
//  StoryFirebaseDataSource.swift
//  Soundscape
//
//  Created by Aman Kumar on 21/03/24.
//

import Foundation

protocol StoryFirebaseDataSource {
    // MARK: DB calling functions (crud)
    func getSavedStoryFromFb() async throws -> [AudioFetch]
    func saveStoryToFb(audioFetch: AudioFetch) async throws -> Bool
    func deleteSavedStoryFromFb(audioFetch: AudioFetch) async throws -> Bool
}
