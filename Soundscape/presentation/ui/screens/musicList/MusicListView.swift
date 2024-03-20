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
                            print("hi")
                        } label: {
                            Label("Play All", systemImage: "play")
                                .foregroundColor(.white)
                        }
                        .modifier(OutlineSmallButtonStyle())
                        
                        Button {
                            print("hi")
                        } label: {
                            Label("Shuffle", systemImage: "shuffle")
                                .foregroundColor(.black)
                        }
                        .modifier(FilledSmallButtonStyle())
                    }
                    .padding(.top)
                    .padding(.bottom)
                    
                    LazyVStack {
                        ForEach(appViewModel.audioFetchList.indices, id: \.self) { index in
                            let audioFetch = appViewModel.audioFetchList[index]
                            @State var isLiked = appViewModel.checkItemInDbList(id: audioFetch.id)
                            MusicListItemView(audioFetch: audioFetch, isLiked: isLiked) {
                                Task {
                                    await appViewModel.saveSong(audioFetch: audioFetch.withIsLiked(true))
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
                                                      songPath: selectedAudioFetch.assetPath)
                                
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
                                
                                // Update the episode in the view model and play the sound
                                withAnimation(.spring) {
                                    appViewModel.episode = episode
                                    appViewModel.showBottomPlayer = true
                                    appViewModel.isShuffle = false
                                    appViewModel.playSound(sound: appViewModel.episode.songPath)
                                }
                            }
                        }
                    }
                    .task {
                        await appViewModel.getSongSection(songSection: name)
                        await appViewModel.getAllSongFromDb()
                    }
                    if appViewModel.isLoading {
                        LoadingView()
                    }
                } header: {
                    Image(imageName)
                        .resizable()
                        .frame(height: 240)
                        .opacity(0.5)
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
    MusicListView(name: "Sleep", imageName: "sleep")
}
