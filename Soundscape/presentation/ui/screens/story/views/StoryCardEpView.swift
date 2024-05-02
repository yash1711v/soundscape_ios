//
//  StoryCardEpView.swift
//  Soundscape
//
//  Created by Aman Kumar on 05/03/24.
//

import SwiftUI

struct StoryCardEpView: View {
    var mainStorySound: MainStorySound
    var width: CGFloat = 200
    
    var body: some View {
        VStack() {
            Spacer()
            VStack() {
                Text(mainStorySound.name)
                    .font(.wixMadeFont(.bold, fontSize: .titleSmall))
                    .lineLimit(1)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 5)
                    .padding(.horizontal, 5)
                    .padding(.bottom, 3)
                
                HStack {
                    Text("\(mainStorySound.listenerCount)K Listeners")
                        .font(.wixMadeFont(.regular, fontSize: .body))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("\(mainStorySound.listenerCount) episodes")
                        .font(.wixMadeFont(.regular, fontSize: .body))
                }
                .padding(.horizontal, 5)
                .padding(.bottom, 10)
            }
            .frame(width: width)
            .background(
                Rectangle()
                    .foregroundColor(Color.black.opacity(0.6))
                    .shadow(color: Color.black, radius: 1,y: 30)
            )
            
        }
        .frame(width: width, height: 180)
        .background(
            Image(mainStorySound.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: width, height: 180)
        )
        .cornerRadius(10)
        .padding()
    }
}

#Preview {
    StoryCardEpView(mainStorySound: MainStorySoundData.sampleStorySound)
}
