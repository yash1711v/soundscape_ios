//
//  SongRepositoryImpl.swift
//  Soundscape
//
//  Created by admin on 13/03/24.
//

import Foundation
import Firebase

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
        let uid = Auth.auth().currentUser?.uid
        if uid == nil {
            return try await songLocalDataSource.getSavedSongFromDB()
        } else {
            do {
                // Retrieve saved songs from local database
                let savedSongsFromLocalDB = try await songLocalDataSource.getSavedSongFromDB()
                
                if savedSongsFromLocalDB.isEmpty {
                    // Local database is empty, populate it from Firebase
                    let savedSongsFromFirebase = try await songFirebaseDataSource.getSavedSongFromFb()
                    // Populate the local database with songs from Firebase
                    for song in savedSongsFromFirebase {
                        try await songLocalDataSource.saveSongToDB(audioFetch: song)
                    }
                    // Return saved songs from firebase database as its already fetched
                    return savedSongsFromFirebase
                } else {
                    // Local database is not empty, return saved songs from local database
                    return savedSongsFromLocalDB
                }
            } catch {
                throw error
            }
        }
    }
    
    func saveSong(audioFetch: AudioFetch) async throws -> () {
        let uid = Auth.auth().currentUser?.uid
        if uid == nil {
            return try await songLocalDataSource.saveSongToDB(audioFetch: audioFetch)
        } else {
            do {
                let fbSave = try await songFirebaseDataSource.saveSongToFb(audioFetch: audioFetch)
                if fbSave {
                    try await songLocalDataSource.saveSongToDB(audioFetch: audioFetch)
                }
            } catch {
                throw error
            }
        }
    }
    
    func deleteSavedSong(audioFetch: AudioFetch) async throws -> () {
        let uid = Auth.auth().currentUser?.uid
        if uid == nil {
            return try await songLocalDataSource.deleteSavedSongFromDB(audioFetch: audioFetch)
        } else {
            do {
                let fbDelete = try await songFirebaseDataSource.deleteSavedSongFromFb(audioFetch: audioFetch)
                if fbDelete {
                    try await songLocalDataSource.deleteSavedSongFromDB(audioFetch: audioFetch)
                }
            } catch {
                throw error
            }
        }
    }
    
    func updateSavedSong(audioFetch: AudioFetch) async throws -> () {
        let uid = Auth.auth().currentUser?.uid
        if uid == nil {
            return try await songLocalDataSource.updateSavedSongInDB(audioFetch: audioFetch)
        } else {
            do {
                let fbUpdate = try await songFirebaseDataSource.saveSongToFb(audioFetch: audioFetch)
                if fbUpdate {
                    try await songLocalDataSource.updateSavedSongInDB(audioFetch: audioFetch)
                }
            } catch {
                throw error
            }
        }
    }
}
