//
//  OnboardingArrowButtonView.swift
//  Soundscape
//
//  Created by admin on 04/03/24.
//

import SwiftUI

struct OnboardingArrowButtonView: View {
    var body: some View {
        ZStack {
            Circle()
                .stroke()
                .frame(width: 50, height: 50)
                .foregroundColor(.white)
            
            Circle()
                .frame(width: 45, height: 45)
                .foregroundColor(.white)
            
            Image(systemName: "chevron.backward")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .foregroundColor(.black)
                .rotationEffect(.degrees(180.0))
        }
    }
}

#Preview {
    OnboardingArrowButtonView()
}
