//
//  MusicListView.swift
//  Soundscape
//
//  Created by Aman Kumar on 01/03/24.
//

import SwiftUI

struct MusicListView: View {
    @StateObject var viewModel = MusicListViewModel()
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
