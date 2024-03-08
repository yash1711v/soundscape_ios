//
//  PlaylistCardView.swift
//  Soundscape
//
//  Created by Aman Kumar on 29/02/24.
//

import SwiftUI

struct homePlaylistCardView: View {
    var playlist: Playlist
    @State var showDescription: Bool
    
    init(playlist: Playlist) {
        self.playlist = playlist
        showDescription = self.playlist.arrowToggle
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            if playlist.name == "Explore More" {
                Image(playlist.imageName)
                    .resizable()
                    .frame(width: 150, height: 110)
                    .padding(.top)
                    .padding(.horizontal)
            } else {
                Image(playlist.imageName)
                    .resizable()
                    .frame(width: 150, height: 110)
                    .padding(.top)
                    .padding(.horizontal)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white, lineWidth: 2)
                            .frame(width: 150, height: 110)
                            .padding(.top)
                    )
            }
            
            Text("\(playlist.listenerCount, specifier: "%.1f")K Listeners")
                .font(.wixMadeFont(.regular, fontSize: .body))
                .padding(.leading)
            
            HStack {
                Text(playlist.name)
                    .font(.wixMadeFont(.bold, fontSize: .subHeading))
                
                Spacer()
                
                if playlist.name != "Explore More" {
                    Button {
                        showDescription.toggle()
                    } label: {
                        Image(systemName: showDescription ? "arrow.up.circle" : "arrow.down.circle")
                            .foregroundColor(.white)
                    }
                }
            }
            .padding(.horizontal)
            
            Text(showDescription ? playlist.description!.first! : "")
                .font(.wixMadeFont(.regular, fontSize: .body))
                .multilineTextAlignment(.leading)
                .padding(.horizontal)
                .padding(.bottom, showDescription ? 20 : 0)
        }
        .frame(width: 180)
        .background(
            BackgroundGradientView(topColor: Color("brandPurple"), bottomColor: .gray)
        )
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}

#Preview {
    homePlaylistCardView(playlist: PlaylistData.samplePlaylist)
}
