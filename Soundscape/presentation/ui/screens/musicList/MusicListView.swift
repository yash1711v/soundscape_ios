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
                                                      songPath: audioFetch.assetPath,
                                                      audioFetchId: audioFetch.id,
                                                      songType: audioFetch.type)
                                episodeListNew.append(episode)
                            }
                            appViewModel.episodeList = episodeListNew
                            appViewModel.episode = episodeListNew.first ?? EpisodeData.sampleEpisodeData
                            appViewModel.currentIndex = 0
                            appViewModel.musicPlayerTitle = episodeListNew.first?.songType ?? EpisodeData.sampleEpisodeData.songType
                            appViewModel.showBottomPlayer = true
                            appViewModel.playSound(sound: appViewModel.episode.songPath)
                            
                            appViewModel.isShuffle = false
                        } label: {
                            Label("Play All", systemImage: "play.fill")
                                .font(.wixMadeFont(.regular, fontSize: .title))
                                .foregroundColor(appViewModel.isShuffle ? .white : .black)
                                .background(
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 30)
                                            .stroke(Color.white, lineWidth: appViewModel.isShuffle ? 1 : 0)
                                            .frame(width: 150, height: 40)
                                        
                                        RoundedRectangle(cornerRadius: 30)
                                            .frame(width: 150, height: 40)
                                            .foregroundColor(appViewModel.isShuffle ? .clear : .white)
                                    }
                                )
                        }
                        
                        
                        Button {
                            // Create episode list
                            var episodeListNew: [Episode] = []
                            for audioFetch in appViewModel.audioFetchList {
                                let episode = Episode(name: "",
                                                      songName: audioFetch.name,
                                                      imageName: imageName,
                                                      songPath: audioFetch.assetPath,
                                                      audioFetchId: audioFetch.id,
                                                      songType: audioFetch.type)
                                episodeListNew.append(episode)
                            }
                            appViewModel.episodeList = episodeListNew.shuffled()
                            appViewModel.episode = appViewModel.episodeList.first ?? EpisodeData.sampleEpisodeData
                            appViewModel.musicPlayerTitle = name
                            appViewModel.showBottomPlayer = true
                            appViewModel.currentIndex = 0
                            appViewModel.playSound(sound: appViewModel.episode.songPath)
                            
                            appViewModel.isShuffle = true
                        } label: {
                            Label("Shuffle", systemImage: "shuffle")
                                .font(.wixMadeFont(.regular, fontSize: .title))
                                .foregroundColor(appViewModel.isShuffle ? .black : .white)
                                .background(
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 30)
                                            .stroke(Color.white, lineWidth: appViewModel.isShuffle ? 0 : 1)
                                            .frame(width: 150, height: 40)
                                        
                                        RoundedRectangle(cornerRadius: 30)
                                            .frame(width: 150, height: 40)
                                            .foregroundColor(appViewModel.isShuffle ? .white : .clear)
                                    }
                                )
                        }
                    }
                    .padding(.top)
                    .padding(.bottom)
                    
                    LazyVStack {
                        ForEach(appViewModel.audioFetchList.indices, id: \.self) { index in
                            let audioFetch = appViewModel.audioFetchList[index]
                            let isLiked = Binding(
                                    get: {
                                        appViewModel.likedSongs[audioFetch.id] ?? appViewModel.checkSongInDbList(id: audioFetch.id)
                                    },
                                    set: { newValue in
                                        // Update liked status in the view model when changed
                                        appViewModel.likedSongs[audioFetch.id] = newValue
                                    }
                                )
                            MusicListItemView(audioFetch: audioFetch, isLiked: isLiked) {
                                Task {
                                    if appViewModel.likedSongs[audioFetch.id] ?? appViewModel.checkSongInDbList(id: audioFetch.id) {
                                        
                                        await appViewModel.deleteSong(audioFetch: audioFetch)
                                        appViewModel.likedSongs[audioFetch.id] = false
                                    } else {
                                        await appViewModel.saveSong(audioFetch:
                                                                        AudioFetch(id: audioFetch.id,
                                                                                   name: audioFetch.name,
                                                                                   assetPath: audioFetch.assetPath,
                                                                                   image: imageName,
                                                                                   type: audioFetch.type,
                                                                                   isLiked: true))
                                        appViewModel.likedSongs[audioFetch.id] = true
                                    }
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
                                                      audioFetchId: selectedAudioFetch.id,
                                                      songType: selectedAudioFetch.type)
                                
                                // Create episode list
                                var episodeListNew: [Episode] = []
                                for audioFetch in appViewModel.audioFetchList {
                                    let episode = Episode(name: "",
                                                          songName: audioFetch.name,
                                                          imageName: imageName,
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
                    .padding(.bottom, appViewModel.showBottomPlayer ? 70 : 0)
                    .task {
                        if name == "Monday Morning Blues" {
                            await appViewModel.getSongSection(songSection: "monday mornings")
                        } else if name == "Meditate" {
                            await appViewModel.getSongSection(songSection: "meditation")
                        } else {
                            await appViewModel.getSongSection(songSection: name)
                        }
                        await appViewModel.getAllSongFromDb()
                    }
                    if appViewModel.isLoading {
                        LoadingView()
                    }
                } header: {
                    if (name == "Sad?"
                        || name == "Romantic?"
                        || name == "Angry?"
                        || name == "Anxious?"
                        || name == "Distracted?"
                        || name == "Tired?")
                    {
                        GeometryReader { geometry in
                            let offsetY = geometry.frame(in: .global).minY
                            let isScrolled = offsetY > 0
                            ZStack {
                                switch(name) {
                                case "Sad?":
                                    LinearGradient(colors: [Color(hex: 0xA0C7E7), Color(hex: 0x66899A, alpha: 0)], startPoint: .top, endPoint: .bottom)
                                        .offset(y: isScrolled ? -offsetY : 0)
                                        .scaleEffect(isScrolled ? offsetY / 2000 + 1 : 1)
                                case "Romantic?":
                                    LinearGradient(colors: [Color(hex: 0xDD7CA2), Color(hex: 0xA77C8D, alpha: 0)], startPoint: .top, endPoint: .bottom)
                                        .offset(y: isScrolled ? -offsetY : 0)
                                        .scaleEffect(isScrolled ? offsetY / 2000 + 1 : 1)
                                case "Angry?":
                                    LinearGradient(colors: [Color(hex: 0xFFB5AB), Color(hex: 0xD02121, alpha: 0)], startPoint: .top, endPoint: .bottom)
                                        .offset(y: isScrolled ? -offsetY : 0)
                                        .scaleEffect(isScrolled ? offsetY / 2000 + 1 : 1)
                                case "Anxious?":
                                    LinearGradient(colors: [Color(hex: 0xACACFD), Color(hex: 0x9898B5, alpha: 0)], startPoint: .top, endPoint: .bottom)
                                        .offset(y: isScrolled ? -offsetY : 0)
                                        .scaleEffect(isScrolled ? offsetY / 2000 + 1 : 1)
                                case "Distracted?":
                                    LinearGradient(colors: [Color(hex: 0xE4FCCC), Color(hex: 0xD1DEB5, alpha: 0)], startPoint: .top, endPoint: .bottom)
                                        .offset(y: isScrolled ? -offsetY : 0)
                                        .scaleEffect(isScrolled ? offsetY / 2000 + 1 : 1)
                                case "Tired?":
                                    LinearGradient(colors: [Color(hex: 0xD4D4F7), Color(hex: 0x91919E, alpha: 0)], startPoint: .top, endPoint: .bottom)
                                        .offset(y: isScrolled ? -offsetY : 0)
                                        .scaleEffect(isScrolled ? offsetY / 2000 + 1 : 1)
                                default:
                                    LinearGradient(colors: [Color(hex: 0xDD7CA2), Color(hex: 0xA77C8D, alpha: 0)], startPoint: .top, endPoint: .bottom)
                                        .offset(y: isScrolled ? -offsetY : 0)
                                        .scaleEffect(isScrolled ? offsetY / 2000 + 1 : 1)
                                }
                                
                                Image("moodThread")
                                    .resizable()
                                    .scaledToFit()
                                    .padding(.top, 35)
                                    .padding(.leading, 120)
                                    .offset(y: isScrolled ? -offsetY : 0)
                                    .scaleEffect(isScrolled ? offsetY / 2000 + 1 : 1)
                            }
                            .frame(height: isScrolled ? 150 + offsetY : 150)
                            ZStack {
                                HStack{
                                    Spacer()
                                    Image(imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 80, height: 80)
                                        .clipShape(Circle())
                                        .padding()
                                        .padding(.top, 50)
                                }
                            }
                        }
                        .frame(height: 150)
                    } else {
                        GeometryReader { geometry in
                            let offsetY = geometry.frame(in: .global).minY
                            let isScrolled = offsetY > 0
                            ZStack {
                                LinearGradient(colors: [.black, .gray.opacity(0)], startPoint: .bottom, endPoint: .top)
                                    .offset(y: isScrolled ? -offsetY : 0)
                                    .scaleEffect(isScrolled ? offsetY / 2000 + 1 : 1)
                                    .background {
                                        Image(imageName)
                                            .resizable()
                                            .offset(y: isScrolled ? -offsetY : 0)
                                            .scaleEffect(isScrolled ? offsetY / 2000 + 1 : 1)
                                            .opacity(0.6)
                                    }
                            }
                            .frame(height: isScrolled ? 260 + offsetY : 260)
                                
                        }
                        .frame(height: 260)
                    }
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
