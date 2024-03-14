//
//  LikeViewModel.swift
//  Soundscape
//
//  Created by Aman Kumar on 14/03/24.
//

import Foundation

@MainActor final class LikeViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var audioFetch: [AudioFetch] = []
    @Published var alertItem: AlertItem?
    
    private let getSaveSongUseCase = GetSavedSongUseCase.shared
    
    func getAllSong() {
        isLoading = true
        Task {
            do {
                audioFetch = try await getSaveSongUseCase.execute()
                isLoading = false
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
                isLoading = false
            }
        }
    }
}
