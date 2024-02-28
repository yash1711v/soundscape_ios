//
//  HomeView.swift
//  Soundscape
//
//  Created by admin on 28/02/24.
//

import SwiftUI

struct HomeView: View {
    @State private var textSearch: String = ""
    
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
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                                .foregroundColor(.white)
                                .padding(.leading, 10)
                            
                            TextField("Sarch song", text: $textSearch)
                                .foregroundColor(.white)
                        }
                        .padding(8)
                        .background(Color.gray)
                        .cornerRadius(30)
                        .padding(.horizontal, 20)
                        
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
                            
                            Text("Top Playlists")
                                .font(.custom("WixMadeforText-Regular", size: 16))
                                .padding()
                            
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
