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
                        .modifier(FilledButtonStyle())
                        
                        Spacer()
                        
                        Button {
                            print("hi")
                        } label: {
                            Label("Stories", systemImage: "books.vertical")
                                .font(.wixMadeFont(.regular, fontSize: .title))
                                .foregroundColor(.white)
                        }
                        .modifier(OutlineButtonStyle())
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
            .navigationTitle("Liked Tunes")
        }
    }
}

#Preview {
    LikeView()
}
