//
//  UpdateStoryUseCase.swift
//  Soundscape
//
//  Created by Aman Kumar on 21/03/24.
//

import Foundation

final class UpdateStoryUseCase {
    static let shared = UpdateSongUseCase()
    
    let storyRepository: StoryRepository
    
    init(storyRepository: StoryRepository = StoryRepositoryImpl.shared) {
        self.storyRepository = storyRepository
    }
    
    func execute(audioFetch: AudioFetch) async throws -> () {
        return try await storyRepository.updateSavedStory(audioFetch: audioFetch)
    }
}
