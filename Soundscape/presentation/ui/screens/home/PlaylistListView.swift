//
//  PlaylistListView.swift
//  Soundscape
//
//  Created by admin on 08/03/24.
//

import SwiftUI

struct PlaylistListView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    @State private var textSearch = ""
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible())]
    
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                NavigationLink {
                    SearchView()
                } label: {
                    SearchBarView(textSearch: $textSearch)
                }
                .foregroundColor(.white)
                
                LazyVGrid(columns: columns, spacing: 15) {
                    ForEach(PlaylistData.allPlaylistList) { playlist in
                        NavigationLink{
                            MusicListView(
                                name: playlist.name,
                                imageName: playlist.imageName)
                        } label: {
                            PlaylistCardView(playlist: playlist)
                        }
                        .foregroundColor(.white)
                    }
                }
                .padding()
                .padding(.bottom, appViewModel.showBottomPlayer ? 60 : 0)
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
