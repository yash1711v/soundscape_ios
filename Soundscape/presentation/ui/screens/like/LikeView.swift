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
                    Text(viewModel.isSongSelected ? "Your Daily Zen" : "Your Sleep Stories")
                        .font(.wixMadeFont(.bold, fontSize: .subHeading))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    HStack {
                        Button {
                            withAnimation(.easeInOut) {
                                viewModel.isSongSelected = true
                                viewModel.getAllSong()
                            }
                        } label: {
                            Label("Tunes", systemImage: "music.note")
                                .font(.wixMadeFont(.regular, fontSize: .title))
                                .foregroundColor(viewModel.isSongSelected ? .black : .white)
                                .background(
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 30)
                                            .stroke(Color.white, lineWidth: viewModel.isSongSelected ? 0 : 1)
                                            .frame(width: 150, height: 40)
                                        
                                        RoundedRectangle(cornerRadius: 30)
                                            .frame(width: 150, height: 40)
                                            .foregroundColor(viewModel.isSongSelected ? .white : .clear)
                                    }
                                )
                        }
                        
                        Spacer()
                        
                        Button {
                            withAnimation(.easeInOut) {
                                viewModel.isSongSelected = false
                                viewModel.getAllStory()
                            }
                        } label: {
                            Label("Stories", systemImage: "books.vertical")
                                .font(.wixMadeFont(.regular, fontSize: .title))
                                .foregroundColor(viewModel.isSongSelected ? .white : .black)
                                .background(
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 30)
                                            .stroke(Color.white, lineWidth: viewModel.isSongSelected ? 1 : 0)
                                            .frame(width: 150, height: 40)
                                        
                                        RoundedRectangle(cornerRadius: 30)
                                            .frame(width: 150, height: 40)
                                            .foregroundColor(viewModel.isSongSelected ? .clear : .white)
                                    }
                                )
                        }
                    }
                    .padding(.horizontal, 40)
                    .padding()
                    
                    LazyVStack {
                        ForEach(viewModel.audioFetchList.indices, id: \.self) { index in
                            let audioFetch = viewModel.audioFetchList[index]
                            MusicListItemView(audioFetch: audioFetch) {
                                viewModel.isSongSelected ? viewModel.deleteSong(audioFetch: audioFetch) : viewModel.deleteStory(audioFetch: audioFetch)
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
            .navigationTitle(viewModel.isSongSelected ? "Liked Tunes" : "Liked Stories")
        }
    }
}

#Preview {
    LikeView()
}
