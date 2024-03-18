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
    let songFirebaseDataSource: SongFirebaseDataSource
    
    init(songRemoteDataSource: SongRemoteDataSource = SongRemoteDataSourceImpl.shared,
         songLocalDataSource: SongLocalDataSource = SongLocalDataSourceImpl.shared,
         songFirebaseDataSource: SongFirebaseDataSource = SongFirebaseDataSourceImpl.shared) {
        self.songRemoteDataSource = songRemoteDataSource
        self.songLocalDataSource = songLocalDataSource
        self.songFirebaseDataSource = songFirebaseDataSource
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
        do {
            
                try await songLocalDataSource.saveSongToDB(audioFetch: audioFetch)
            
        } catch {
            throw error
        }
    }
    
    func deleteSavedSong(audioFetch: AudioFetch) async throws -> () {
        return try await songLocalDataSource.deleteSavedSongFromDB(audioFetch: audioFetch)
    }
    
    func updateSavedSong(audioFetch: AudioFetch) async throws -> () {
        return try await songLocalDataSource.updateSavedSongInDB(audioFetch: audioFetch)
    }
}
