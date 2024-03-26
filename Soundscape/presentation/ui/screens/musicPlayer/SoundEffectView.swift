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
    
    @State var playingList: [AudioFetch] = []
    @Binding var isShowEffectView: Bool
    @EnvironmentObject var appViewModel: AppViewModel
    
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
                    
                    Text("Playing")
                        .font(.wixMadeFont(.semiBold, fontSize: .subTitle))
                        .padding()
                    
                    LazyVGrid(columns: columns){
                        ForEach(playingList.indices, id: \.self) { index in
                            let effect = playingList[index]
                            Button{
                                playingList.remove(at: index)
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
                    
                    Text("Nature")
                        .font(.wixMadeFont(.semiBold, fontSize: .title))
                        .padding()
                    LazyVGrid(columns: columns){
                        ForEach(EffectsSoundData.natureList) { effect in
                            Button{
                                if (playingList.count < 2) {
                                    playingList.append(effect)
                                } else {
                                    playingList[0] = effect
                                }
                                appViewModel.playEffect(sound: effect.assetPath)
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
                    
                    LazyVGrid(columns: columns) {
                        ForEach(EffectsSoundData.asmrList) { effect in
                            Button{
                                if (playingList.count < 2) {
                                    playingList.append(effect)
                                } else {
                                    playingList[0] = effect
                                }
                                appViewModel.playEffect(sound: effect.assetPath)
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
        .background(Image("login_background"))
    }
}

#Preview {
    SoundEffectView(isShowEffectView: .constant(true)).environmentObject(AppViewModel())
}
