//
//  LikeView.swift
//  Soundscape
//
//  Created by admin on 28/02/24.
//

import SwiftUI

struct LikeView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    @StateObject var viewModel = LikeViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView(.vertical, showsIndicators: false) {
                    Text("Your Daily Zen")
                        .font(.wixMadeFont(.bold, fontSize: .subHeading))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    HStack {
                        Button {
                            print("hi")
                        } label: {
                            Label("Tunes", systemImage: "music.note")
                                .font(.wixMadeFont(.regular, fontSize: .title))
                                .foregroundColor(.black)
                        }
                        .modifier(FilledSmallButtonStyle())
                        
                        Spacer()
                        
                        Button {
                            print("hi")
                        } label: {
                            Label("Stories", systemImage: "books.vertical")
                                .font(.wixMadeFont(.regular, fontSize: .title))
                                .foregroundColor(.white)
                        }
                        .modifier(OutlineSmallButtonStyle())
                    }
                    .padding(.horizontal, 40)
                    .padding()
                    
                    LazyVStack {
                        ForEach(viewModel.audioFetchList.indices, id: \.self) { index in
                            let audioFetch = viewModel.audioFetchList[index]
                            MusicListItemView(audioFetch: audioFetch) {
                                viewModel.deleteSong(audioFetch: audioFetch)
                            }
                            .onTapGesture {
                                // Set current index to the selected index
                                appViewModel.currentIndex = index
                                
                                // Get the selected episode
                                let selectedAudioFetch = viewModel.audioFetchList[index]
                                let episode = Episode(name: "",
                                                      songName: selectedAudioFetch.name,
                                                      imageName: selectedAudioFetch.image,
                                                      songPath: selectedAudioFetch.assetPath)
                                
                                // Create episode list
                                var episodeListNew: [Episode] = []
                                for audioFetch in viewModel.audioFetchList {
                                    let episode = Episode(name: "",
                                                          songName: audioFetch.name,
                                                          imageName: audioFetch.image,
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
                                    appViewModel.musicPlayerTitle = selectedAudioFetch.type
                                }
                            }
                        }
                    }
                    .task {
                        viewModel.getAllSong()
                    }
                    .padding(.bottom, 70)
                    if viewModel.isLoading {
                        LoadingView()
                    }
                }
            }
            .background(
                Image("like_background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
            )
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: alertItem.title,
                      message: alertItem.message,
                      dismissButton: alertItem.dismissButton)
            }
            .navigationTitle("Liked Tunes")
        }
    }
}

#Preview {
    LikeView()
}
