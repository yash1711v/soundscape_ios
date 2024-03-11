//
//  HomeView.swift
//  Soundscape
//
//  Created by admin on 28/02/24.
//

import SwiftUI

struct HomeView: View {
    @Binding var tabSelection: Int
    @State private var textSearch: String = ""
    
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
                                    NavigationLink(destination:
                                                    MusicListView(
                                                        name: mood.name,
                                                        imageName: mood.imageName)) {
                                                            MoodSelectView(mood: mood)
                                                        }
                                                        .foregroundColor(.white)
                                }
                            }
                        }
                        .padding(.horizontal)
                        
                        Text("Top Playlists")
                            .font(.wixMadeFont(.regular, fontSize: .title))
                            .padding(.top)
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        StaggeredGrid(list: PlaylistData.playlistHomeList, columns: 2, content: { playlist in
                            NavigationLink(
                                destination: playlist.name == "Explore More" ? AnyView(PlaylistListView()) : AnyView(MusicListView(
                                    name: playlist.name,
                                    imageName: playlist.imageName)))
                            { homePlaylistCardView(playlist: playlist) }
                            .foregroundColor(.white)
                            
                        })
                        .padding(.horizontal)
                        
                        HStack {
                            Text("Sleep Stories For You")
                                .font(.wixMadeFont(.regular, fontSize: .title))
                            Spacer()
                            Button {
                                tabSelection = 2
                            } label: {
                                Text("View More >")
                                    .font(.wixMadeFont(.regular, fontSize: .subTitle))
                                    .foregroundColor(.white)
                            }
                        }
                        .padding(.bottom)
                        .padding(.horizontal)
                        
                        HStack {
                            NavigationLink(destination: StoryDetailView(mainStorySound: MainStorySoundData.sampleStorySound)) {
                                StoryCardView(mainStorySound: MainStorySoundData.sampleStorySound)
                            }
                            .foregroundColor(.white)
                            
                            NavigationLink(destination: StoryDetailView(mainStorySound: MainStorySoundData.theStarrryJourneyItem)) {
                                StoryCardView(mainStorySound: MainStorySoundData.theStarrryJourneyItem)
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
                                NavigationLink(destination: MusicListView(name: storySound.name, imageName: storySound.imageName)) {
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
    HomeView(tabSelection: .constant(1))
}
