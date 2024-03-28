//
//  SoundEffectSettingView.swift
//  Soundscape
//
//  Created by Aman Kumar on 26/03/24.
//

import SwiftUI

struct SoundEffectSettingView: View {
    @ObservedObject var appViewModel: AppViewModel
    
    var body: some View {
        VStack {
            Text("Adjust volume of effects")
                .font(.wixMadeFont(.regular, fontSize: .title))
            
            if appViewModel.effectPlayingList.count > 1 {
                HStack {
                    Image(appViewModel.effectPlayingList.first?.image ?? "")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    
                    CustomSlider(value: $appViewModel.effectVol1, inRange: 0...1, activeFillColor: .white, fillColor: .white, emptyColor: .gray, height: 30, onEditingChanged: { editing in
                        if !editing {
                            appViewModel.effectPlayer1?.volume = appViewModel.effectVol1
                        }
                    })
                    .padding(.horizontal)
                }
                
                HStack {
                    Image(appViewModel.effectPlayingList.last?.image ?? "")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())

                    CustomSlider(value: $appViewModel.effectVol2, inRange: 0...1, activeFillColor: .white, fillColor: .white, emptyColor: .gray, height: 30, onEditingChanged: { editing in
                        if !editing {
                            appViewModel.effectPlayer2?.volume = appViewModel.effectVol2
                        }
                    })
                    .padding(.horizontal)
                }
            } else {
                HStack {
                    Image(appViewModel.effectPlayingList.first?.image ?? "")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    
                    CustomSlider(value: $appViewModel.effectVol1, inRange: 0...1, activeFillColor: .white, fillColor: .white, emptyColor: .gray, height: 30, onEditingChanged: { editing in
                        if !editing {
                            appViewModel.effectPlayer1?.volume = appViewModel.effectVol1
                        }
                    })
                    .padding(.horizontal)
                }
            }
            
        }
    }
}

#Preview {
    SoundEffectSettingView(appViewModel: AppViewModel())
}
