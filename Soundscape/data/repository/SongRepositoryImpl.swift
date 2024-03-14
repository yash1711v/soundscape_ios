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
    let songLocalDataSource: SongLocalDataSource
    
    init(songRemoteDataSource: SongRemoteDataSource = SongRemoteDataSourceImpl.shared,
         songLocalDataSource: SongLocalDataSource = SongLocalDataSourceImpl.shared) {
        self.songRemoteDataSource = songRemoteDataSource
        self.songLocalDataSource = songLocalDataSource
    }
    
    // MARK: API calling functions
    func getSongSection(songSection: String) async throws -> [AudioFetch] {
        return try await songRemoteDataSource.getSongSection(songSection: songSection)
    }
    
    // MARK: DB calling functions (crud)
    func getSavedSong() async throws -> [AudioFetch] {
        return try await songLocalDataSource.getSavedSongFromDB()
    }
    
    func saveSong(audioFetch: AudioFetch) async throws -> () {
        return try await songLocalDataSource.saveSongToDB(audioFetch: audioFetch)
    }
    
    func deleteSavedSong(audioFetch: AudioFetch) async throws -> () {
        return try await songLocalDataSource.deleteSavedSongFromDB(audioFetch: audioFetch)
    }
    
    func updateSavedSong(audioFetch: AudioFetch) async throws -> () {
        return try await songLocalDataSource.updateSavedSongInDB(audioFetch: audioFetch)
    }
}
