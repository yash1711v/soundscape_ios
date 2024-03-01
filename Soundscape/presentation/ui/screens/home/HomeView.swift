//
//  HomeView.swift
//  Soundscape
//
//  Created by admin on 28/02/24.
//

import SwiftUI

struct HomeView: View {
    @State private var textSearch: String = ""
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.black, Color("brandPurple")]), startPoint: .bottomLeading, endPoint: .topTrailing)
                    .ignoresSafeArea()
                
                VStack {
                    Group {
                        Text("Hey, Guest!")
                            .font(.custom("WixMadeforText-Regular", size: 20))
                        Text("Listen. Focus. Unwind.")
                            .font(.custom("WixMadeforText-Bold", size: 30))
                    }
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        SearchBarView()
                        
                        Text("For Your Daily Mood")
                            .font(.custom("WixMadeforText-Bold", size: 20))
                            .padding()
                            .font(.custom("WixMadeforText-Regular", size: 16))
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack(spacing: 15) {
                                ForEach(MoodData.moods) { mood in
                                    Button {
                                        print("hi")
                                    } label: {
                                        MoodSelectView(mood: mood)
                                            .foregroundColor(.white)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                        
                        Text("Top Playlists")
                            .font(.custom("WixMadeforText-Regular", size: 16))
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        LazyVGrid(columns: columns) {
                            ForEach(PlaylistData.playlists) { playlist in
                                PlaylistCardView(playlist: playlist)
                            }
                        }
                        .padding(.horizontal)
                        
                        Text("Explore Different Sounds")
                            .font(.custom("WixMadeforText-Regular", size: 16))
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        LazyVStack {
                            ForEach(StorySoundData.sampleStoryList) { storySound in
                                StorySoundCardView(storySound: storySound)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
