//
//  SongRepository.swift
//  Soundscape
//
//  Created by admin on 13/03/24.
//

import Foundation

protocol SongRepository {
    func getSongSection(songSection: String) async throws -> [AudioFetch]
}
