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
                .aspectRatio(contentMode: .fit)
                .frame(width: 80)
            Text(mood.name)
                .font(.custom("WixMadeforText-Regular", size: 16))
        }
    }
}

#Preview {
    MoodSelectView(mood: MoodData.sampleMood)
}
