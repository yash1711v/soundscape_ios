//
//  StorySoundCardView.swift
//  Soundscape
//
//  Created by Aman Kumar on 29/02/24.
//

import SwiftUI

struct StorySoundCardView: View {
    var storySound: StorySound
    
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 10) {
                Text(storySound.name)
                    .font(.wixMadeFont(.bold, fontSize: .subHeading))
                Text("\(storySound.listenerCount, specifier: "%.1f")K listeners")
                    .font(.wixMadeFont(.regular, fontSize: .body))
            }
            .padding()
            Spacer()
            Image(storySound.imageName)
                .resizable()
                .frame(width: 80,height: 80)
        }
        .background(
            LinearGradient(gradient: Gradient(
                colors: [Color(hex: 0xB3B5D5).opacity(0.49),
                         Color(hex: 0xB9A0D9).opacity(0.46)]),
                           startPoint: .top,
                           endPoint: .bottom)
        )
        .cornerRadius(10)
    }
}

#Preview {
    StorySoundCardView(storySound: StorySoundData.sampleStorySound)
}
