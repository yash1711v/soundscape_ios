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
                            .font(.custom("WixMadeforText-Regular", size: 16))
                        Text("Listen. Focus. Unwind.")
                            .font(.custom("WixMadeforText-Bold", size: 25))
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
                                    NavigationLink(destination: MusicListView()) {
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
                        
                        HStack {
                            Text("Sleep Stories For You")
                                .font(.custom("WixMadeforText-Regular", size: 16))
                            Spacer()
                            Button {
                                print("hi")
                            } label: {
                                Text("View More >")
                                    .font(.custom("WixMadeforText-Regular", size: 16))
                                    .foregroundColor(.white)
                            }
                        }
                        .padding()
                        
                        HStack {
                            Button {
                                print("hi")
                            } label: {
                                StoryCardView(title: "The Young Scout",
                                              imageName: "the_young_scout",
                                              songLength: "4:38 mins")
                            }
                            .foregroundColor(.white)
                            
                            Button {
                                print("hi")
                            } label: {
                                StoryCardView(title: "The Starry Journey",
                                              imageName: "the_starry_journey",
                                              songLength: "4:09 mins")
                            }
                            .foregroundColor(.white)
                        }
                        .padding()
                        
                        Text("Explore Different Sounds")
                            .font(.custom("WixMadeforText-Regular", size: 16))
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        LazyVStack {
                            ForEach(StorySoundData.sampleStoryList) { storySound in
                                Button {
                                    print("hi")
                                } label: {
                                    StorySoundCardView(storySound: storySound)
                                }
                                .foregroundColor(.white)
                            }
                        }
                        .padding(.horizontal)
                        .padding(.bottom)
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
