//
//  UpdateSongUseCase.swift
//  Soundscape
//
//  Created by Aman Kumar on 14/03/24.
//

import Foundation

final class UpdateSongUseCase {
    static let shared = UpdateSongUseCase()
    
    let songRepository: SongRepository
    
    init(songRepository: SongRepository = SongRepositoryImpl.shared) {
        self.songRepository = songRepository
    }
    
    func execute(audioFetch: AudioFetch) async throws -> () {
        return try await songRepository.updateSavedSong(audioFetch: audioFetch)
    }
}
