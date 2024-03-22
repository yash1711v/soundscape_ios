//
//  Episodes.swift
//  Soundscape
//
//  Created by admin on 07/03/24.
//

import Foundation

struct Episode: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let songName: String
    let imageName: String
    let songPath: String
    var audioFetchId: Int64? = 0
}

struct EpisodeData {
    static let sampleEpisodeData = Episode(name: "Episode 1",
                                           songName: "The Young Scout",
                                           imageName: "theYoungScoutEP1",
                                           songPath: "http://soundscape.boostproductivity.online/api/getmusic/theYoungScout")
    
}
