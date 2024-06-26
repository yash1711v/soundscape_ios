//
//  SearchView.swift
//  Soundscape
//
//  Created by admin on 20/03/24.
//

import SwiftUI
import Lottie

struct SearchView: View {
    @State var textSearch = ""
    @EnvironmentObject var appViewModel: AppViewModel
    var filteredAudioFetchList: [AudioFetch] {
        if textSearch.isEmpty {
            return appViewModel.audioFetchList
        } else {
            return appViewModel.audioFetchList.filter { $0.name.localizedCaseInsensitiveContains(textSearch) }
        }
    }
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
                SearchBarView(textSearch: $textSearch)
                ScrollView {
                    LazyVStack {
                        ForEach(filteredAudioFetchList.indices, id: \.self) { index in
                            let audioFetch = filteredAudioFetchList[index]
                            let isLiked = Binding(
                                    get: {
                                        audioFetch.type == "Story Time" ? appViewModel.likedSongs[audioFetch.id] ?? appViewModel.checkStoryInDbList(id: audioFetch.id) : appViewModel.likedSongs[audioFetch.id] ?? appViewModel.checkSongInDbList(id: audioFetch.id)
                                    },
                                    set: { newValue in
                                        // Update liked status in the view model when changed
                                        appViewModel.likedSongs[audioFetch.id] = newValue
                                    }
                                )
                            MusicListItemView(audioFetch: audioFetch, isLiked: isLiked) {
                                Task {
                                    if audioFetch.type == "Story Time" {
                                        if appViewModel.likedSongs[audioFetch.id] ?? appViewModel.checkStoryInDbList(id: audioFetch.id) {
                                            await appViewModel.deleteStory(audioFetch: audioFetch)
                                            appViewModel.likedSongs[audioFetch.id] = false
                                        } else {
                                            await appViewModel.saveStory(
                                                audioFetch: AudioFetch(
                                                    id: audioFetch.id,
                                                    name: audioFetch.name,
                                                    assetPath: audioFetch.assetPath,
                                                    image: "searchStoryBg",
                                                    type: audioFetch.type,
                                                    isLiked: true))
                                            appViewModel.likedSongs[audioFetch.id] = true
                                        }
                                    } else {
                                        if appViewModel.likedSongs[audioFetch.id] ?? appViewModel.checkSongInDbList(id: audioFetch.id) {
                                            await appViewModel.deleteSong(audioFetch: audioFetch)
                                            appViewModel.likedSongs[audioFetch.id] = false
                                        } else {
                                            await appViewModel.saveSong(
                                                audioFetch: AudioFetch(
                                                    id: audioFetch.id,
                                                    name: audioFetch.name,
                                                    assetPath: audioFetch.assetPath,
                                                    image: "searchSongBg",
                                                    type: audioFetch.type,
                                                    isLiked: true))
                                            appViewModel.likedSongs[audioFetch.id] = true
                                        }
                                    }
                                }
                            }
                            .onTapGesture {
                                // Set current index to the selected index
                                appViewModel.currentIndex = index
                                
                                // Get the selected episode
                                let selectedAudioFetch = filteredAudioFetchList[index]
                                let episode = Episode(name: "",
                                                      songName: selectedAudioFetch.name,
                                                      imageName: selectedAudioFetch.type == "Story Time" ? "searchStoryBg" : "searchSongBg",
                                                      songPath: selectedAudioFetch.assetPath,
                                                      audioFetchId: selectedAudioFetch.id,
                                                      songType: selectedAudioFetch.type)
                                
                                // Create episode list
                                var episodeListNew: [Episode] = []
                                for audioFetch in filteredAudioFetchList {
                                    let episode = Episode(name: "",
                                                          songName: audioFetch.name,
                                                          imageName: selectedAudioFetch.type == "Story Time" ? "searchStoryBg" : "searchSongBg",
                                                          songPath: audioFetch.assetPath,
                                                          audioFetchId: audioFetch.id,
                                                          songType: audioFetch.type)
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
                        await appViewModel.getAllSong()
                        await appViewModel.getAllSongFromDb()
                        await appViewModel.getAllStoryFromDb()
                    }
                    if appViewModel.isLoading {
                        LottieLoadingView()
                    }
                }
                .padding(.bottom, appViewModel.showBottomPlayer ? 60 : 0)
            }
            
        }
    }
}

#Preview {
    SearchView().environmentObject(AppViewModel())
}

struct LottieLoadingView: View {
    var body: some View {
        VStack {
            Text("Take A Deep Breath")
                .font(.wixMadeFont(.bold, fontSize: .heading))
                .padding()
            
            LottieView(animationFileName: "loading", loopMode: .loop)
                .frame(height: 100)
                .padding()
            
            Text("Loading Screen...")
                .font(.wixMadeFont(.regular, fontSize: .title))
                .padding()
        }
    }
}
