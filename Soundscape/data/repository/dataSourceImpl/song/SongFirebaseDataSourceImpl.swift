//
//  SongFirebaseDataSource.swift
//  Soundscape
//
//  Created by admin on 18/03/24.
//

import Foundation
import Firebase

final class SongFirebaseDataSourceImpl: SongFirebaseDataSource {
    static let shared = SongFirebaseDataSourceImpl()
    let uid = UserDefaults.standard.string(forKey: "userUID")!
    
    func getSavedSongFromFb() async throws -> [AudioFetch] {
        // Fetch saved songs from Firebase
        do {
            let querySnapshot = try await Firestore.firestore().collection("song").whereField("userId", isEqualTo: uid).getDocuments()
            
            var songs: [AudioFetch] = []
            for document in querySnapshot.documents {
                do {
                    let song = try Firestore.Decoder().decode(AudioFetch.self, from: document.data())
                    songs.append(song)
                } catch {
                    // Handle decoding error here
                    print("Failed to decode song: \(error.localizedDescription)")
                }
            }
            
            return songs
        } catch {
            throw error
        }
    }

        
    func saveSongToFb(audioFetch: AudioFetch) async throws -> Bool {
        do {
            print("this is the key: \(uid)")
            let encodeUser = try Firestore.Encoder().encode(audioFetch)
            try await Firestore.firestore().collection("song").document(uid).setData(encodeUser)
            return true
        } catch {
            throw error
        }
    }
        
    func deleteSavedSongFromFb(audioFetch: AudioFetch) async throws -> Bool {
        do {
            let querySnapshot = try await Firestore.firestore().collection("song").whereField("userId", isEqualTo: uid).getDocuments()
            
            for document in querySnapshot.documents {
                do {
                    let song = try Firestore.Decoder().decode(AudioFetch.self, from: document.data())
                    if song.id == audioFetch.id {
                        try await Firestore.firestore().collection("song").document(document.documentID).delete()
                        return true
                    }
                } catch {
                    // Handle decoding error here
                    print("Failed to decode song: \(error.localizedDescription)")
                }
            }
            return false
        } catch {
            throw error
        }
    }

    func updateSavedSongInFb(audioFetch: AudioFetch) async throws -> Bool {
        do {
            let querySnapshot = try await Firestore.firestore().collection("song").whereField("userId", isEqualTo: uid).getDocuments()
            
            for document in querySnapshot.documents {
                do {
                    let song = try Firestore.Decoder().decode(AudioFetch.self, from: document.data())
                    if song.id == audioFetch.id {
                        let encodeUser = try Firestore.Encoder().encode(audioFetch)
                        try await Firestore.firestore().collection("song").document(document.documentID).setData(encodeUser)
                        return true
                    }
                } catch {
                    // Handle decoding error here
                    print("Failed to decode song: \(error.localizedDescription)")
                }
            }
            return false
        } catch {
            throw error
        }
    }
}
