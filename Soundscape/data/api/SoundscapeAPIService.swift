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
            throw APIError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode(AudioFetchResponse.self, from: data)
            return decodedResponse.data
        } catch {
            throw APIError.invalidData
        }
    }
    
    func getSongSection(songSection: String) async throws -> [AudioFetch] {
        let songURL = SoundscapeAPIService.baseURL + songSection
        
        guard let url = URL(string: songURL) else {
            throw APIError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode(AudioFetchResponse.self, from: data)
            return decodedResponse.data
        } catch {
            throw APIError.invalidData
        }
    }
}
