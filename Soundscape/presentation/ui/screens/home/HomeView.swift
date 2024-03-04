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
                VStack {
                    Group {
                        Text("Hey, Guest!")
                            .font(.wixMadeFont(.regular, fontSize: .subTitle))
                        Text("Listen. Focus. Unwind.")
                            .font(.wixMadeFont(.bold, fontSize: .heading))
                    }
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        SearchBarView()
                        
                        Text("For Your Daily Mood")
                            .font(.wixMadeFont(.regular, fontSize: .title))
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
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
                            .font(.wixMadeFont(.regular, fontSize: .title))
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
                                .font(.wixMadeFont(.regular, fontSize: .title))
                            Spacer()
                            Button {
                                print("hi")
                            } label: {
                                Text("View More >")
                                    .font(.wixMadeFont(.regular, fontSize: .subTitle))
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
                        .padding(.horizontal)
                        
                        Text("Explore Different Sounds")
                            .font(.wixMadeFont(.regular, fontSize: .title))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            
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
            .background(
                Image("home_background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            )
        }
    }
}

#Preview {
    HomeView()
}
