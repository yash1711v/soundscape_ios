//
//  HomeView.swift
//  Soundscape
//
//  Created by admin on 28/02/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    VStack {
                        Text("Hey, Guest!")
                            .font(.custom("WixMadeforText-Regular", size: 20))
                        Text("Listen. Focus. Unwind.")
                            .font(.custom("WixMadeforText-Bold", size: 30))
                    }
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(alignment: .leading) {
                            Text("For Your Daily Mood")
                                .font(.custom("WixMadeforText-Regular", size: 20))
                                .bold()
                                .padding()
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack(spacing: 15) {
                                    ForEach(MoodData.moods) { mood in
                                        MoodSelectView(mood: mood)
                                    }
                                }
                            }
                            .padding()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
