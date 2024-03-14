//
//  GetSavedSongUseCase.swift
//  Soundscape
//
//  Created by Aman Kumar on 14/03/24.
//

import Foundation

final class GetSavedSongUseCase {
    static let shared = GetSavedSongUseCase()
    
    let songRepository: SongRepository
    
    init(songRepository: SongRepository = SongRepositoryImpl.shared) {
        self.songRepository = songRepository
    }
    
    func execute() async throws -> [AudioFetch] {
        return try await songRepository.getSavedSong()
    }
}
