//
//  GetAllSongFetchUseCase.swift
//  Soundscape
//
//  Created by Aman Kumar on 21/03/24.
//

import Foundation

final class GetAllSongFetchUseCase {
    static let shared = GetAllSongFetchUseCase()
    
    let songRepository: SongRepository
    
    init(songRepository: SongRepository = SongRepositoryImpl.shared) {
        self.songRepository = songRepository
    }
    
    func execute() async throws -> [AudioFetch] {
        return try await songRepository.getAllSong()
    }
}
