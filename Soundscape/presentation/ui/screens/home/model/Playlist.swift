//
//  Playlist.swift
//  Soundscape
//
//  Created by Aman Kumar on 29/02/24.
//

import Foundation

struct Playlist: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let description: String
    let listenerCount: Double
    let arrowToggle: Bool
}

struct PlaylistData {
    static let samplePlaylist = Playlist(name: "Fitness",
                                         imageName: "ic_fitness",
                                         description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                                         listenerCount: 4.5, 
                                         arrowToggle: false)
    
    static let playlists = [
        Playlist(name: "Fitness",
                                             imageName: "ic_fitness",
                                             description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                                             listenerCount: 4.5,
                                             arrowToggle: false),
        
        Playlist(name: "Meditation",
                                             imageName: "ic_meditation",
                                             description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                                             listenerCount: 4.5,
                                             arrowToggle: false),
        
        Playlist(name: "Sleep",
                                             imageName: "ic_sleep",
                                             description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                                             listenerCount: 4.5,
                                             arrowToggle: false),
        
        Playlist(name: "Study",
                                             imageName: "ic_study",
                                             description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                                             listenerCount: 4.5,
                                             arrowToggle: false),
        
        Playlist(name: "Motivation",
                                             imageName: "ic_motivation",
                                             description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                                             listenerCount: 4.5,
                                             arrowToggle: false),
        
        Playlist(name: "Explore more",
                                             imageName: "ic_explore_more",
                                             description: "",
                                             listenerCount: 4.5,
                                             arrowToggle: false)
    ]
}
