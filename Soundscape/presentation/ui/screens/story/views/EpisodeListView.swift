//
//  EpisodeListView.swift
//  Soundscape
//
//  Created by Aman Kumar on 05/03/24.
//

import SwiftUI

struct EpisodeListView: View {
    var episode: Episode
    
    var body: some View {
        HStack {
            Image(episode.imageName)
                .resizable()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .opacity(0.5)
                .overlay(
                    Circle().stroke(Color.white, lineWidth: 0.5)
                        .opacity(0.75)
                )
                .overlay {
                    ZStack {
                        Circle()
                            .frame(width: 20)
                            .opacity(0.8)
                        
                        Image(systemName: "play.fill")
                            .resizable()
                            .foregroundColor(.black)
                            .opacity(0.6)
                            .frame(width: 10, height: 10)
                        
                    }
                }
                .padding(.trailing, 20)
            
            VStack(alignment: .leading) {
                Text(episode.name)
                    .font(.wixMadeFont(.bold, fontSize: .subHeading))
                Text("04:09 mins")
                    .font(.wixMadeFont(.regular, fontSize: .titleSmall))
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    EpisodeListView(episode: EpisodeData.sampleEpisodeData)
}
