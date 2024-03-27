//
//  BottomMusicPlayerView.swift
//  Soundscape
//
//  Created by admin on 11/03/24.
//

import SwiftUI

struct MusicPlayerView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    @State private var imageWidth: CGFloat = 260
    @State var offset: CGFloat = 0
    @State var isShowEffectView = false
    @State private var isRotating = false
    
    var body: some View {
        VStack {
            Capsule()
                .fill(Color.gray)
                .frame(width: appViewModel.expand ? 60 : 0, height: appViewModel.expand ? 4 : 0)
                .opacity(appViewModel.expand ? 1 : 0)
                .padding(.top, appViewModel.expand ? 10 : 0)
                .padding(.vertical, appViewModel.expand ? 10 : 0)
            if appViewModel.expand {
                Text(appViewModel.musicPlayerTitle)
                    .font(.wixMadeFont(.regular, fontSize: .title))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
            }
            HStack {
                if (appViewModel.episode.songType == "Sad"
                    || appViewModel.episode.songType == "Romantic"
                    || appViewModel.episode.songType == "Angry"
                    || appViewModel.episode.songType == "Anxious"
                    || appViewModel.episode.songType == "Distracted"
                    || appViewModel.episode.songType == "Tired")
                    && appViewModel.expand == true {
                    ZStack {
                        Image("player_wire")
                            .resizable()
                            .scaledToFit()
                        
                        Image("player_disc")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 280, height: 280)
                            .rotationEffect(Angle.degrees(isRotating ? 360 : 0))
                            .id(appViewModel.isPlaying)
                            .onAppear{
                                if appViewModel.isPlaying {
                                    withAnimation(.linear(duration: 5).repeatForever(autoreverses: false)) {
                                        isRotating.toggle()
                                    }
                                }
                            }
                            .onChange(of: appViewModel.isPlaying) { newValue in
                                if newValue {
                                    withAnimation(.linear(duration: 5).repeatForever(autoreverses: false)) {
                                        isRotating.toggle()
                                    }
                                }
                            }
                        
                        Image(appViewModel.episode.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                    }
                } else {
                    Image(appViewModel.episode.imageName)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(5)
                        .frame(width: appViewModel.expand ? imageWidth : 30, height: appViewModel.expand ? 300 : 30)
                        .shadow(radius: 10)
                        .padding(.vertical)
                        .padding(.leading)
                        .padding(.trailing, appViewModel.expand ? 10 : 0)
                        .animation(.bouncy(extraBounce: 0.3), value: imageWidth)
                }

                if !appViewModel.expand {
                    VStack(alignment: .leading) {
                        Text(appViewModel.episode.songName)
                            .font(.wixMadeFont(.regular, fontSize: .title))
                        
                        Text(appViewModel.musicPlayerTitle)
                            .font(.wixMadeFont(.regular, fontSize: .subTitle))
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    Image(systemName: appViewModel.isPlaying ? "pause.fill" : "arrowtriangle.right.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .padding(.trailing)
                        .onTapGesture {
                            appViewModel.isPlaying.toggle()
                            
                            if appViewModel.isPlaying {
                                appViewModel.playSound()
                            } else {
                                appViewModel.pauseSound()
                            }
                        }
                    
                    Image(systemName: "shuffle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundColor(appViewModel.isShuffle ? .white: .gray)
                        .padding(.trailing)
                        .onTapGesture {
                            appViewModel.isShuffle = true
                            appViewModel.episodeList.shuffle()
                        }
                    
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
                    Text(appViewModel.episode.songName)
                        .font(.wixMadeFont(.bold, fontSize: .heading))
                    Spacer()
                    Image(systemName: "heart.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.gray)
                        .padding(10)
                        .onTapGesture {
                            Task {
                                if appViewModel.musicPlayerTitle == "Story Time" {
                                    let episode = appViewModel.episode
                                    let audioFetchNew = AudioFetch(id: episode.audioFetchId!, name: episode.songName, assetPath: episode.songPath, image: episode.imageName, type: "Story Time", isLiked: true)
                                    await appViewModel.saveStory(audioFetch: audioFetchNew)
                                }
                            }
                        }
                }
                .padding()
                
                Slider(value: $appViewModel.currentTime, in: 0...appViewModel.totalTime, onEditingChanged: { editing in
                    if !editing {
                        appViewModel.seek(to: appViewModel.currentTime)
                    }
                })
                .accentColor(.white)
                .padding(.horizontal)
                
                HStack {
                    Text(timeString(time: appViewModel.currentTime))
                        .font(.wixMadeFont(.regular, fontSize: .titleSmall))
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    Text(timeString(time: appViewModel.totalTime))
                        .font(.wixMadeFont(.regular, fontSize: .titleSmall))
                        .foregroundColor(.gray)
                    
                }
                .padding(.horizontal)
                .padding(.bottom, 30)
                
                HStack (spacing: 50) {
                    Image(systemName: "shuffle")
                        .foregroundColor(appViewModel.isShuffle ? .white: .gray)
                        .onTapGesture {
                            appViewModel.isShuffle = true
                            appViewModel.episodeList.shuffle()
                        }
                    
                    // MARK: Previous button
                    HStack(spacing: 0) {
                        Image(systemName: "arrowtriangle.backward.fill")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Image(systemName: "arrowtriangle.backward.fill")
                            .resizable()
                            .frame(width: 15, height: 15)
                    }.onTapGesture {
                        appViewModel.playPreviousSound()
                    }
                    
                    Image(systemName: appViewModel.isPlaying ? "pause.fill" : "arrowtriangle.right.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .onTapGesture {
                            appViewModel.isPlaying.toggle()
                            
                            if appViewModel.isPlaying {
                                appViewModel.playSound()
                                imageWidth = 300
                            } else {
                                appViewModel.pauseSound()
                                imageWidth = 280
                            }
                        }
                    
                    // MARK: Next button
                    HStack(spacing: 0) {
                        Image(systemName: "arrowtriangle.forward.fill")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Image(systemName: "arrowtriangle.forward.fill")
                            .resizable()
                            .frame(width: 15, height: 15)
                    }.onTapGesture {
                        appViewModel.playNextSound()
                    }
                
                    Image(systemName: "arrow.circlepath")
                        .overlay(
                            Text("1")
                                .font(.wixMadeFont(.bold, fontSize: .body))
                        )
                        .foregroundColor(.gray)
                }
                
                // MARK: Set bottom screen for song and story
                if appViewModel.musicPlayerTitle != "Story Time" {
                    SongBottomOptionView(isShowEffectView: $isShowEffectView)
                        .padding(.horizontal)
                } else {
                    Button {
                        withAnimation(.easeInOut) {
                            isShowEffectView = true
                        }
                    } label: {
                        Label("Add Effects", systemImage: "plus")
                    }
                    .foregroundColor(.white)
                    .modifier(OutlineBigButtonStyle())
                    .padding(60)
                }
            }
            .sheet(isPresented: $isShowEffectView, content: {
                SoundEffectView(isShowEffectView: $isShowEffectView)
            })
            // stretch effect
            .frame(width: appViewModel.expand ? nil : 0, height: appViewModel.expand ? nil : 0)
            .opacity(appViewModel.expand ? 1 : 0)
        }
        .frame(maxHeight: appViewModel.expand ? .infinity : 60)
        .background(
            
            VStack(spacing: 0) {
                if appViewModel.expand {
                    Image("player_background")
                        .resizable()
                } else {
                    BlurView()
                }
                
            }
                .onTapGesture {
                    withAnimation(.spring) {
                        appViewModel.expand = true
                    }
                }
        )
        .onAppear {
            appViewModel.setupRemoteTransportControls()
        }
        .cornerRadius(10, corners: [.topLeft, .topRight])
        .ignoresSafeArea()
        .offset(y: appViewModel.expand ? 0 : -48)
        .offset(y: offset)
        .gesture(DragGesture().onEnded(onEnded(value:)).onChanged(onChanged(value:)))
    }
    
    func onChanged(value: DragGesture.Value) {
        if value.translation.height > 0 && appViewModel.expand {
            offset = value.translation.height
        }
    }
    
    func onEnded(value: DragGesture.Value) {
        withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.95, blendDuration: 0.95)) {
            if value.translation.height > 200 {
                appViewModel.expand = false
            }
            offset = 0
        }
    }
}

#Preview {
    MusicPlayerView().environmentObject(AppViewModel())
}

