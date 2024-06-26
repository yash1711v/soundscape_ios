//
//  BottomMusicPlayerView.swift
//  Soundscape
//
//  Created by admin on 11/03/24.
//

import SwiftUI
import AVFoundation

struct MusicPlayerView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    @State private var imageWidth: CGFloat = 260
    @State var offset: CGFloat = 0
    @State var isShowEffectView = false
    @State private var isRotating = false
    @State var isRepeatOn = false
    @State var PlayBackSpeed = 1.0
    
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
                            .clipShape(Circle())
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
                    
                    Button {
                        appViewModel.isPlaying.toggle()
                        
                        if appViewModel.isPlaying {
                            appViewModel.playSound()
                        } else {
                            appViewModel.pauseSound()
                        }
                    } label: {
                        Image(systemName: appViewModel.isPlaying ? "pause.fill" : "arrowtriangle.right.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .padding(.trailing)
                    }
                    .foregroundColor(.white)
                    
                    Button {
                        appViewModel.isShuffle.toggle()
                        appViewModel.episodeList.shuffle()
                    } label: {
                        Image(systemName: "shuffle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .padding(.trailing)
                    }
                    .foregroundColor(appViewModel.isShuffle ? .white: .gray)
                    
                    Button {
                        Task {
                            if appViewModel.musicPlayerTitle == "Story Time" {
                                if appViewModel.likedSongs[appViewModel.episode.audioFetchId!] ?? appViewModel.checkStoryInDbList(id: appViewModel.episode.audioFetchId!) {
                                    await appViewModel.deleteStory(
                                        audioFetch: AudioFetch(
                                            id: appViewModel.episode.audioFetchId!,
                                            name: appViewModel.episode.songName,
                                            assetPath: appViewModel.episode.songPath,
                                            image: appViewModel.episode.imageName,
                                            type: appViewModel.episode.songType,
                                            isLiked: true))
                                    appViewModel.likedSongs[appViewModel.episode.audioFetchId!] = false
                                } else {
                                    await appViewModel.saveStory(
                                        audioFetch: AudioFetch(
                                            id: appViewModel.episode.audioFetchId!,
                                            name: appViewModel.episode.songName,
                                            assetPath: appViewModel.episode.songPath,
                                            image: appViewModel.episode.imageName,
                                            type: appViewModel.episode.songType,
                                            isLiked: true))
                                    appViewModel.likedSongs[appViewModel.episode.audioFetchId!] = true
                                }
                            } else {
                                if appViewModel.likedSongs[appViewModel.episode.audioFetchId!] ?? appViewModel.checkSongInDbList(id: appViewModel.episode.audioFetchId!) {
                                    await appViewModel.deleteSong(
                                        audioFetch: AudioFetch(
                                            id: appViewModel.episode.audioFetchId!,
                                            name: appViewModel.episode.songName,
                                            assetPath: appViewModel.episode.songPath,
                                            image: appViewModel.episode.imageName,
                                            type: appViewModel.episode.songType,
                                            isLiked: true))
                                    appViewModel.likedSongs[appViewModel.episode.audioFetchId!] = false
                                }
                                else {
                                    await appViewModel.saveSong(
                                        audioFetch: AudioFetch(
                                            id: appViewModel.episode.audioFetchId!,
                                            name: appViewModel.episode.songName,
                                            assetPath: appViewModel.episode.songPath,
                                            image: appViewModel.episode.imageName,
                                            type: appViewModel.episode.songType,
                                            isLiked: true))
                                    appViewModel.likedSongs[appViewModel.episode.audioFetchId!] = true
                                }
                            }
                        }
                    } label: {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundColor(appViewModel.isLiked ? .red : .gray)
                            .padding(.trailing)
                    }
                    .onAppear {
                        appViewModel.isLiked = appViewModel.episode.songType == "Story Time" ? appViewModel.likedSongs[appViewModel.episode.audioFetchId!] ?? appViewModel.checkStoryInDbList(id: appViewModel.episode.audioFetchId!) :
                        appViewModel.likedSongs[appViewModel.episode.audioFetchId!] ?? appViewModel.checkSongInDbList(id: appViewModel.episode.audioFetchId!)
                    }
                    .onChange(of: appViewModel.episode.songType == "Story Time" ? appViewModel.likedSongs[appViewModel.episode.audioFetchId!] ?? appViewModel.checkStoryInDbList(id: appViewModel.episode.audioFetchId!) :
                                appViewModel.likedSongs[appViewModel.episode.audioFetchId!] ?? appViewModel.checkSongInDbList(id: appViewModel.episode.audioFetchId!)) { _ in
                        appViewModel.isLiked = appViewModel.episode.songType == "Story Time" ? appViewModel.likedSongs[appViewModel.episode.audioFetchId!] ?? appViewModel.checkStoryInDbList(id: appViewModel.episode.audioFetchId!) :
                        appViewModel.likedSongs[appViewModel.episode.audioFetchId!] ?? appViewModel.checkSongInDbList(id: appViewModel.episode.audioFetchId!)
                    }
                }
            }
            
            VStack {
                HStack {
                    Text(appViewModel.episode.songName)
                        .font(.wixMadeFont(.bold, fontSize: .heading))
                    Spacer()
                    Button {
                        Task {
                            if appViewModel.musicPlayerTitle == "Story Time" {
                                if appViewModel.likedSongs[appViewModel.episode.audioFetchId!] ?? appViewModel.checkStoryInDbList(id: appViewModel.episode.audioFetchId!) {
                                    await appViewModel.deleteStory(
                                        audioFetch: AudioFetch(
                                            id: appViewModel.episode.audioFetchId!,
                                            name: appViewModel.episode.songName,
                                            assetPath: appViewModel.episode.songPath,
                                            image: appViewModel.episode.imageName,
                                            type: appViewModel.episode.songType,
                                            isLiked: true))
                                    appViewModel.likedSongs[appViewModel.episode.audioFetchId!] = false
                                } else {
                                    await appViewModel.saveStory(
                                        audioFetch: AudioFetch(
                                            id: appViewModel.episode.audioFetchId!,
                                            name: appViewModel.episode.songName,
                                            assetPath: appViewModel.episode.songPath,
                                            image: appViewModel.episode.imageName,
                                            type: appViewModel.episode.songType,
                                            isLiked: true))
                                    appViewModel.likedSongs[appViewModel.episode.audioFetchId!] = true
                                }
                            } else {
                                if appViewModel.likedSongs[appViewModel.episode.audioFetchId!] ?? appViewModel.checkSongInDbList(id: appViewModel.episode.audioFetchId!) {
                                    await appViewModel.deleteSong(
                                        audioFetch: AudioFetch(
                                            id: appViewModel.episode.audioFetchId!,
                                            name: appViewModel.episode.songName,
                                            assetPath: appViewModel.episode.songPath,
                                            image: appViewModel.episode.imageName,
                                            type: appViewModel.episode.songType,
                                            isLiked: true))
                                    appViewModel.likedSongs[appViewModel.episode.audioFetchId!] = false
                                } else {
                                    await appViewModel.saveSong(
                                        audioFetch: AudioFetch(
                                            id: appViewModel.episode.audioFetchId!,
                                            name: appViewModel.episode.songName,
                                            assetPath: appViewModel.episode.songPath,
                                            image: appViewModel.episode.imageName,
                                            type: appViewModel.episode.songType,
                                            isLiked: true))
                                    appViewModel.likedSongs[appViewModel.episode.audioFetchId!] = true
                                }
                            }
                        }
                    } label: {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundColor(appViewModel.isLiked ? .red : .gray)
                            .padding(10)
                    }
                }
                .onAppear {
                    appViewModel.isLiked = appViewModel.episode.songType == "Story Time" ? appViewModel.likedSongs[appViewModel.episode.audioFetchId!] ?? appViewModel.checkStoryInDbList(id: appViewModel.episode.audioFetchId!) :
                    appViewModel.likedSongs[appViewModel.episode.audioFetchId!] ?? appViewModel.checkSongInDbList(id: appViewModel.episode.audioFetchId!)
                }
                .onChange(of: appViewModel.episode.songType == "Story Time" ? appViewModel.likedSongs[appViewModel.episode.audioFetchId!] ?? appViewModel.checkStoryInDbList(id: appViewModel.episode.audioFetchId!) :
                            appViewModel.likedSongs[appViewModel.episode.audioFetchId!] ?? appViewModel.checkSongInDbList(id: appViewModel.episode.audioFetchId!)) { _ in
                    appViewModel.isLiked = appViewModel.episode.songType == "Story Time" ? appViewModel.likedSongs[appViewModel.episode.audioFetchId!] ?? appViewModel.checkStoryInDbList(id: appViewModel.episode.audioFetchId!) :
                    appViewModel.likedSongs[appViewModel.episode.audioFetchId!] ?? appViewModel.checkSongInDbList(id: appViewModel.episode.audioFetchId!)
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
                
                HStack (spacing: 40) {
                    if appViewModel.musicPlayerTitle != "Story Time" {
                        Button {
                            appViewModel.isShuffle.toggle()
                            appViewModel.episodeList.shuffle()
                        } label: {
                            Image(systemName: "shuffle")
                                .imageScale(.large)
                                .frame(width: 44, height: 44)
                        }
                        .foregroundColor(appViewModel.isShuffle ? .white: .gray)
                    }else{
                        Button {
                            if PlayBackSpeed == 2.0 {
                                PlayBackSpeed = 1.0
                                appViewModel.audioPlayer?.rate = Float(PlayBackSpeed)
                            }else{
                                PlayBackSpeed = PlayBackSpeed + 0.25
                                
                                appViewModel.audioPlayer?.rate = Float(PlayBackSpeed)
                            }
                        } label: {
                           Text(String(PlayBackSpeed)+"x")
                        }
                        .foregroundColor(.white)
                    }
                    
                    // MARK: Previous button
                    Button {
                        appViewModel.playPreviousSound()
                    } label: {
                        HStack(spacing: 0) {
                            Image(systemName: "arrowtriangle.backward.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                            Image(systemName: "arrowtriangle.backward.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                        }
                        .frame(width: 44, height: 44)
                    }
                    .foregroundColor(.white)
                    
                    Button {
                        appViewModel.isPlaying.toggle()
                        
                        if appViewModel.isPlaying {
                            appViewModel.playSound()
                            imageWidth = 300
                        } else {
                            appViewModel.pauseSound()
                            imageWidth = 280
                        }
                    } label: {
                        Image(systemName: appViewModel.isPlaying ? "pause.fill" : "arrowtriangle.right.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                    .foregroundColor(.white)
                    
                    
                    // MARK: Next button
                    Button {
                        if appViewModel.isRepeatSingle{
                            appViewModel.isRepeatSingle=false
                            isRepeatOn = true
                        }
                        appViewModel.playNextSound()
                    
                    } 
                label: {
                        HStack(spacing: 0) {
                            Image(systemName: "arrowtriangle.forward.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                            Image(systemName: "arrowtriangle.forward.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                        }
                        .frame(width: 44, height: 44)
                    }
                    .foregroundColor(.white)
                
                   if appViewModel.musicPlayerTitle != "Story Time" {
                        Button {
                            if !isRepeatOn {
                                isRepeatOn = true
                            } else if !appViewModel.isRepeatSingle {
                                // If repeat is on and currently in single repeat mode, toggle to continuous repeat mode
                                appViewModel.isRepeatSingle = true
                            } else {
                                // If repeat is on and currently in single repeat mode, turn off repeat
                                isRepeatOn = false
                                appViewModel.isRepeatSingle = false
                            }
                        }
                    label: {
                            Image(systemName: appViewModel.isRepeatSingle ? "repeat.1" : "repeat")
                                .imageScale(.large)
                                .frame(width: 44, height: 44)
                        }
                        .foregroundColor(isRepeatOn ? .white : .gray)
                   }else{
                       Button {
                       task:do {
                           isShowEffectView = true
                         }
                       }
                   label: {
                           Image("EffectsIcon")
                               .imageScale(.large)
                               .frame(width: 44, height: 44)
                       }
                   }
                }
                
                // MARK: Set bottom screen for song and story
                if appViewModel.musicPlayerTitle != "Story Time" {
                    SongBottomOptionView(isShowEffectView: $isShowEffectView)
                        .padding(.horizontal)
                } else {
                    
//                    Button("1x") { appViewModel.audioPlayer?.rate=1.0 }
//                    Button("2x") { appViewModel.audioPlayer?.rate=2.0 }
//                    Button("3x") { appViewModel.audioPlayer?.rate=3.0 }
//                    Button("4x") { appViewModel.audioPlayer?.rate=4.0 }
//                    Button {
//                        withAnimation(.easeInOut) {
//                            isShowEffectView = true
//                        }
//                    } label: {
//                        Label("Add Effects", systemImage: "plus")
//                    }
//                    .foregroundColor(.white)
//                    .modifier(OutlineBigButtonStyle())
//                    .padding(60)
                    
                    
//                    SongBottomOptionViewForStory( isShowEffectView: $isShowEffectView)
                    
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
            InterruptionManager.shared.setupInterruptionHandling()
            InterruptionManager.shared.resumePlaybackCallback = {
                // Call your play function here
                appViewModel.playSound()
            }
        }
        .onDisappear {
            NotificationCenter.default.removeObserver(self, name: AVAudioSession.interruptionNotification, object: nil)
        }
        .task {
            await appViewModel.getAllSongFromDb()
            await appViewModel.getAllStoryFromDb()
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
    
    let timerOptions = ["6 Min", "5 Min", "4 Min", "3 Min", "2 Min", "1 Min", "Off Timer"]
    //["60 Min", "50 Min", "40 Min", "30 Min", "20 Min", "10 Min", "Off Timer"]
    
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
                        .frame(height: 300)
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



struct SongBottomOptionViewForStory: View {
    @EnvironmentObject var appViewModel: AppViewModel
    @Binding var isShowEffectView: Bool
    @State var isShowTimerPlayBackSheet = false
    @State private var selectedColor = "1x" // Default selection

    let PlayBackOptions = ["1x", "2x", "3x", "4x"]
   
    
    var body: some View {
        HStack(alignment: .bottom) {
            Label("", systemImage: "bolt.badge.clock")
                .font(.wixMadeFont(.regular, fontSize: .subTitle))
                .foregroundColor(.gray)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.brandPurpleDark,lineWidth: 1)
                        .frame(width: 75, height: 30)
                ).padding(.leading,15)
                .onTapGesture {
                    isShowTimerPlayBackSheet = true
                }
        
                .halfSheet(showSheet: $isShowTimerPlayBackSheet, sheeView: {
                    VStack {
                        Text("Set PlayBack Speed")
                            .font(.wixMadeFont(.bold, fontSize: .title))
                    
                        Divider()
                        
                        Picker(selection: $selectedColor, label: EmptyView()) {
                            ForEach(PlayBackOptions, id: \.self) { option in
                                Text(option).tag(option).onTapGesture(count:1,perform: {
                                    colorDidChange(to: option)
                                })
                            }
                        }
                       
                        .frame(height: 300)
                        .pickerStyle(WheelPickerStyle())
                        .onChange(of: selectedColor) { newValue in
                                       colorDidChange(to: newValue)
                                   }                    }
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
    
    // Define a function to be called when selectedColor changes
    func colorDidChange(to newColor: String) {
        print("Selected color changed to: \(newColor)")
        // Additional actions can be performed here
    }
}




func timeString(_ seconds: Int) -> String {
    let minutes = (seconds % 3600) / 60
    let seconds = (seconds % 3600) % 60
    return String(format: "00:%02d:%02d", minutes, seconds)
}
