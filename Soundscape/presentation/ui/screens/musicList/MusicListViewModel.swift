//
//  HomeViewModel.swift
//  Soundscape
//
//  Created by admin on 13/03/24.
//

import Foundation

@MainActor final class MusicListViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var selectedAudioFetch: AudioFetch?
    @Published var audioFetch: [AudioFetch] = []
    @Published var alertItem: AlertItem?
    
    private let getSongFetchUseCase = GetSongFetchUseCase()
    
    func getSongSection(songSection: String) {
        isLoading = true
        Task {
            do {
                audioFetch = try await getSongFetchUseCase.execute(songSection: songSection)
                isLoading = false
            } catch {
                if let urlError = error as? URLError, urlError.code == .notConnectedToInternet {
                    alertItem = AlertContext.noInternetConnection
                } else if let scError = error as? SCError {
                    switch scError {
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    }
                }
                isLoading = false
            }
        }
    }
}
