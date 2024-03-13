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
    
    func playSound(sound: String){
        if let url = URL(string: sound) {
            audioPlayer = AVPlayer(url: url)
        }
    }
    
    func playSound() {
        audioPlayer?.play()
    }
    
    func pauseSound() {
        audioPlayer?.pause()
    }
    
    
}
