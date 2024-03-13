//
//  SongRepositoryImpl.swift
//  Soundscape
//
//  Created by admin on 13/03/24.
//

import Foundation

final class SongRepositoryImpl: SongRepository {
    static let shared = SongRepositoryImpl()
    
    let songRemoteDataSource: SongRemoteDataSource
    
    init(songRemoteDataSource: SongRemoteDataSource = SongRemoteDataSourceImpl.shared) {
        self.songRemoteDataSource = songRemoteDataSource
    }
    
    func getSongSection(songSection: String) async throws -> [AudioFetch] {
        return try await songRemoteDataSource.getSongSection(songSection: songSection)
    }
}
