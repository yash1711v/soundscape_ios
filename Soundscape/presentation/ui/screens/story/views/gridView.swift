//
//  gridView.swift
//  Soundscape
//
//  Created by YASH VERMA on 02/05/24.
//

import SwiftUI

struct gridView: View {
    
    var columns: [GridItem] = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16),
        // You can add more columns or adjust spacing
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                // ForEach iterating over a range of integers
                ForEach(items, id: \.id) { item in
                    // Displaying the index in each cell
                
                    NavigationLink(destination: StorySoundItems(columns: [
                        GridItem(.flexible(), spacing: 16),
                        GridItem(.flexible(), spacing: 16),
                        // You can add more columns or
                    ], miniStoryList: item.name )){
                        VStack{
                            Spacer(minLength:  55)
                            
                            HStack{
                                
                                Text(item.name)
                                    .font(.wixMadeFont(.regular, fontSize: .title))
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .foregroundColor(.white)
                                    .padding()
                                
                            }
                            
                        }
                    }
                    .frame(width: 160, height: 100)
                    .background(
                        Image(item.image)
                            .resizable()
                            .scaledToFill()
                    )
                    .cornerRadius(10)
            
                }
            }
            .padding(.horizontal)
            
        }
    }
    func whichtext(name:String) -> [MainStorySound] {
        if name == "Mystery Tales" {
                return MainStorySoundData.mysteryTalesList
            } else {
                // Handle other cases if needed
                return [] // Return an empty array or handle the case accordingly
            }
        
    }
}

#Preview {
    gridView()
}
