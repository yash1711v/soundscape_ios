//
//  StorySound.swift
//  Soundscape
//
//  Created by Aman Kumar on 29/02/24.
//

import Foundation

struct StorySound: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let listenerCount: Double
}

struct StorySoundData {
    static let sampleStorySound = StorySound(name: "Nature", imageName: "ic_nature", listenerCount: 2.5)
    
    static let sampleStoryList = [
        StorySound(name: "Nature", imageName: "ic_nature", listenerCount: 2.5),
        StorySound(name: "ASMR", imageName: "ic_asmr", listenerCount: 2.5),
        StorySound(name: "Instrumental", imageName: "ic_instrumental", listenerCount: 2.5)
    ]
}
