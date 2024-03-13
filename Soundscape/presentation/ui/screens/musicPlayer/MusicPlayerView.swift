//
//  BottomMusicPlayerView.swift
//  Soundscape
//
//  Created by admin on 11/03/24.
//

import SwiftUI

struct MusicPlayerView: View {
    @EnvironmentObject var viewModel: AppViewModel
    @State var songPlaying: Bool = false
    @State private var currentTime: Double = 0
    @State private var totalDuration: Double = 1000
    @State private var imageWidth: CGFloat = 260
    
    @State var offset: CGFloat = 0
    
    var body: some View {
        VStack {
            Capsule()
                .fill(Color.gray)
                .frame(width: viewModel.expand ? 60 : 0, height: viewModel.expand ? 4 : 0)
                .opacity(viewModel.expand ? 1 : 0)
                .padding(.top, viewModel.expand ? 10 : 0)
                .padding(.vertical, viewModel.expand ? 10 : 0)
            if viewModel.expand {
                Text("Story Time")
                    .font(.wixMadeFont(.regular, fontSize: .title))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
            }
            HStack {
                Image(viewModel.episode.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: viewModel.expand ? imageWidth : 30, height: viewModel.expand ? 300 : 30)
                    .cornerRadius(5)
                    .shadow(radius: 10)
                    .padding(.vertical)
                    .padding(.leading)
                    .padding(.trailing, viewModel.expand ? 10 : 0)
                    .animation(.bouncy(extraBounce: 0.3), value: imageWidth)
                
                if !viewModel.expand {
                    VStack(alignment: .leading) {
                        Text(viewModel.episode.songName)
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
                            viewModel.playSound(sound: viewModel.episode.songPath)
                            
                            if songPlaying {
                                viewModel.playSound()
                            } else {
                                viewModel.pauseSound()
                            }
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
                    Text(viewModel.episode.songName)
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
                            viewModel.playSound(sound: viewModel.episode.songPath)
                            
                            if songPlaying {
                                viewModel.playSound()
                                imageWidth = 300
                            } else {
                                viewModel.pauseSound()
                                imageWidth = 280
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
            .frame(width: viewModel.expand ? nil : 0, height: viewModel.expand ? nil : 0)
            .opacity(viewModel.expand ? 1 : 0)
        }
        .frame(maxHeight: viewModel.expand ? .infinity : 60)
        .background(
            
            VStack(spacing: 0) {
                if viewModel.expand {
                    Image("player_background")
                        .resizable()
                } else {
                    BlurView()
                }
                
            }
                .onTapGesture {
                    withAnimation(.spring) {
                        viewModel.expand = true
                    }
                }
        )
        .cornerRadius(10, corners: [.topLeft, .topRight])
        .ignoresSafeArea()
        .offset(y: viewModel.expand ? 0 : -48)
        .offset(y: offset)
        .gesture(DragGesture().onEnded(onEnded(value:)).onChanged(onChanged(value:)))
    }
    
    func onChanged(value: DragGesture.Value) {
        if value.translation.height > 0 && viewModel.expand {
            offset = value.translation.height
        }
    }
    
    func onEnded(value: DragGesture.Value) {
        withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.95, blendDuration: 0.95)) {
            if value.translation.height > 300 {
                viewModel.expand = false
            }
            offset = 0
        }
    }
}

#Preview {
    MusicPlayerView()
}

func timeString(time: Double) -> String {
    let minutes = Int(time) / 60
    let seconds = Int(time) % 60
    return String(format: "%02d:%02d", minutes, seconds)
}
