//
//  HomeViewModel.swift
//  Soundscape
//
//  Created by admin on 13/03/24.
//

import Foundation

@MainActor final class MusicListViewModel: ObservableObject {
    @Published var audioFetch: [AudioFetch] = []
    @Published var isLoading = false
    @Published var selectedAudioFetch: AudioFetch?
    
    func getAppetizers() {
        isLoading = true
        
        Task {
            do {
                audioFetch = try await SoundscapeAPIService.shared.getAllSong()
                isLoading = false
            } catch {
                if let scError = error as? SCError {
                }
                isLoading = false
            }
        }
    }
    
    func getSongSection(songSection: String) {
        isLoading = true
        
        Task {
            do {
                audioFetch = try await SoundscapeAPIService.shared.getSongSection(songSection: songSection)
                isLoading = false
            } catch {
                if let scError = error as? SCError {
                }
                isLoading = false
            }
        }
    }
}
