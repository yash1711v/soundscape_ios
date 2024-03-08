//
//  StoryCardView.swift
//  Soundscape
//
//  Created by Aman Kumar on 01/03/24.
//

import SwiftUI

struct StoryCardView: View {
    var mainStorySound: MainStorySound
    
    var body: some View {
        VStack() {
            Spacer()
            VStack() {
                Text(mainStorySound.name)
                    .font(.wixMadeFont(.bold, fontSize: .titleSmall))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 5)
                    .padding(.horizontal, 5)
                
                HStack {
                    Text("\(mainStorySound.listenerCount)K Listeners")
                        .font(.wixMadeFont(.regular, fontSize: .body))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("04.23 mins")
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
            Image(mainStorySound.imageName)
                .resizable()
                .scaledToFit()
        )
        .cornerRadius(10)
    }
}

#Preview {
    StoryCardView(mainStorySound: MainStorySoundData.sampleStorySound)
}
