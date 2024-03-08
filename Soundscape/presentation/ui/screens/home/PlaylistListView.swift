//
//  PlaylistListView.swift
//  Soundscape
//
//  Created by admin on 08/03/24.
//

import SwiftUI

struct PlaylistListView: View {
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible())]
    
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                SearchBarView()
                
                LazyVGrid(columns: columns) {
                    ForEach(PlaylistData.allPlaylistList) { playlist in
                        NavigationLink(destination:
                            MusicListView(
                                name: playlist.name,
                                imageName: playlist.imageName)) {
                            PlaylistCardView(playlist: playlist)
                        }
                                .foregroundColor(.white)
                                .padding()
                    }
                }
                .padding(.horizontal)
                
            }
        }
        .background(
            Image("login_background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        )
        .navigationTitle("More Playlists")
    }
}

#Preview {
    PlaylistListView()
}
