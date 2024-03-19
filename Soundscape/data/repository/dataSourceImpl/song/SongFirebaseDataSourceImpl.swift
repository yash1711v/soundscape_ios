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
    
    func getSavedSongFromFb() async throws -> [AudioFetch] {
        do {
            guard let uid = Auth.auth().currentUser?.uid else { throw URLError(.cannotFindHost)  }
            let querySnapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
            
            if let songData = querySnapshot.data()?["songs"] as? [String: Any] {
                var songs: [AudioFetch] = []
                for (_, value) in songData {
                    if let songDict = value as? [String: Any] {
                        do {
                            let song = try Firestore.Decoder().decode(AudioFetch.self, from: songDict)
                            songs.append(song)
                        } catch {
                            // Handle decoding error here
                            print("Failed to decode song: \(error.localizedDescription)")
                        }
                    }
                }
                return songs
            } else {
                // No songs found
                return []
            }
        } catch {
            throw error
        }
    }

        
    func saveSongToFb(audioFetch: AudioFetch) async throws -> Bool {
        do {
            guard let uid = Auth.auth().currentUser?.uid else { throw URLError(.cannotFindHost)  }
            let encodeAudioFetch = try Firestore.Encoder().encode(audioFetch)
            let songData = ["\(audioFetch.id)": encodeAudioFetch]
            try await Firestore.firestore().collection("users").document(uid).setData(["songs": songData], merge: true)
            return true
        } catch {
            throw error
        }
    }
        
    func deleteSavedSongFromFb(audioFetch: AudioFetch) async throws -> Bool {
        do {
            guard let uid = Auth.auth().currentUser?.uid else { throw URLError(.cannotFindHost)  }
            let documentReference = Firestore.firestore().collection("users").document(uid)
            // Get the current document snapshot to retrieve the "song" field
            let documentSnapshot = try await documentReference.getDocument()
            if var songData = documentSnapshot.data()?["songs"] as? [String: Any] {
                // Remove the song data with the given ID
                songData.removeValue(forKey: String(audioFetch.id))
                // Update the document with the modified "song" field
                try await documentReference.updateData(["songs": songData])
                return true
            } else {
                // No songs found
                return false
            }
        } catch {
            print("delete error: \(error.localizedDescription)")
            throw error
        }
    }
}
