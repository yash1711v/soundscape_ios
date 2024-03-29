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
                    Slider(value: $appViewModel.effectVol1, in: 0...1) { _ in
                        appViewModel.effectPlayer1?.volume = appViewModel.effectVol1
                    }
                    .frame(width: 250)
                    .accentColor(.white)
                }
                
                HStack {
                    Image(appViewModel.effectPlayingList.last?.image ?? "")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    Slider(value: $appViewModel.effectVol2, in: 0...1) { _ in
                        appViewModel.effectPlayer2?.volume = appViewModel.effectVol2
                    }
                    .frame(width: 250)
                    .accentColor(.white)
                }
            } else {
                HStack {
                    Image(appViewModel.effectPlayingList.first?.image ?? "")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    Slider(value: $appViewModel.effectVol1, in: 0...1) { _ in
                        appViewModel.effectPlayer1?.volume = appViewModel.effectVol1
                    }
                    .frame(width: 250)
                    .accentColor(.white)
                }
            }
            
        }
    }
}

#Preview {
    SoundEffectSettingView(appViewModel: AppViewModel())
}
