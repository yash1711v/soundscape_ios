//
//  PlaylistCardView.swift
//  Soundscape
//
//  Created by admin on 08/03/24.
//

import SwiftUI

struct PlaylistCardView: View {
    var playlist: Playlist
    
    var body: some View {
        VStack() {
            Spacer()
            VStack() {
                Text(playlist.name)
                    .font(.wixMadeFont(.bold, fontSize: .titleSmall))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
            }
            .frame(width: 180)
            .background(
                Rectangle()
                    .foregroundColor(Color.black.opacity(0.6))
                    .shadow(color: Color.black, radius: 1,y: 30)
            )
        }
        .frame(width: 180, height: 180)
        .background(
            Image(playlist.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
        )
        .cornerRadius(10)
    }
}

#Preview {
    PlaylistCardView(playlist: PlaylistData.samplePlaylist)
}
