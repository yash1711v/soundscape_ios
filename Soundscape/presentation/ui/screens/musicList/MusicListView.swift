//
//  MusicListView.swift
//  Soundscape
//
//  Created by Aman Kumar on 01/03/24.
//

import SwiftUI

struct MusicListView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    var name: String
    var imageName: String
    
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                Section {
                    HStack(spacing: 130) {
                        Button {
                            // Create episode list
                            var episodeListNew: [Episode] = []
                            for audioFetch in appViewModel.audioFetchList {
                                let episode = Episode(name: "",
                                                      songName: audioFetch.name,
                                                      imageName: imageName,
                                                      songPath: audioFetch.assetPath)
                                episodeListNew.append(episode)
                            }
                            appViewModel.episodeList = episodeListNew
                            appViewModel.episode = episodeListNew.first ?? EpisodeData.sampleEpisodeData
                            appViewModel.currentIndex = 0
                            appViewModel.musicPlayerTitle = name
                            appViewModel.showBottomPlayer = true
                            appViewModel.playSound(sound: appViewModel.episode.songPath)
                        } label: {
                            Label("Play All", systemImage: "play")
                                .foregroundColor(.white)
                                .modifier(OutlineSmallButtonStyle())
                        }
                        
                        
                        Button {
                            // Create episode list
                            var episodeListNew: [Episode] = []
                            for audioFetch in appViewModel.audioFetchList {
                                let episode = Episode(name: "",
                                                      songName: audioFetch.name,
                                                      imageName: imageName,
                                                      songPath: audioFetch.assetPath)
                                episodeListNew.append(episode)
                            }
                            appViewModel.episodeList = episodeListNew.shuffled()
                            appViewModel.episode = appViewModel.episodeList.first ?? EpisodeData.sampleEpisodeData
                            appViewModel.musicPlayerTitle = name
                            appViewModel.showBottomPlayer = true
                            appViewModel.currentIndex = 0
                            appViewModel.playSound(sound: appViewModel.episode.songPath)
                        } label: {
                            Label("Shuffle", systemImage: "shuffle")
                                .foregroundColor(.black)
                                .modifier(FilledSmallButtonStyle())
                        }
                    }
                    .padding(.top)
                    .padding(.bottom)
                    
                    LazyVStack {
                        ForEach(appViewModel.audioFetchList.indices, id: \.self) { index in
                            let audioFetch = appViewModel.audioFetchList[index]
                            @State var isLiked = appViewModel.checkItemInDbList(id: audioFetch.id)
                            MusicListItemView(audioFetch: audioFetch, isLiked: isLiked) {
                                Task {
                                    await appViewModel.saveSong(audioFetch:
                                                            AudioFetch(id: audioFetch.id,
                                                                       name: audioFetch.name,
                                                                       assetPath: audioFetch.assetPath,
                                                                       image: imageName,
                                                                       type: audioFetch.type,
                                                                       isLiked: true))
                                }
                            }
                            .onTapGesture {
                                // Set current index to the selected index
                                appViewModel.currentIndex = index
                                
                                // Get the selected episode
                                let selectedAudioFetch = appViewModel.audioFetchList[index]
                                let episode = Episode(name: "",
                                                      songName: selectedAudioFetch.name,
                                                      imageName: imageName,
                                                      songPath: selectedAudioFetch.assetPath,
                                                      songType: selectedAudioFetch.type)
                                
                                // Create episode list
                                var episodeListNew: [Episode] = []
                                for audioFetch in appViewModel.audioFetchList {
                                    let episode = Episode(name: "",
                                                          songName: audioFetch.name,
                                                          imageName: imageName,
                                                          songPath: audioFetch.assetPath,
                                                          songType: selectedAudioFetch.type)
                                    episodeListNew.append(episode)
                                }
                                appViewModel.episodeList = episodeListNew
                                
                                // Update the episode in the view model and play the sound
                                withAnimation(.spring) {
                                    appViewModel.episode = episode
                                    appViewModel.showBottomPlayer = true
                                    appViewModel.isShuffle = false
                                    appViewModel.playSound(sound: appViewModel.episode.songPath)
                                    appViewModel.musicPlayerTitle = selectedAudioFetch.type
                                }
                            }
                        }
                    }
                    .task {
                        if name == "Monday Morning Blues" {
                            await appViewModel.getSongSection(songSection: "monday mornings")
                        } else {
                            await appViewModel.getSongSection(songSection: name)
                        }
                        await appViewModel.getAllSongFromDb()
                    }
                    if appViewModel.isLoading {
                        LoadingView()
                    }
                } header: {
                    GeometryReader { geometry in
                        let offsetY = geometry.frame(in: .global).minY
                        let isScrolled = offsetY > 0
                        Spacer()
                            .frame(height: isScrolled ? 260 + offsetY : 260)
                            .background {
                                Image(imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .offset(y: isScrolled ? -offsetY : 0)
                                    .scaleEffect(isScrolled ? offsetY / 2000 + 1 : 1)
                                    .opacity(0.5)
                            }
                    }
                    .frame(height: 260)
                }
            }
            .padding(.bottom, 70)
        }
        .alert(item: $appViewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
        .navigationTitle(name)
        .ignoresSafeArea()
    }
}

#Preview {
    MusicListView(name: "Sleep", imageName: "sleep").environmentObject(AppViewModel())
}
