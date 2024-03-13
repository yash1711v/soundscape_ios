//
//  MusicPlayerViewModel.swift
//  Soundscape
//
//  Created by admin on 13/03/24.
//

import Foundation
import AVFoundation

final class AppViewModel: ObservableObject {
    @Published var showBottomPlayer: Bool = false
    @Published var episode: Episode = EpisodeData.sampleEpisodeData
    @Published var expand: Bool = false
    @Published var audioPlayer: AVPlayer?
    @Published var isPlaying: Bool = false
    @Published var isLoading: Bool = false
    @Published var currentTime: Double = 0.0
    @Published var totalTime: Double = 0.0

    func playSound(sound: String) {
        guard let url = URL(string: sound) else { return }
        
        let playerItem = AVPlayerItem(url: url)
        audioPlayer = AVPlayer(playerItem: playerItem)
        
        // Show loader
        isLoading = true
        
        // Calculate total time
        let asset = AVURLAsset(url: url)
        let duration = asset.duration
        totalTime = duration.seconds
        
        // Reset seek
        currentTime = 0.0
        
        // Hide loader
        isLoading = false
    }
    
    func playSound() {
        audioPlayer?.play()
        isPlaying = true
    }
    
    func pauseSound() {
        audioPlayer?.pause()
        isPlaying = false
    }
    
    func seek(to time: Double) {
        let cmTime = CMTime(seconds: time, preferredTimescale: 1)
        audioPlayer?.seek(to: cmTime)
    }
}
