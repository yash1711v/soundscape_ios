//
//  MusicListView.swift
//  Soundscape
//
//  Created by Aman Kumar on 01/03/24.
//

import SwiftUI

struct MusicListView: View {
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView(.vertical, showsIndicators: false) {
                    Image("sleep")
                        .resizable()
                        .scaledToFit()
                        .frame(alignment: .top)
                    
                    HStack(spacing: 100) {
                        Button {
                            print("hi")
                        } label: {
                            Label("Play All", systemImage: "play")
                                .foregroundColor(.white)
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.white, lineWidth: 1)
                                .frame(width: 130, height: 40)
                        )
                        
                        Button {
                            print("hi")
                        } label: {
                            Label("Shuffle", systemImage: "shuffle")
                                .foregroundColor(.black)
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 30)
                                .frame(width: 130, height: 40)
                        )
                    }
                    .padding(.top)
                    
                    Button {
                        print("hi")
                    } label: {
                        HStack {
                            Text("Soothing")
                            Spacer()
                            Image(systemName: "heart.fill")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding()
                    
                    HStack {
                        Text("Soothing")
                        Spacer()
                        Image(systemName: "heart.fill")
                            .foregroundColor(.gray)
                    }
                    .padding()
                }
                
            }
            .navigationTitle("Sleep")
        }
    }
}

#Preview {
    MusicListView()
}
