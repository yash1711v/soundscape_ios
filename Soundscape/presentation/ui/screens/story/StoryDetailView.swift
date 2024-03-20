//
//  StoryDetailView.swift
//  Soundscape
//
//  Created by Aman Kumar on 05/03/24.
//

import SwiftUI

struct StoryDetailView: View {
    @EnvironmentObject var viewModel: AppViewModel
    var mainStorySound: MainStorySound
    
    var body: some View {
        ZStack {
            Color.backgroundGray
            
            ScrollView(.vertical, showsIndicators: false) {
                Image(mainStorySound.imageName)
                    .resizable()
                    .frame(height: 250)
                
                Text("About The Story")
                    .font(.wixMadeFont(.regular, fontSize: .subHeading))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top)
                    .padding(.horizontal)
                    .padding(.bottom, 5)
                
                Text(mainStorySound.description)
                    .font(.wixMadeFont(.regular, fontSize: .title))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                Text("Explore Episodes")
                    .font(.wixMadeFont(.regular, fontSize: .subHeading))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .padding(.top, 20)
                
                LazyVStack(spacing: 15) {
                    ForEach(mainStorySound.episodeList.indices, id: \.self) { index in
                        let episode = mainStorySound.episodeList[index]
                        EpisodeListView(episode: episode)
                            .onTapGesture {
                                viewModel.episodeList = mainStorySound.episodeList
                                withAnimation(.spring) {
                                    viewModel.episode = episode
                                    viewModel.showBottomPlayer = true
                                    viewModel.playSound(sound: viewModel.episode.songPath)
                                }
                                // Set currentIndex to the index of the selected episode
                                viewModel.currentIndex = index
                            }
                    }
                }
                .padding(.bottom, 130)
            }
        }
        .navigationTitle(mainStorySound.name)
        .ignoresSafeArea()
    }
}

#Preview {
    StoryDetailView(mainStorySound: MainStorySoundData.sampleStorySound)
}
