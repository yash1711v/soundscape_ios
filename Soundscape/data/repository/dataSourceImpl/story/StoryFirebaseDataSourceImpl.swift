//
//  StoryFirebaseDataSourceImpl.swift
//  Soundscape
//
//  Created by Aman Kumar on 21/03/24.
//

import Foundation
import Firebase

final class StoryFirebaseDataSourceImpl: StoryFirebaseDataSource {
    static let shared = StoryFirebaseDataSourceImpl()
    
    func getSavedStoryFromFb() async throws -> [AudioFetch] {
        do {
            guard let uid = Auth.auth().currentUser?.uid else { throw URLError(.cannotFindHost)  }
            let querySnapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
            
            if let songData = querySnapshot.data()?["stories"] as? [String: Any] {
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

        
    func saveStoryToFb(audioFetch: AudioFetch) async throws -> Bool {
        do {
            guard let uid = Auth.auth().currentUser?.uid else { throw URLError(.cannotFindHost)  }
            let encodeAudioFetch = try Firestore.Encoder().encode(audioFetch)
            let songData = ["\(audioFetch.id)": encodeAudioFetch]
            try await Firestore.firestore().collection("users").document(uid).setData(["stories": songData], merge: true)
            return true
        } catch {
            throw error
        }
    }
        
    func deleteSavedStoryFromFb(audioFetch: AudioFetch) async throws -> Bool {
        do {
            guard let uid = Auth.auth().currentUser?.uid else { throw URLError(.cannotFindHost)  }
            let documentReference = Firestore.firestore().collection("users").document(uid)
            // Get the current document snapshot to retrieve the "song" field
            let documentSnapshot = try await documentReference.getDocument()
            if var songData = documentSnapshot.data()?["stories"] as? [String: Any] {
                // Remove the song data with the given ID
                songData.removeValue(forKey: String(audioFetch.id))
                // Update the document with the modified "song" field
                try await documentReference.updateData(["stories": songData])
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
