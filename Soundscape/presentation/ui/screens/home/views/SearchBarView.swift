//
//  SearchBarView.swift
//  Soundscape
//
//  Created by Aman Kumar on 29/02/24.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var textSearch: String
    @State var marqText: String = "Search For Sound Effects, Playlist, Song Name. "
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .resizable()
                .scaledToFit()
                .frame(width: 15, height: 15)
                .foregroundColor(.white)
                .padding(.leading, 10)
            
            TextField("", text: $textSearch)
                .foregroundColor(.white)
                .onChange(of: textSearch) { newValue in
                    if newValue.isEmpty {
                        marqText = "Search For Sound Effects, Playlist, Song Name. "
                    } else {
                        marqText = ""
                    }
                }
                .overlay {
                    MarqueeText(text: $marqText, font: .systemFont(ofSize: 15))
                        .foregroundColor(.gray)
                }
        }
        .padding(8)
        .background(
            LinearGradient(gradient: Gradient(
                colors: [Color(hex: 0xB3B5D5).opacity(0.49),
                         Color(hex: 0xB9A0D9).opacity(0.46)]),
                           startPoint: .top,
                           endPoint: .bottom)
            .opacity(0.5)
        )
        .background(
            RoundedRectangle(cornerRadius: 30)
                .stroke(Color.white, lineWidth: 1)
                .opacity(0.5)
        )
        .cornerRadius(30)
        .padding(.horizontal, 20)
    }
}

#Preview {
    SearchBarView(textSearch: .constant(""))
}
