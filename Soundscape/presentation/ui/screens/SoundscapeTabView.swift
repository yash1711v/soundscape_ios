//
//  ContentView.swift
//  Soundscape
//
//  Created by admin on 28/02/24.
//

import SwiftUI

struct SoundscapeTabView: View {
    @State private var tabSelection = 1
    @State private var showBottomPlayer: Bool = true
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            TabView(selection: $tabSelection) {
                HomeView(tabSelection: $tabSelection)
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                    .tag(1)
                
                StoryView()
                    .tabItem {
                        Label("Story", systemImage: "books.vertical")
                    }
                    .tag(2)
                
                LikeView()
                    .tabItem {
                        Label("Liked", systemImage: "heart")
                    }
                    .tag(3)
                
                SettingView()
                    .tabItem {
                        Label("Settings", systemImage: "gearshape" )
                    }
                    .tag(4)
            }
            .tint(Color.white)
            if showBottomPlayer {
                BottomMusicPlayerView()
            }
        }
    }
}

#Preview {
    SoundscapeTabView()
}
