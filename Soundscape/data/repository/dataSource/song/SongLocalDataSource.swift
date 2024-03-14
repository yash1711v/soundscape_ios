//
//  SongLocalDataSource.swift
//  Soundscape
//
//  Created by Aman Kumar on 14/03/24.
//

import Foundation

protocol SongLocalDataSource {
    // MARK: DB calling functions (crud)
    func getSavedSongFromDB() async throws -> [AudioFetch]
    func saveSongToDB(audioFetch: AudioFetch) async throws -> ()
    func deleteSavedSongFromDB(audioFetch: AudioFetch) async throws -> ()
    func updateSavedSongInDB(audioFetch: AudioFetch) async throws -> ()
}
