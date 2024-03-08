//
//  MusicListView.swift
//  Soundscape
//
//  Created by Aman Kumar on 01/03/24.
//

import SwiftUI

struct MusicListView: View {
    var name: String
    var imageName: String
    
    var body: some View {
            ZStack {
                Color.backgroundGray
                
                ScrollView(.vertical, showsIndicators: false) {
                    Image(imageName)
                        .resizable()
                        .frame(height: 240)
                        .background(
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.black)
                                    .opacity(0.7)
                                    .frame(width: .infinity, height: 60)
                                    .blur(radius: 10)
                                    .padding(.top, 190)
                            }
                        )
                    
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
            .navigationTitle(name)
            .ignoresSafeArea()
    }
}

#Preview {
    MusicListView(name: "Sleep", imageName: "sleep")
}
