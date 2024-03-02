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
            
            Text(playlist.description)
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
