//
//  ListItemView.swift
//  Soundscape
//
//  Created by Aman Kumar on 02/03/24.
//

import SwiftUI

struct MusicListItemView: View {
    var audioFetch: AudioFetch
    var onButtonTap: () -> Void
    
    var body: some View {
        HStack {
            Text(audioFetch.name)
                .font(.wixMadeFont(.regular, fontSize: .title))
            Spacer()
            Button {
                onButtonTap()
            } label: {
                Image(systemName: "heart.fill")
                    .foregroundColor(.gray)
            }
        }
        .foregroundColor(.white)
        .frame(width: 350, height: 40)
    }
}
