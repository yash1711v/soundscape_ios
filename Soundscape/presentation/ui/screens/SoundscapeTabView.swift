//
//  ContentView.swift
//  Soundscape
//
//  Created by admin on 28/02/24.
//

import SwiftUI

struct SoundscapeTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            StoryView()
                .tabItem {
                    Label("Story", systemImage: "books.vertical")
                }
            
            LikeView()
                .tabItem {
                    Label("Liked", systemImage: "heart")
                }
            
            SettingView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape" )
                }
        }
        .tint(Color.white)
    }
}

#Preview {
    SoundscapeTabView()
}
