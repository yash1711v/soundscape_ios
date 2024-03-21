//
//  SongRemoteDataSourceImpl.swift
//  Soundscape
//
//  Created by admin on 13/03/24.
//

import Foundation

final class SongRemoteDataSourceImpl: SongRemoteDataSource {
    static let shared = SongRemoteDataSourceImpl()
    
    func getSongSection(songSection: String) async throws -> [AudioFetch] {
        return try await SoundscapeAPIService.shared.getSongSection(songSection: songSection)
    }
    
    func getAllSong() async throws -> [AudioFetch] {
        return try await SoundscapeAPIService.shared.getAllSong()
    }
    
}
