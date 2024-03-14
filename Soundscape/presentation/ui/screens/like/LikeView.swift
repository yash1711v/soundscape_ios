//
//  LikeView.swift
//  Soundscape
//
//  Created by admin on 28/02/24.
//

import SwiftUI

struct LikeView: View {
    @StateObject var viewModel = LikeViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView(.vertical, showsIndicators: false) {
                    Text("Your Daily Zen")
                        .font(.wixMadeFont(.bold, fontSize: .subHeading))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    HStack {
                        Button {
                            print("hi")
                        } label: {
                            Label("Tunes", systemImage: "music.note")
                                .font(.wixMadeFont(.regular, fontSize: .title))
                                .foregroundColor(.black)
                        }
                        .modifier(FilledSmallButtonStyle())
                        
                        Spacer()
                        
                        Button {
                            print("hi")
                        } label: {
                            Label("Stories", systemImage: "books.vertical")
                                .font(.wixMadeFont(.regular, fontSize: .title))
                                .foregroundColor(.white)
                        }
                        .modifier(OutlineSmallButtonStyle())
                    }
                    .padding(.horizontal, 40)
                    .padding()
                    
                    LazyVStack {
                        ForEach(viewModel.audioFetch) { audioFetch in
                            MusicListItemView(audioFetch: audioFetch) {
                                print("Button tapped")
                            }
                        }
                    }
                    .task {
                        viewModel.getAllSong()
                    }
                    .padding(.bottom, 70)
                    if viewModel.isLoading {
                        LoadingView()
                    }
                }
            }
            .background(
                Image("like_background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
            )
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: alertItem.title,
                      message: alertItem.message,
                      dismissButton: alertItem.dismissButton)
            }
            .navigationTitle("Liked Tunes")
        }
    }
}

#Preview {
    LikeView()
}
