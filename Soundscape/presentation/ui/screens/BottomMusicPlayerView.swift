//
//  BottomMusicPlayerView.swift
//  Soundscape
//
//  Created by admin on 11/03/24.
//

import SwiftUI

struct BottomMusicPlayerView: View {
    var episode: Episode = EpisodeData.sampleEpisodeData
    @Binding var expand: Bool
    @State var songPlaying: Bool = false
    @State private var currentTime: Double = 0
    @State private var totalDuration: Double = 1000
    @StateObject private var soundManager = SoundManager()
    @State var offset: CGFloat = 0
    
    var body: some View {
        VStack {
            Capsule()
                .fill(Color.gray)
                .frame(width: expand ? 60 : 0, height: expand ? 4 : 0)
                .opacity(expand ? 1 : 0)
                .padding(.top, expand ? 10 : 0)
                .padding(.vertical, expand ? 10 : 0)
            if expand {
                Text("Story Time")
                    .font(.wixMadeFont(.regular, fontSize: .title))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
            }
            HStack {
                Image("theYoungScoutEP1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: expand ? 300 : 30, height: expand ? 300 : 30)
                    .cornerRadius(5)
                    .shadow(radius: 10)
                    .padding(.vertical)
                    .padding(.leading)
                    .padding(.trailing, expand ? 10 : 0)
                
                if !expand {
                    VStack(alignment: .leading) {
                        Text("The Young Scout")
                            .font(.wixMadeFont(.regular, fontSize: .title))
                        
                        Text("Story Time")
                            .font(.wixMadeFont(.regular, fontSize: .subTitle))
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    Image(systemName: songPlaying ? "pause.fill" : "arrowtriangle.right.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .padding(.trailing)
                        .onTapGesture {
                            songPlaying.toggle()
                        }
                    
                    Image(systemName: "shuffle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.gray)
                        .padding(.trailing)
                    
                    Image(systemName: "heart.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.gray)
                        .padding(.trailing)
                }
            }
            
            VStack {
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
            }
            // stretch effect
            .frame(width: expand ? nil : 0, height: expand ? nil : 0)
            .opacity(expand ? 1 : 0)
        }
        .frame(maxHeight: expand ? .infinity : 60)
        .background(
            
            VStack(spacing: 0) {
                if expand {
                    Image("player_background")
                        .resizable()
                } else {
                    BlurView()
                }
                
            }
                .onTapGesture {
                    withAnimation(.spring) {
                        expand = true
                    }
                }
        )
        .cornerRadius(10, corners: [.topLeft, .topRight])
        .ignoresSafeArea()
        .offset(y: expand ? 0 : -48)
        .offset(y: offset)
        .gesture(DragGesture().onEnded(onEnded(value:)).onChanged(onChanged(value:)))
    }
    
    func onChanged(value: DragGesture.Value) {
        if value.translation.height > 0 && expand {
            offset = value.translation.height
        }
    }
    
    func onEnded(value: DragGesture.Value) {
        withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.95, blendDuration: 0.95)) {
            if value.translation.height > 300 {
                expand = false
            }
            offset = 0
        }
    }
}

#Preview {
    BottomMusicPlayerView(expand: .constant(true))
}
