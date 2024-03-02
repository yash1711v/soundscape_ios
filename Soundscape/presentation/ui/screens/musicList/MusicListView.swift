//
//  MusicListView.swift
//  Soundscape
//
//  Created by Aman Kumar on 01/03/24.
//

import SwiftUI

struct MusicListView: View {
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView(.vertical, showsIndicators: false) {
                    Image("sleep")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 250, alignment: .top)
                    
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
                        ForEach(MusicData.musicList) { music in
                            MusicListItemView(music: music)
                        }
                    }
                    
                }
            }
            .navigationTitle("Sleep")
            .ignoresSafeArea()
        }
    }
}

#Preview {
    MusicListView()
}