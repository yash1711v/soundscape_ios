//
//  SoundManager.swift
//  Soundscape
//
//  Created by admin on 08/03/24.
//

import Foundation
import AVFoundation

class SoundManager : ObservableObject {
    var audioPlayer: AVPlayer?

    func playSound(sound: String){
        if let url = URL(string: sound) {
            self.audioPlayer = AVPlayer(url: url)
        }
    }
}
