//
//  OnboardingListView.swift
//  Soundscape
//
//  Created by admin on 04/03/24.
//

import SwiftUI

struct OnboardingListView: View {
    var onboarding: Onboarding
    
    var body: some View {
        VStack {
            Text(onboarding.title)
                .font(.wixMadeFont(.bold, fontSize: .largeHeading))
                .multilineTextAlignment(.center)
                .padding()
            Spacer()
            Image(onboarding.imageName)
                .resizable()
                .scaledToFit()
            Spacer()
            Text(onboarding.description)
                .font(.wixMadeFont(.bold, fontSize: .title))
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .padding()
        }
    }
}

#Preview {
    OnboardingListView(onboarding: OnboardingData.sampleOnboardingData)
}
