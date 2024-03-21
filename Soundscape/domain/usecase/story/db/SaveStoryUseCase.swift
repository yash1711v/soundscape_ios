//
//  SaveStoryUseCase.swift
//  Soundscape
//
//  Created by Aman Kumar on 21/03/24.
//

import Foundation

final class SaveStoryUseCase {
    static let shared = SaveSongUseCase()
    
    let storyRepository: StoryRepository
    
    init(storyRepository: StoryRepository = StoryRepositoryImpl.shared) {
        self.storyRepository = storyRepository
    }
    
    func execute(audioFetch: AudioFetch) async throws -> () {
        return try await storyRepository.saveStory(audioFetch: audioFetch)
    }
}
