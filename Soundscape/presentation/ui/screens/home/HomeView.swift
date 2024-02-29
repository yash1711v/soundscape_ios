//
//  HomeView.swift
//  Soundscape
//
//  Created by admin on 28/02/24.
//

import SwiftUI

struct HomeView: View {
    @State private var textSearch: String = ""
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.black, Color("brandPurple")]), startPoint: .bottomLeading, endPoint: .topTrailing)
                    .ignoresSafeArea()
                
                VStack {
                    VStack {
                        Text("Hey, Guest!")
                            .font(.custom("WixMadeforText-Regular", size: 20))
                        Text("Listen. Focus. Unwind.")
                            .font(.custom("WixMadeforText-Bold", size: 30))
                    }
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        SearchBarView()
                        
                        VStack(alignment: .leading) {
                            Text("For Your Daily Mood")
                                .font(.custom("WixMadeforText-Regular", size: 20))
                                .bold()
                                .padding()
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack(spacing: 15) {
                                    ForEach(MoodData.moods) { mood in
                                        Button {
                                            print("hi")
                                        } label: {
                                            MoodSelectView(mood: mood)
                                                .foregroundColor(.white)
                                        }
                                    }
                                }
                            }
                            .padding()
                        }
                        
                        VStack {
                            HStack() {
                                Text("Top Playlists")
                                    .font(.custom("WixMadeforText-Regular", size: 16))
                                    .padding()
                                Spacer()
                            }
                            
                            LazyVGrid(columns: columns) {
                                ForEach(PlaylistData.playlists) { playlist in
                                    PlaylistCardView(playlist: playlist)
                                }
                            }
                        }
                        
                        Text("Explore Different Sounds")
                        
                        StorySoundCardView()
                            .padding()
                        
                        StorySoundCardView()
                            .padding()
                        
                        StorySoundCardView()
                            .padding()
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
