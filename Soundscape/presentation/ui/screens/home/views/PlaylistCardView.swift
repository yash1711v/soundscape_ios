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
            if playlist.name == "Explore more" {
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
                
                Button {
                    print("hi")
                } label: {
                    Image(systemName: "arrow.down.circle")
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal)
            
            Text(playlist.description.first!)
                .font(.wixMadeFont(.regular, fontSize: .body))
                .padding(.leading)
                .padding(.bottom)
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
    PlaylistCardView(playlist: PlaylistData.samplePlaylist)
}
