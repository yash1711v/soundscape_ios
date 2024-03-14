//
//  SongRepository.swift
//  Soundscape
//
//  Created by admin on 13/03/24.
//

import Foundation

protocol SongRepository {
    // MARK: API calling functions
    func getSongSection(songSection: String) async throws -> [AudioFetch]
    
    // MARK: DB calling functions (crud)
    func getSavedSong() async throws -> [AudioFetch]
    func saveSong(audioFetch: AudioFetch) async throws -> ()
    func deleteSavedSong(audioFetch: AudioFetch) async throws -> ()
    func updateSavedSong(audioFetch: AudioFetch) async throws -> ()
}
