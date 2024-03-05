//
//  StoryCardEpView.swift
//  Soundscape
//
//  Created by Aman Kumar on 05/03/24.
//

import SwiftUI

struct StoryCardEpView: View {
    var title: String
    var imageName: String
    var episodeCount: Int
    
    var body: some View {
        VStack() {
            Spacer()
            VStack() {
                Text(title)
                    .font(.wixMadeFont(.bold, fontSize: .titleSmall))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 5)
                    .padding(.horizontal, 5)
                
                HStack {
                    Text("2K Listeners")
                        .font(.wixMadeFont(.regular, fontSize: .body))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("\(episodeCount) episodes")
                        .font(.wixMadeFont(.regular, fontSize: .body))
                }
                .padding(.horizontal, 5)
                .padding(.bottom, 10)
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
            Image(imageName)
                .resizable()
                .scaledToFit()
        )
        .cornerRadius(10)
    }
}

#Preview {
    StoryCardEpView(title: "The Young Scout", imageName: "the_young_scout", episodeCount: 2)
}
