//
//  MiniStorySound.swift
//  Soundscape
//
//  Created by Aman Kumar on 05/03/24.
//

import Foundation

struct MiniStorySound: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let listenerCount: Int64
    let description: String
    let episodeList: [Episode]
}

struct MiniStorySoundData {
    static let sampleStorySound = MiniStorySound(name: "The Young Scout",
                                                 imageName: "theYoungScoutEP1",
                                                 listenerCount: 2,
                                                 description: "Young Andrew Jackson bravely stood up to the British in the Revolutionary War. Even when captured, he didn't back down. What happens next is a mystery. Released, his story takes an interesting turn, leading to something big in American history. Get ready for an exciting journey from a brave kid to a super important person!",
                                                 episodeList: [
                                                    Episode(name: "Episode 1", 
                                                            imageName: "theYoungScoutEP1",
                                                            songPath: "")
                                                 ])
    
    static let miniStoryList = [
        MiniStorySound(name: "The Young Scout",
                       imageName: "theYoungScoutEP1",
                       listenerCount: 2,
                       description: "Young Andrew Jackson bravely stood up to the British in the Revolutionary War. Even when captured, he didn't back down. What happens next is a mystery. Released, his story takes an interesting turn, leading to something big in American history. Get ready for an exciting journey from a brave kid to a super important person!"),
        
        MiniStorySound(name: "The Starry Journey", imageName: "theStarryJourney", listenerCount: <#T##Int64#>, description: <#T##String#>)
    ]
}
