//
//  Onboarding.swift
//  Soundscape
//
//  Created by Aman Kumar on 02/03/24.
//

import Foundation

struct Onboarding: Hashable, Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
    let description: String
    let position: Int
    let backgroundImage: String
}

struct OnboardingData {
    static let sampleOnboardingData = Onboarding(title: "Welcome To \nSoundscape",
                                                 imageName: "onboarding_1",
                                                 description: "Your Personal \n Oasis Of Serenity!",
                                                 position: 1,
                                                 backgroundImage: "onboarding_bg_1")
    
    static let onboardingList = [
        Onboarding(title: "Welcome To \nSoundscape",
                   imageName: "onboarding_1",
                   description: "Your Personal \n Oasis Of Serenity!",
                   position: 1,
                   backgroundImage: "onboarding_bg_1"),
        
        Onboarding(title: "Emotionally \nBalanced Living",
                   imageName: "onboarding_2",
                   description: "Select The Music That \nSuits Your Mood.",
                   position: 2,
                   backgroundImage: "onboarding_bg_2"),
        
        Onboarding(title: "Cater To Your Needs",
                   imageName: "onboarding_3",
                   description: "Select The Music That \nSuits Your Mood.",
                   position: 3,
                   backgroundImage: "onboarding_bg_3"),
        
        Onboarding(title: "Audio Story Books",
                   imageName: "onboarding_4",
                   description: "Explore Captivating Stories Wherever You Go.",
                   position: 4,
                   backgroundImage: "onboarding_bg_4")
    ]
}