func timeString(time: Double) -> String {
    let minutes = Int(time) / 60
    let seconds = Int(time) % 60
    return String(format: "%02d:%02d", minutes, seconds)
}

struct SongBottomOptionView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    @Binding var isShowEffectView: Bool
    @State var isShowTimerSheet = false
    
    let timerOptions = ["60 Min", "50 Min", "40 Min", "30 Min", "20 Min", "10 Min", "Off Timer"]
    
    var body: some View {
        HStack(alignment: .bottom) {
            Label(timeString(appViewModel.remainingSeconds), systemImage: "stopwatch.fill")
                .font(.wixMadeFont(.regular, fontSize: .subTitle))
                .foregroundColor(.gray)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.brandPurpleDark,lineWidth: 1)
                        .frame(width: 130, height: 30)
                )
                .onTapGesture {
                    isShowTimerSheet = true
                }
                .onChange(of: appViewModel.timerDuration) { _ in
                    appViewModel.startTimer()
                }
                .halfSheet(showSheet: $isShowTimerSheet, sheeView: {
                    VStack {
                        Text("Set Timer")
                            .font(.wixMadeFont(.bold, fontSize: .title))
                        
                        Text("(Track will be paused after the set timer)")
                            .font(.wixMadeFont(.bold, fontSize: .body))
                            .foregroundColor(.gray)
                        
                        Divider()
                        
                        Picker(selection: $appViewModel.timerDuration, label: EmptyView()) {
                            ForEach(timerOptions, id: \.self) { option in
                                Text(option).tag(option)
                            }
                        }
                        .frame(width: .infinity, height: 300)
                        .pickerStyle(WheelPickerStyle())
                    }
                })
            
            Spacer()
            
            Button {
                withAnimation(.easeInOut) {
                    isShowEffectView = true
                }
            } label: {
                Label("Add Effects", systemImage: "plus")
                    .font(.wixMadeFont(.regular, fontSize: .subTitle))
                    .foregroundColor(.gray)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.brandPurpleDark,lineWidth: 1)
                            .frame(width: 130, height: 30)
                    )
            }
            .foregroundColor(.white)
            
        }
        .padding(.top, 30)
        .padding()
    }
}

func timeString(_ seconds: Int) -> String {
    let minutes = (seconds % 3600) / 60
    let seconds = (seconds % 3600) % 60
    return String(format: "00:%02d:%02d", minutes, seconds)
}
