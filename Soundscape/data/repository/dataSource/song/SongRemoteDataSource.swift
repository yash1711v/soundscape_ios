//
//  SongRemoteDataSource.swift
//  Soundscape
//
//  Created by admin on 13/03/24.
//

import Foundation

protocol SongRemoteDataSource {
    // MARK: API calling functions
    func getSongSection(songSection: String) async throws -> [AudioFetch]
}
