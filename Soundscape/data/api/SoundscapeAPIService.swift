//
//  SoundscapeAPIService.swift
//  Soundscape
//
//  Created by admin on 13/03/24.
//

import Foundation

final class SoundscapeAPIService {
    static let shared = SoundscapeAPIService()
    static let baseURL = "http://soundscape.boostproductivity.online/api/getSongs/"
    private let allSongURL = baseURL + "all"
    
    func getAllSong() async throws -> [AudioFetch] {
        guard let url = URL(string: allSongURL) else {
            throw SCError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode(AudioFetchResponse.self, from: data)
            return decodedResponse.data
        } catch {
            throw SCError.invalidURL
        }
    }
    
    func getSongSection(songSection: String) async throws -> [AudioFetch] {
        let songURL = SoundscapeAPIService.baseURL + songSection
        
        guard let url = URL(string: songURL) else {
            throw SCError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode(AudioFetchResponse.self, from: data)
            return decodedResponse.data
        } catch {
            throw SCError.invalidURL
        }
    }
}
