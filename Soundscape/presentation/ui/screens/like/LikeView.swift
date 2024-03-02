//
//  LikeView.swift
//  Soundscape
//
//  Created by admin on 28/02/24.
//

import SwiftUI

struct LikeView: View {
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
                        ForEach(MusicData.musicList) { music in
                            MusicListItemView(music: music)
                        }
                    }
                    Spacer()
                }
            }
            .background(
                ZStack {
                    Circle()
                        .fill(
                            .linearGradient(colors: [.darkBlue, .black],
                                            startPoint: .topTrailing,
                                            endPoint: .bottom)
                        )
                        .frame(width: 600, height: 600)
                        .offset(x: -100, y: -520)
                        .blur(radius: 30)
                    
                    Image("ic_top_line_shape")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 400)
                        
                }
            )
            .background(
                ZStack {
                    Circle()
                        .fill(
                            .linearGradient(colors: [.darkYellow, .black],
                                            startPoint: .topTrailing,
                                            endPoint: .bottomLeading)
                        )
                        .frame(width: 500, height: 500)
                        .offset(x: 90, y: -30)
                        .blur(radius: 100)
                        
                }
            )
            .background(
                ZStack {
                    Circle()
                        .fill(
                            .linearGradient(colors: [.darkBlue, .black],
                                            startPoint: .topTrailing,
                                            endPoint: .bottom)
                        )
                        .frame(width: 700, height: 700)
                        .offset(x: -90, y: 120)
                        .blur(radius: 30)
                        
                }
            )
            .navigationTitle("Liked Tunes")
        }
    }
}

#Preview {
    LikeView()
}
