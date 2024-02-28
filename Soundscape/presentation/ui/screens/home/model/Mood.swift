//
//  Mood.swift
//  Soundscape
//
//  Created by admin on 28/02/24.
//

import Foundation

struct Mood: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
}

struct MoodData {
    static let sampleMood = Mood(name: "Romantic?", imageName: "ic_romantic")
    
    static let moods = [
        Mood(name: "Romantic?", imageName: "ic_romantic"),
        Mood(name: "Sad?", imageName: "ic_sad"),
        Mood(name: "Anxious?", imageName: "ic_anxious"),
        Mood(name: "Angry?", imageName: "ic_angry"),
        Mood(name: "Distracted?", imageName: "ic_distracted"),
        Mood(name: "Tired?", imageName: "ic_tired")
    ]
}
