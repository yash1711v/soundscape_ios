//
//  Effects.swift
//  Soundscape
//
//  Created by Aman Kumar on 26/03/24.
//

import Foundation

struct EffectsSoundData {
    static let natureList = [
        AudioFetch(
            id: 295,
            name: "Fireplace",
            assetPath: "http://soundscape.boostproductivity.online/api/getmusic/Fireplace",
            image: "fire",
            type: "Nature"
        ),
        
        AudioFetch(
            id: 288,
            name: "Rain on Roof",
            assetPath: "http://soundscape.boostproductivity.online/api/getmusic/Rain On Roof",
            image: "rain",
            type: "Nature"
        ),
        
        AudioFetch(
            id: 296,
            name: "Thunder",
            assetPath: "http://soundscape.boostproductivity.online/api/getmusic/Thunder",
            image: "thunder",
            type: "Nature"
        ),
        
        AudioFetch(
            id: 289,
            name: "Waves",
            assetPath: "http://soundscape.boostproductivity.online/api/getmusic/Waves",
            image: "waves",
            type: "Nature"
        ),
        
        AudioFetch(
            id: 297,
            name: "Birds Singing",
            assetPath: "http://soundscape.boostproductivity.online/api/getmusic/birdsSinging",
            image: "birds",
            type: "Nature"
        ),
        
        AudioFetch(
            id: 301,
            name: "Tropical Jungle",
            assetPath: "http://soundscape.boostproductivity.online/api/getmusic/tropicalJungle",
            image: "forest",
            type: "Nature"
        )
    ]
    
    static let instrumentalList = [
        AudioFetch(
            id: 425, // random for these
            name: "Piano",
            assetPath: "http://soundscape.boostproductivity.online/api/getmusic/Piano",
            image: "piano",
            type: "Instrumental"
        ),
        
        AudioFetch(
            id: 324,
            name: "Chimes",
            assetPath: "http://soundscape.boostproductivity.online/api/getmusic/chimes",
            image: "chimes",
            type: "Instrumental"
        ),
        
        AudioFetch(
            id: 254,
            name: "Violin",
            assetPath: "http://soundscape.boostproductivity.online/api/getmusic/violinMusic",
            image: "violin",
            type: "Instrumental"
        ),
        
        AudioFetch(
            id: 342,
            name: "Harp",
            assetPath: "http://soundscape.boostproductivity.online/api/getmusic/harp",
            image: "harp",
            type: "Instrumental"
        ),
        
        AudioFetch(
            id: 525,
            name: "Guitar",
            assetPath: "http://soundscape.boostproductivity.online/api/getmusic/Guitar",
            image: "guitar",
            type: "Instrumental"
        ),
    ]
    
    static let asmrList = [
        AudioFetch(
            id: 58,
            name: "Fan",
            assetPath: "http://soundscape.boostproductivity.online/api/getmusic/Fan",
            image: "fan",
            type: "fan"
        ),
        
        AudioFetch(
            id: 51,
            name: "Vacuum",
            assetPath: "http://soundscape.boostproductivity.online/api/getmusic/Vacuum",
            image: "vaccum",
            type: "vaccum"
        ),
        
        AudioFetch(
            
            id: 59,
            name: "Cafe",
            assetPath: "http://soundscape.boostproductivity.online/api/getmusic/Cafe",
            image: "cafe",
            type: "cafe"
        )
    ]
}
