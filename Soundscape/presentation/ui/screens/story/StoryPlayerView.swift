//
//  StoryPlayerView.swift
//  Soundscape
//
//  Created by admin on 08/03/24.
//

import SwiftUI

struct StoryPlayerView: View {
    var episode: Episode
    @State var songPlaying: Bool = false
    @State private var currentTime: Double = 0
    @State private var totalDuration: Double = 1000
    @StateObject private var soundManager = SoundManager()
    
    var body: some View {
        ZStack {
            VStack {
                Text("Story Time")
                    .font(.wixMadeFont(.regular, fontSize: .title))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                Image(episode.imageName)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .frame(width: songPlaying ? 300 : 250, height: 300)
                    .padding(.horizontal, 50)
                    .animation(.bouncy(extraBounce: 0.3), value: songPlaying)
                
                HStack {
                    Text(episode.songName)
                        .font(.wixMadeFont(.bold, fontSize: .heading))
                    Spacer()
                    Image(systemName: "heart.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.gray)
                        .padding(10)
                }
                .padding()
                
                Slider(value: $currentTime, in: 0...totalDuration)
                    .accentColor(.white)
                    .padding(.horizontal)
                
                HStack {
                    Text(timeString(time: currentTime))
                        .font(.wixMadeFont(.regular, fontSize: .titleSmall))
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    Text(timeString(time: totalDuration))
                        .font(.wixMadeFont(.regular, fontSize: .titleSmall))
                        .foregroundColor(.gray)
                    
                }
                .padding(.horizontal)
                .padding(.bottom, 30)
                
                HStack (spacing: 50) {
                    Image(systemName: "shuffle")
                        .foregroundColor(.gray)
                    
                    HStack(spacing: 0) {
                        Image(systemName: "arrowtriangle.backward.fill")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Image(systemName: "arrowtriangle.backward.fill")
                            .resizable()
                            .frame(width: 15, height: 15)
                    }
                    
                    Image(systemName: songPlaying ? "pause.fill" : "arrowtriangle.right.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .onTapGesture {
                            songPlaying.toggle()
                            soundManager.playSound(sound: episode.songPath)
                            
                            if songPlaying {
                                soundManager.audioPlayer?.play()
                            } else {
                                soundManager.audioPlayer?.pause()
                            }
                        }
                    
                    HStack(spacing: 0) {
                        Image(systemName: "arrowtriangle.forward.fill")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Image(systemName: "arrowtriangle.forward.fill")
                            .resizable()
                            .frame(width: 15, height: 15)
                    }
                    
                    Image(systemName: "arrow.circlepath")
                        .overlay(
                            Text("1")
                                .font(.wixMadeFont(.bold, fontSize: .body))
                        )
                        .foregroundColor(.gray)
                }
                
                Label("Add Effects", systemImage: "plus")
                    .modifier(OutlineBigButtonStyle())
                    .padding(60)
                
                Spacer()
            }
            
        }
        .background(
            Image("player_background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        )
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    StoryPlayerView(episode: EpisodeData.sampleEpisodeData)
}

func timeString(time: Double) -> String {
    let minutes = Int(time) / 60
    let seconds = Int(time) % 60
    return String(format: "%02d:%02d", minutes, seconds)
}
