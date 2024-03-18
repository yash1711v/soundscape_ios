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
                        ForEach(appViewModel.audioFetchList) { audioFetch in
                            @State var isLiked = appViewModel.checkItemInDbList(id: audioFetch.id)
                            MusicListItemView(audioFetch: audioFetch, isLiked: isLiked) {
                                
                                Task {
                                    await appViewModel.saveSong(audioFetch: audioFetch.withIsLiked(true))
                                }
                            }
                            .onTapGesture {
                                let episode = Episode(name: "",
                                                      songName: audioFetch.name,
                                                      imageName: imageName,
                                                      songPath: audioFetch.assetPath)
                                withAnimation(.spring) {
                                    appViewModel.episode = episode
                                    appViewModel.showBottomPlayer = true
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
