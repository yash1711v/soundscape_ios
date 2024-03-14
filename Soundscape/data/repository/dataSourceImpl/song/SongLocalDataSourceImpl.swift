//
//  SongLocalDataSourceImpl.swift
//  Soundscape
//
//  Created by Aman Kumar on 14/03/24.
//

import Foundation

final class SongLocalDataSourceImpl: SongLocalDataSource {
    static let shared = SongLocalDataSourceImpl()
    let songDao: SongDao
    
    init(songDao: SongDao = SongDao.shared) {
        self.songDao = songDao
    }
    
    func getSavedSongFromDB() async throws -> [AudioFetch] {
        return try songDao.getAllSong()
    }
    
    func saveSongToDB(audioFetch: AudioFetch) async throws -> () {
        return try songDao.saveSong(audioFetch: audioFetch)
    }
    
    func deleteSavedSongFromDB(audioFetch: AudioFetch) async throws -> () {
        return try songDao.deleteSong(audioFetch: audioFetch)
    }
    
    func updateSavedSongInDB(audioFetch: AudioFetch) async throws -> () {
        return try songDao.updateSong(audioFetch: audioFetch)
    }
}
