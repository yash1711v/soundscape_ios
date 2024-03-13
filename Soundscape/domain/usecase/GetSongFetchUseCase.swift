//
//  GetSongFetchUseCase.swift
//  Soundscape
//
//  Created by admin on 13/03/24.
//

import Foundation

final class GetSongFetchUseCase {
    static let shared = GetSongFetchUseCase()
    
    let songRepository: SongRepository
    
    init(songRepository: SongRepository = SongRepositoryImpl.shared) {
        self.songRepository = songRepository
    }
    
    func execute(songSection: String) async throws -> [AudioFetch] {
        return try await songRepository.getSongSection(songSection: songSection)
    }
}
