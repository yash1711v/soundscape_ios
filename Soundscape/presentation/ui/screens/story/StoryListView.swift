//
//  StoryListView.swift
//  Soundscape
//
//  Created by admin on 08/03/24.
//

import SwiftUI

struct StoryListView: View {
    @State var textSearch = ""
    var title: String
    var mainStorySound: [MainStorySound]
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible())]
    
    var body: some View {
            ScrollView(.vertical, showsIndicators: false) {
                NavigationLink {
                    SearchView()
                } label: {
                    SearchBarView(textSearch: $textSearch)
                }
                .foregroundColor(.white)
                .padding(.bottom)
                
                LazyVGrid(columns: columns) {
                    ForEach(mainStorySound) { mainStorySound in
                        
                        NavigationLink(destination: StoryDetailView(mainStorySound: mainStorySound)) {
                            StoryCardEpView(mainStorySound: mainStorySound, width: 175)
                        }
                        .foregroundColor(.white)
                        
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 70)
            }
            .background(
                Image("story_background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            )
            .navigationTitle(title)
    }
}

#Preview {
    StoryListView(title: "Inspirational Stories", mainStorySound: MainStorySoundData.inspirationalStoriesList)
}
