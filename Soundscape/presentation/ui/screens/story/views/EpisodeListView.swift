//
//  EpisodeListView.swift
//  Soundscape
//
//  Created by Aman Kumar on 05/03/24.
//

import SwiftUI

struct EpisodeListView: View {
    var body: some View {
        HStack {
            Image("the_young_scout")
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .opacity(0.5)
                .overlay(
                    Circle().stroke(Color.white, lineWidth: 1)
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
                .padding(.trailing, 50)
            
            VStack(alignment: .leading) {
                Text("Episode 1")
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
    EpisodeListView()
}