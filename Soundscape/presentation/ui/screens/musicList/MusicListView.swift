//
//  MusicListView.swift
//  Soundscape
//
//  Created by Aman Kumar on 01/03/24.
//

import SwiftUI

struct MusicListView: View {
    @StateObject var viewModel = MusicListViewModel()
    @EnvironmentObject var appViewModel: AppViewModel
    var name: String
    var imageName: String
    
    var body: some View {
            ZStack {
                Color.backgroundGray
                
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
                            ForEach(viewModel.audioFetch) { audioFetch in
                                MusicListItemView(audioFetch: audioFetch)
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
                    } header: {
                        Image(imageName)
                            .resizable()
                            .frame(height: 240)
                            .opacity(0.5)
                    }
                }
                .padding(.bottom, 70)
            }
            .task {
                viewModel.getSongSection(songSection: name)
            }
            .navigationTitle(name)
            .ignoresSafeArea()
    }
}

#Preview {
    MusicListView(name: "Sleep", imageName: "sleep")
}


func audio(audioFetch: Resource<Any>) -> [AudioFetch] {
    switch audioFetch {
    case .error(<#T##String#>, <#T##T?#>)
    }
}
