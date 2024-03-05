//
//  MiniStoryCardView.swift
//  Soundscape
//
//  Created by Aman Kumar on 05/03/24.
//

import SwiftUI

struct MiniStoryCardView: View {
    var title: String
    var imageName: String
    
    var body: some View {
        VStack() {
            Spacer()
            VStack() {
                Text(title)
                    .font(.wixMadeFont(.bold, fontSize: .small))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 5)
                    .padding(.horizontal, 5)
                
                HStack {
                    Text("2K Listeners")
                        .font(.wixMadeFont(.regular, fontSize: .extraSmall))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal, 5)
                .padding(.bottom, 10)
            }
            .frame(width: 110)
            .background(
                Rectangle()
                    .foregroundColor(Color.black.opacity(0.6))
                    .shadow(color: Color.black, radius: 1,y: 30)
            )
            
        }
        .frame(width: 110, height: 160)
        .background(
            Image(imageName)
                .resizable()
                .scaledToFill()
        )
        .cornerRadius(10)
    }
}

#Preview {
    MiniStoryCardView(title: "The Young Scout", imageName: "the_young_scout")
}
