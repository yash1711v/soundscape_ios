//
//  MiniStoryCardView.swift
//  Soundscape
//
//  Created by Aman Kumar on 05/03/24.
//

import SwiftUI

struct MiniStoryCardView: View {
    var mainStorySound: MainStorySound
    
    var body: some View {
        VStack() {
            Spacer()
            VStack() {
                Text(mainStorySound.name)
                    .font(.wixMadeFont(.bold, fontSize: .small))
                    .lineLimit(1)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 5)
                    .padding(.horizontal, 5)
                    .padding(.bottom, 3)
                
                HStack {
                    Text("\(mainStorySound.listenerCount)K Listeners")
                        .font(.wixMadeFont(.regular, fontSize: .extraSmall))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal, 5)
                .padding(.bottom, 10)
            }
            .frame(width: 110)
            .background(
                Rectangle()
                    .foregroundColor(Color.black.opacity(0.6))
                    .shadow(color: Color.black, radius: 1,y: 30)
            )
            
        }
        .frame(width: 110, height: 160)
        .background(
            Image(mainStorySound.imageName)
                .resizable()
                .scaledToFill()
        )
        .cornerRadius(10)
    }
}

#Preview {
    MiniStoryCardView(mainStorySound: MainStorySoundData.sampleStorySound)
}
