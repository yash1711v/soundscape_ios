//
//  StorySoundCardView.swift
//  Soundscape
//
//  Created by Aman Kumar on 29/02/24.
//

import SwiftUI

struct StorySoundCardView: View {
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 10) {
                Text("Nature")
                    .font(.custom("WixMadeforText-Bold", size: 20))
                Text("2.5K listeners")
                    .font(.custom("WixMadeforText-Regular", size: 12))
            }
            .padding()
            Spacer()
            Image("ic_nature")
                .resizable()
                .frame(width: 80,height: 80)
        }
        .background(.gray)
        .cornerRadius(10)
    }
}

#Preview {
    StorySoundCardView()
}
