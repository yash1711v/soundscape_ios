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
    
    private let getSongFetchUseCase = GetSongFetchUseCase.shared
    private let saveSongUseCase = SaveSongUseCase.shared
    
    func getSongSection(songSection: String) {
        isLoading = true
        Task {
            do {
                audioFetch = try await getSongFetchUseCase.execute(songSection: songSection)
                isLoading = false
            } catch {
                if let urlError = error as? URLError, urlError.code == .notConnectedToInternet {
                    alertItem = AlertContext.noInternetConnection
                } else if let scError = error as? APIError {
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
    
    func saveSong(audioFetch: AudioFetch) {
        Task {
            do {
                try await saveSongUseCase.execute(audioFetch: audioFetch)
            } catch {
                if let dbError = error as? DBError {
                    switch dbError {
                    case .dataSourceError:
                        alertItem = AlertContext.dataSourceError
                    case .createError:
                        alertItem = AlertContext.createError
                    case .deleteError:
                        alertItem = AlertContext.deleteError
                    case .updateError:
                        alertItem = AlertContext.updateError
                    case .fetchError:
                        alertItem = AlertContext.fetchError
                    }
                }
            }
        }
    }
}
