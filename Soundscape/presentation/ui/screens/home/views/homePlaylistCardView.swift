//
//  PlaylistCardView.swift
//  Soundscape
//
//  Created by Aman Kumar on 29/02/24.
//

import SwiftUI

struct homePlaylistCardView: View {
    var playlist: Playlist
    @State var showDescription: Bool
    @State private var currentIndex = 0
    
    init(playlist: Playlist) {
        self.playlist = playlist
        showDescription = self.playlist.arrowToggle
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            if playlist.name == "Explore More" {
                Image(playlist.imageName)
                    .resizable()
                    .frame(width: 150, height: 110)
                    .padding(.top)
                    .padding(.horizontal)
            } else {
                Image(playlist.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 110)
                    .cornerRadius(10)
                    .padding(.top)
                    .padding(.horizontal)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white, lineWidth: 2)
                            .frame(width: 150, height: 110)
                            .padding(.top)
                    )
            }
            
            Text("\(playlist.listenerCount, specifier: "%.1f")K Listeners")
                .font(.wixMadeFont(.regular, fontSize: .body))
                .padding(.leading)
            
            HStack {
                Text(playlist.name)
                    .font(.wixMadeFont(.bold, fontSize: .subHeading))
                
                Spacer()
                
                if playlist.name != "Explore More" {
                    Button {
                        showDescription.toggle()
                    } label: {
                        Image(systemName: showDescription ? "arrow.up.circle" : "arrow.down.circle")
                            .foregroundColor(.white)
                    }
                }
            }
            .padding(.horizontal)
            
            Text(showDescription ? playlist.description![currentIndex] : "")
                .font(.wixMadeFont(.regular, fontSize: .body))
                .multilineTextAlignment(.leading)
                .padding(.horizontal)
                .padding(.bottom, showDescription ? 20 : 0)
                .onAppear {
                    let lastDate = UserDefaults.standard.object(forKey: "LastDate") as? Date
                    let currentDate = Date()
                    
                    if let lastDate = lastDate, Calendar.current.isDate(lastDate, inSameDayAs: currentDate) {
                        // If it's the same day, load the last shown index
                        currentIndex = UserDefaults.standard.integer(forKey: "LastSentIndex")
                    } else {
                        // If it's a new day, reset the index and store the new date
                        currentIndex = (currentIndex + 1) % (playlist.description?.count ?? 0)
                        UserDefaults.standard.set(currentIndex, forKey: "LastSentIndex")
                        UserDefaults.standard.set(currentDate, forKey: "LastDate")
                    }
                }
        }
        .frame(width: 180)
        .background(
            LinearGradient(gradient: Gradient(
                colors: [Color(hex: 0xB3B5D5).opacity(0.49),
                         Color(hex: 0xB9A0D9).opacity(0.46)]),
                           startPoint: .top,
                           endPoint: .bottom)
        )
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}

#Preview {
    homePlaylistCardView(playlist: PlaylistData.samplePlaylist)
}
