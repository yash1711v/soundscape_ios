//
//  OnboardingNextButtonView.swift
//  Soundscape
//
//  Created by admin on 04/03/24.
//

import SwiftUI

struct OnboardingNextButtonView: View {
    var body: some View {
        ZStack {
            Capsule()
                .stroke()
                .frame(width: 130, height: 50)
                .foregroundColor(.white)
            
            Capsule()
                .frame(width: 125, height: 45)
                .foregroundColor(.white)
            HStack {
                Text("Get Started")
                    .font(.wixMadeFont(.regular, fontSize: .subTitle))
                    .foregroundColor(.black)
                
                Image(systemName: "chevron.backward")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.black)
                    .rotationEffect(.degrees(180.0))
            }
        }
    }
}

#Preview {
    OnboardingNextButtonView()
}
