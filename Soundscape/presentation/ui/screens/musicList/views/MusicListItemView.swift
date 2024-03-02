//
//  ListItemView.swift
//  Soundscape
//
//  Created by Aman Kumar on 02/03/24.
//

import SwiftUI

struct MusicListItemView: View {
    var music: Music
    
    var body: some View {
        
            Button {
                print("hi")
            } label: {
                HStack {
                    Text(music.name)
                        .font(.wixMadeFont(.regular, fontSize: .title))
                    Spacer()
                    Button {
                        print("hi")
                    } label: {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.gray)
                    }
                }
            }
            .foregroundColor(.white)
            .frame(width: 350, height: 40)
    }
}

#Preview {
    MusicListItemView(music: MusicData.sampleMusic)
}
