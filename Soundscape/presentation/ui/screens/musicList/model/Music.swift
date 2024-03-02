//
//  Music.swift
//  Soundscape
//
//  Created by Aman Kumar on 02/03/24.
//

import Foundation

struct Music: Hashable, Identifiable {
    let id = UUID()
    let name: String
}

struct MusicData {
    static let sampleMusic = Music(name: "Soothing")
    
    static let musicList = [
        Music(name: "Soothing"),
        Music(name: "Meditative Moonlight"),
        Music(name: "Frequent Sleep")
    ]
}
