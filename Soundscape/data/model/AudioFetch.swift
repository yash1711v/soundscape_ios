//
//  SoundscapeSong.swift
//  Soundscape
//
//  Created by admin on 13/03/24.
//

import Foundation

struct AudioFetch: Decodable, Identifiable {
    let id: Int64
    let name: String
    let assetPath: String
    let image: String
    let type: String
    var isLiked: Bool? = false
}

extension AudioFetch {
    func withIsLiked(_ isLiked: Bool) -> AudioFetch {
        var modifiedAudioFetch = self
        modifiedAudioFetch.isLiked = isLiked
        return modifiedAudioFetch
    }
}

struct AudioFetchResponse: Decodable {
    let message: String
    let status: Int
    let data: [AudioFetch]
}

struct AudioFetchData {
    static let audioFetchSampleData = AudioFetch(id: 1,
                                                 name: "Nature Guitar",
                                                 assetPath: "http://soundscape.boostproductivity.online/api/getmusic/Nature - Guitar",
                                                 image: "assets/images/home_screen/Angry.png",
                                                 type: "Angry")
    static let audioFetchSampleList = [
        AudioFetch(id: 1,
                   name: "Nature Guitar",
                   assetPath: "http://soundscape.boostproductivity.online/api/getmusic/Nature - Guitar",
                   image: "assets/images/home_screen/Angry.png",
                   type: "Angry"),
        AudioFetch(id: 2,
                   name: "Rain Lofi",
                   assetPath: "http://soundscape.boostproductivity.online/api/getmusic/Rain Lofi",
                   image: "assets/images/home_screen/Angry.png",
                   type: "Angry")
    ]
}
