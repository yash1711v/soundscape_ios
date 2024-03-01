//
//  StoryCardView.swift
//  Soundscape
//
//  Created by Aman Kumar on 01/03/24.
//

import SwiftUI

struct StoryCardView: View {
    var title: String
    var imageName: String
    var songLength: String
    
    var body: some View {
        VStack() {
            Spacer()
            VStack() {
                Text(title)
                    .font(.custom("WixMadeforText-Bold", size: 14))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 5)
                    .padding(.horizontal, 5)
                
                HStack {
                    Text("2K Listeners")
                        .font(.custom("WixMadeforText-Regular", size: 12))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(songLength)
                        .font(.custom("WixMadeforText-Regular", size: 12))
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
    StoryCardView(title: "The Young Scout", imageName: "the_young_scout", songLength: "4:38 mins")
}
