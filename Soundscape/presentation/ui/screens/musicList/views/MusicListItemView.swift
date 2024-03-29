//
//  ListItemView.swift
//  Soundscape
//
//  Created by Aman Kumar on 02/03/24.
//

import SwiftUI

struct MusicListItemView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    var audioFetch: AudioFetch
    @Binding var isLiked: Bool
    var onButtonTap: () -> Void
    
    var body: some View {
        ZStack {
            if audioFetch.name == appViewModel.episode.songName {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.backgroundGray)
            } else {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.backgroundGray.opacity(0.1))
            }
            HStack {
                Text(audioFetch.name)
                    .font(.wixMadeFont(.regular, fontSize: .title))
                Spacer()
                Button {
                    onButtonTap()
                } label: {
                    Image(systemName: "heart.fill")
                        .foregroundColor(audioFetch.isLiked ?? isLiked ? .red : .gray)
                }
            }
            .foregroundColor(.white)
            .padding(.horizontal)
        }
        .frame(width: 350, height: 40)
    }
}

#Preview {
    MusicListItemView(audioFetch: AudioFetchData.audioFetchSampleData, isLiked: .constant(false), onButtonTap: {}).environmentObject(AppViewModel())
}
