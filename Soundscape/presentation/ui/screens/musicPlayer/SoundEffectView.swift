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
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text("PLAYING")
                    .font(.wixMadeFont(.regular, fontSize: .subTitle))
                
                VStack {
                    Text("Waves")
                    Image("waves")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                }
                .background(
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: 120, height: 120)
                        .foregroundColor(.gray)
                )
                
            }
        }
        .navigationTitle("Sounds Effects")
    }
}

#Preview {
    SoundEffectView()
}
