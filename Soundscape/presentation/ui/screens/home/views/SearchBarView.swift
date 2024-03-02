//
//  SearchBarView.swift
//  Soundscape
//
//  Created by Aman Kumar on 29/02/24.
//

import SwiftUI

struct SearchBarView: View {
    @State private var textSearch: String = ""
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
                .foregroundColor(.white)
                .padding(.leading, 10)
            
            TextField("Sarch song", text: $textSearch)
                .foregroundColor(.white)
        }
        .padding(8)
        .background(
            BackgroundGradientView(topColor: Color("brandPurple"), bottomColor: .gray)
        )
        .cornerRadius(30)
        .padding(.horizontal, 20)
    }
}

#Preview {
    SearchBarView()
}
