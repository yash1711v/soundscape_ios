//
//  MoodSelectView.swift
//  Soundscape
//
//  Created by admin on 28/02/24.
//

import SwiftUI

struct MoodSelectView: View {
    var mood: Mood
    
    var body: some View {
        VStack {
            Image(mood.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 80)
                .clipShape(Circle())
            
            Text(mood.name)
                .font(.wixMadeFont(.regular, fontSize: .titleSmall))
        }
    }
}

#Preview {
    MoodSelectView(mood: MoodData.sampleMood)
}
