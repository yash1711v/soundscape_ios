//
//  SplashView.swift
//  Soundscape
//
//  Created by Aman Kumar on 02/03/24.
//

import SwiftUI

struct SplashView: View {
    @State var isActive: Bool = false
    
    var body: some View {
        ZStack {
            if isActive {
                if UserDefaults.standard.bool(forKey: "hasShownOnboarding") {
                    SoundscapeTabView()
                } else {
                    OnboardingView()
                }
            } else {
                VStack {
                    Image("splash_icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250)
                    
                    Text("Soundscape")
                        .font(.wixMadeFont(.semiBold, fontSize: .splash))
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

#Preview {
    SplashView()
}
