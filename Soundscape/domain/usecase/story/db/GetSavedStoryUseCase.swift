//
//  GetSavedStoryUseCase.swift
//  Soundscape
//
//  Created by Aman Kumar on 21/03/24.
//

import Foundation

final class GetSavedStoryUseCase {
    static let shared = GetSavedStoryUseCase()
    
    let storyRepository: StoryRepository
    
    init(storyRepository: StoryRepository = StoryRepositoryImpl.shared) {
        self.storyRepository = storyRepository
    }
    
    func execute() async throws -> [AudioFetch] {
        return try await storyRepository.getSavedStory()
    }
}
