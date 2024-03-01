//
//  PlaylistCardView.swift
//  Soundscape
//
//  Created by Aman Kumar on 29/02/24.
//

import SwiftUI

struct PlaylistCardView: View {
    var playlist: Playlist
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Image(playlist.imageName)
                .resizable()
                .scaledToFit()
                .padding(.top)
                .padding(.horizontal)
                .overlay(alignment: .center) {
                    Button {
                        print("hi")
                    } label: {
                        Image(systemName: "play.circle")
                            .foregroundColor(.white)
                    }
                    .background(.gray)
                    .cornerRadius(10)
                }
            
            
            Text("\(playlist.listenerCount, specifier: "%.1f")K Listeners")
                .font(.custom("WixMadeforText-Regular", size: 12))
                .padding(.leading)
            
            HStack {
                Text(playlist.name)
                    .font(.custom("WixMadeforText-Bold", size: 20))
                
                Spacer()
                
                Button {
                    print("hi")
                } label: {
                    Image(systemName: "arrow.down.circle")
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal)
            
            Text(playlist.description)
                .font(.custom("WixMadeforText-Regular", size: 12))
                .padding(.leading)
                .padding(.bottom)
        }
        .frame(width: 180)
        .background(.gray)
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}

#Preview {
    PlaylistCardView(playlist: PlaylistData.samplePlaylist)
}
