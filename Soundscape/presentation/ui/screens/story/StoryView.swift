//
//  StoryView.swift
//  Soundscape
//
//  Created by admin on 28/02/24.
//

import SwiftUI

struct StoryView: View {
    @StateObject var homeModel = StackCardViewModel()

    
    
   
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                Text("Most Popular Stories")
                    .font(.wixMadeFont(.regular, fontSize: .title))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                
                StackCardView()
                    .environmentObject(homeModel)
                
                //Aman's Ui Code
//                ScrollView(.horizontal, showsIndicators: false) {
//                    HStack {
//                        ForEach(MainStorySoundData.miniStoryList) { mainStorySound in
//                            NavigationLink(destination: StoryDetailView(mainStorySound: mainStorySound)) {
//                                MiniStoryCardView(mainStorySound: mainStorySound)
//                            }
//                            .foregroundColor(.white)
//                             
//                        }
//                    }
//                    .padding(.horizontal)
//                }
                
                 
                HStack {
                    Text("Categories")
                        .font(.wixMadeFont(.regular, fontSize: .title))
                    Spacer()
                   
                }
                .padding()
                
                //Grid for Categories
                gridView()
                
                
                
                

//                ScrollView(.horizontal, showsIndicators: false) {
//                    HStack {
//                        ForEach(MainStorySoundData.mysteryTalesList) { mainStorySound in
//                            NavigationLink(destination: StoryDetailView(mainStorySound: mainStorySound)) {
//                                StoryCardEpView(mainStorySound: mainStorySound)
//                            }
//                            .foregroundColor(.white)
//                        }
//                    }
//                    .padding(.horizontal)
//                }
                
            
                
            }
            .background(
                Image("story_background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
            )
            .navigationTitle("Story Time")
        }
    }
}



struct Item {
    var id: Int
    var name: String
    var image:String
}

let items = [
    Item(id: 1, name: "Mystery Tales",image: "Mysterytales" ),
    Item(id: 2, name: "Inspirational Stories",image: "InspirationalStory"),
    Item(id: 3, name: "Historical Journeys",image: "HistoricalJourney"),
    Item(id: 4, name: "Fantasy Realms",image: "FantasyRealms"),
    Item(id: 5, name: "Adventure Stories",image: "AdventureStories"),
    Item(id: 6, name: "Action Stories",image: "ActionStories"),
    // Add more items...
]
    
    #Preview {
        StoryView()
    }

