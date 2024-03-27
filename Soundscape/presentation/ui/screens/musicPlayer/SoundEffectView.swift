//
//  SoundEffectView.swift
//  Soundscape
//
//  Created by Aman Kumar on 22/03/24.
//

import SwiftUI

struct SoundEffectView: View {
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
    
    @Binding var isShowEffectView: Bool
    @EnvironmentObject var appViewModel: AppViewModel
    @State var isShowingEffectSettingSheet = false
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding()
                        .onTapGesture {
                            isShowEffectView = false
                        }
                    
                    HStack {
                        Text("Playing")
                            .font(.wixMadeFont(.semiBold, fontSize: .subTitle))
                            .padding()
                        
                        Spacer()
                        
                        if !appViewModel.effectPlayingList.isEmpty {
                            Image(systemName: "speaker.wave.3.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .padding()
                                .onTapGesture {
                                    isShowingEffectSettingSheet = true
                                }
                        }

                    }
                    .halfSheet(showSheet: $isShowingEffectSettingSheet, sheeView: {
                        SoundEffectSettingView(appViewModel: appViewModel)
                    })
                    
                    // MARK: Now playing grid (max 2 item)
                    LazyVGrid(columns: columns){
                        ForEach(appViewModel.effectPlayingList.indices, id: \.self) { index in
                            let effect = appViewModel.effectPlayingList[index]
                            Button{
                                if effectIndex(list: appViewModel.effectPlayingList, effect: effect) == 0 {
                                    appViewModel.pauseEffect1()
                                    if appViewModel.effectPlayingList.count == 1 {
                                        appViewModel.pauseEffect2()
                                    }
                                } else {
                                    appViewModel.pauseEffect2()
                                }
                                appViewModel.effectPlayingList.remove(at: index)
                            } label: {
                                Image(effect.image)
                                    .resizable()
                                    .scaledToFit()
                                    .overlay {
                                        Image(systemName: "minus.circle.fill")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(.errorRed)
                                            .offset(x: 50, y: -40)
                                    }
                            }
                        }
                    }
                    .padding()
                    
                    Divider()
                    
                    Text("NATURE")
                        .font(.wixMadeFont(.semiBold, fontSize: .title))
                        .padding()
                    
                    // MARK: Nature grid (max 2 item)
                    LazyVGrid(columns: columns){
                        ForEach(EffectsSoundData.natureList) { effect in
                            Button{
                                if (appViewModel.effectPlayingList.count < 2) {
                                    appViewModel.effectPlayingList.append(effect)
                                } else {
                                    appViewModel.effectPlayingList[0] = effect
                                }
                                
                                // Check if the index of the effect is 0
                                if effectIndex(list: appViewModel.effectPlayingList, effect: effect) == 0 {
                                    // If the index is 0, play effect1
                                    appViewModel.playEffect1(sound: effect.assetPath)
                                } else {
                                    // If the index is not 0, play effect2
                                    appViewModel.playEffect2(sound: effect.assetPath)
                                }
                            } label: {
                                Image(effect.image)
                                    .resizable()
                                    .scaledToFit()
                            }
                        }
                    }
                    .padding()
                    
                    Text("INSTRUMENTAL")
                        .font(.wixMadeFont(.semiBold, fontSize: .title))
                        .padding()
                    
                    // MARK: Instrumental grid (max 2 item)
                    LazyVGrid(columns: columns) {
                        ForEach(EffectsSoundData.instrumentalList) { effect in
                            Button{
                                if (appViewModel.effectPlayingList.count < 2) {
                                    appViewModel.effectPlayingList.append(effect)
                                } else {
                                    appViewModel.effectPlayingList[0] = effect
                                }
                                // Check if the index of the effect is 0
                                if effectIndex(list: appViewModel.effectPlayingList, effect: effect) == 0 {
                                    // If the index is 0, play effect1
                                    appViewModel.playEffect1(sound: effect.assetPath)
                                } else {
                                    // If the index is not 0, play effect2
                                    appViewModel.playEffect2(sound: effect.assetPath)
                                }
                            } label: {
                                Image(effect.image)
                                    .resizable()
                                    .scaledToFit()
                            }
                        }
                    }
                    .padding()
                    
                    Text("ASMR")
                        .font(.wixMadeFont(.semiBold, fontSize: .title))
                        .padding()
                    
                    // MARK: ASMR grid (max 2 item)
                    LazyVGrid(columns: columns) {
                        ForEach(EffectsSoundData.asmrList) { effect in
                            Button{
                                if (appViewModel.effectPlayingList.count < 2) {
                                    appViewModel.effectPlayingList.append(effect)
                                } else {
                                    appViewModel.effectPlayingList[0] = effect
                                }
                                // Check if the index of the effect is 0
                                if effectIndex(list: appViewModel.effectPlayingList, effect: effect) == 0 {
                                    // If the index is 0, play effect1
                                    appViewModel.playEffect1(sound: effect.assetPath)
                                } else {
                                    // If the index is not 0, play effect2
                                    appViewModel.playEffect2(sound: effect.assetPath)
                                }
                            } label: {
                                Image(effect.image)
                                    .resizable()
                                    .scaledToFit()
                            }
                        }
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("Sounds Effects")
        .background(
            Image("soundEffectBackground")
                .resizable()
        )
        .ignoresSafeArea()
    }
}

#Preview {
    SoundEffectView(isShowEffectView: .constant(true)).environmentObject(AppViewModel())
}

func effectIndex(list: [AudioFetch], effect: AudioFetch) -> Int {
    return list.firstIndex(of: effect) ?? 0
}
