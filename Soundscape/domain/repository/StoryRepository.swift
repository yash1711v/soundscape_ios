//
//  StoryRepository.swift
//  Soundscape
//
//  Created by Aman Kumar on 21/03/24.
//

import Foundation

protocol StoryRepository {
    // MARK: DB calling functions (crud)
    func getSavedStory() async throws -> [AudioFetch]
    func saveStory(audioFetch: AudioFetch) async throws -> ()
    func deleteSavedStory(audioFetch: AudioFetch) async throws -> ()
    func updateSavedStory(audioFetch: AudioFetch) async throws -> ()
}
