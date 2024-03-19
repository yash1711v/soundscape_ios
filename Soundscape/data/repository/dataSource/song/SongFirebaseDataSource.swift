//
//  SongFirebaseDataSource.swift
//  Soundscape
//
//  Created by admin on 18/03/24.
//

import Foundation

protocol SongFirebaseDataSource {
    // MARK: DB calling functions (crud)
    func getSavedSongFromFb() async throws -> [AudioFetch]
    func saveSongToFb(audioFetch: AudioFetch) async throws -> Bool
    func deleteSavedSongFromFb(audioFetch: AudioFetch) async throws -> Bool
}
