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
    
    
    
    @Published var audioFetch = Resource<Any>.loading(nil)
    
    private let getSongFetchUseCase = GetSongFetchUseCase()
    
    func getSongSection(songSection: String) {
        Task {
            let result = await getSongFetchUseCase.execute(songSection: songSection)
            audioFetch = Resource.success(result)
        }
    }
}
