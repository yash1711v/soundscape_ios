//
//  StoryDetailView.swift
//  Soundscape
//
//  Created by Aman Kumar on 05/03/24.
//

import SwiftUI

struct StoryDetailView: View {
    var body: some View {
        ZStack {
            Color.backgroundGray
            
            ScrollView(.vertical, showsIndicators: false) {
                Image("the_young_scout")
                    .resizable()
                    .frame(height: 250)
                
                Text("About The Story")
                    .font(.wixMadeFont(.regular, fontSize: .subHeading))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top)
                    .padding(.horizontal)
                    .padding(.bottom, 5)
                
                Text("A doctor, attending to a supposedly sick patient, unwittingly becomes entangled in a perilous situation. The routine medical visit unravels into a suspenseful narrative, revealing hidden dangers and unexpected twists.")
                    .font(.wixMadeFont(.regular, fontSize: .title))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                Text("Explore Episodes")
                    .font(.wixMadeFont(.regular, fontSize: .subHeading))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .padding(.top, 20)
                
                
                EpisodeListView()
                EpisodeListView()
                EpisodeListView()
                EpisodeListView()
                
            }
        }
        .navigationTitle("The Young Scout")
        .ignoresSafeArea()
    }
}

#Preview {
    StoryDetailView()
}
