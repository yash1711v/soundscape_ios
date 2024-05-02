//
//  StorySoundItems.swift
//  Soundscape
//
//  Created by YASH VERMA on 02/05/24.
//

import SwiftUI

struct StorySoundItems: View {
    var columns: [GridItem] = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16),
        // You can add more columns or
        ]
    let miniStoryList: String
    
    var list: [MainStorySound] = []
    
    init(columns: [GridItem], miniStoryList: String) {
        self.columns = columns
        self.miniStoryList = miniStoryList
        if miniStoryList == "Mystery Tales" {
            list = MainStorySoundData.mysteryTalesList
        }
        else if miniStoryList == "Inspirational Stories"{
            list = MainStorySoundData.inspirationalStoriesList

        }
        else if miniStoryList == "Historical Journeys"{
            list = MainStorySoundData.historicalJourneyList

        }
        else if miniStoryList == "Fantasy Realms"{
            list = MainStorySoundData.fantasyRealmsList

        }
        else if miniStoryList == "Adventure Stories"{
            list = MainStorySoundData.adventureStoriesList

        }else{
            list = MainStorySoundData.actionStoriesList

        }
    }
    @Environment(\.presentationMode) var presentationMode // Access presentation mode

    
    var body: some View {
        
        
        NavigationView {
            ZStack {
               
                ScrollView {
                    VStack {
                        HStack{
                            Spacer()
                            Button(action: {
                                          withAnimation {
                                              self.presentationMode.wrappedValue.dismiss() // Dismiss the view with animation
                                          }
                                      }) {
                                          HStack {
                                              Spacer(minLength: 12)
                                              Image(systemName: "chevron.backward") // Back arrow icon with circle background
                                                  .foregroundColor(.white) // Customize the color
                                                  .font(.title) 
                                              .padding(.top,3)
                                              
                                              Text(miniStoryList)
                                                  .font(.wixMadeFont(.regular, fontSize: .largeHeading))
                                                  .frame(maxWidth: .infinity,alignment: .leading)
                                                  .foregroundColor(.white)
                                          }// Adjust the size
                                      }
                      
                                
                            }
                        LazyVGrid(columns: columns, spacing: 16) {
                            // ForEach iterating over a range of integers
                            ForEach(list, id: \.id) { story in
                                // Displaying the index in each cell
                                NavigationLink(destination: StoryDetailView(mainStorySound: story)){
                                    VStack{
                                        
                                        HStack{
                                         
                                            VStack {
                                                Spacer()
                                                Text(story.name)
                                                    .font(.wixMadeFont(.regular, fontSize: .title))
                                                    .padding(.leading,10)
                                                    .frame(maxWidth: .infinity, maxHeight: 5,alignment: .leading)
                                                .foregroundColor(.white)
                                                
                                                HStack {
                                                    Text(String(story.episodeList.count)+" episodes")
                                                        .font(.wixMadeFont(.regular, fontSize: .small))
                                                        .padding(.leading,10)
                                                        .frame(maxWidth: .infinity, maxHeight: 10,alignment: .leading)
                                                    .foregroundColor(.white)
                                                    
                                                    
                                                    Text(String(story.listenerCount)+" Listeners")
                                                        .font(.wixMadeFont(.regular, fontSize: .small))
                                                        .padding(.leading,10)
                                                        .frame(maxWidth: .infinity, maxHeight: 10,alignment: .leading)
                                                    .foregroundColor(.white)
                                                    
                                                }
                                            
                                            }
                                            
                                           
                                            
                                        }
                                        Spacer()
                                      
                                        
                                    }
                                }
                                .frame(width: 160, height: 190)
                                .background(
                                    Image(story.imageName)
                                        .resizable()
                                        .scaledToFill()
                                )
                                .cornerRadius(10)
                        
                            }
                        }
                        .padding(.horizontal)
                      
                    }
                    
                }
                
                .background(
                    Image("story_background")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                       
                    
                )
                .navigationTitle(miniStoryList)
            .navigationBarHidden(true)
            }
        
        }
        .navigationBarBackButtonHidden(true)
        
    }
}

#Preview {
    StoryView()
}
