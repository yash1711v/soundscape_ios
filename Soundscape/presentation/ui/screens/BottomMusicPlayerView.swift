//
//  BottomMusicPlayerView.swift
//  Soundscape
//
//  Created by admin on 11/03/24.
//

import SwiftUI

struct BottomMusicPlayerView: View {
    @State var songPlaying: Bool = false
    
    var body: some View {
        ZStack {
            HStack {
                Image("theYoungScoutEP1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .padding(.vertical)
                    .padding(.leading)
                
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
        .background(
            VStack(spacing: 0) {
                BlurView()
                
            }
        )
        .cornerRadius(10, corners: [.topLeft, .topRight])
        .offset(y: -48)
    }
}

#Preview {
    BottomMusicPlayerView()
}
