//
//  DeleteStoryUseCase.swift
//  Soundscape
//
//  Created by Aman Kumar on 21/03/24.
//

import Foundation

final class DeleteStoryUseCase {
    static let shared = DeleteSongUseCase()
    
    let storyRepository: StoryRepository
    
    init(storyRepository: StoryRepository = StoryRepositoryImpl.shared) {
        self.storyRepository = storyRepository
    }
    
    func execute(audioFetch: AudioFetch) async throws -> () {
        return try await storyRepository.deleteSavedStory(audioFetch: audioFetch)
    }
}
