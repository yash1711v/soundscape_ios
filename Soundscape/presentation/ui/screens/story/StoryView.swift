//
//  StoryView.swift
//  Soundscape
//
//  Created by admin on 28/02/24.
//

import SwiftUI

struct StoryView: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                Text("Most Popular Stories")
                    .font(.wixMadeFont(.regular, fontSize: .title))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        
                    }
                    .padding(.horizontal)
                }
                
                HStack {
                    Text("Mystery Tales")
                        .font(.wixMadeFont(.regular, fontSize: .title))
                    Spacer()
                    Button {
                        print("hi")
                    } label: {
                        Text("View More >")
                            .font(.wixMadeFont(.regular, fontSize: .subTitle))
                            .foregroundColor(.white)
                    }
                }
                .padding()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        
                    }
                    .padding(.horizontal)
                }
                
                HStack {
                    Text("Inspirtional Stories")
                        .font(.wixMadeFont(.regular, fontSize: .title))
                    Spacer()
                    Button {
                        print("hi")
                    } label: {
                        Text("View More >")
                            .font(.wixMadeFont(.regular, fontSize: .subTitle))
                            .foregroundColor(.white)
                    }
                }
                .padding()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        
                    }
                    .padding(.horizontal)
                }
                
                HStack {
                    Text("Historical Journeys")
                        .font(.wixMadeFont(.regular, fontSize: .title))
                    Spacer()
                    Button {
                        print("hi")
                    } label: {
                        Text("View More >")
                            .font(.wixMadeFont(.regular, fontSize: .subTitle))
                            .foregroundColor(.white)
                    }
                }
                .padding()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        
                    }
                    .padding(.horizontal)
                }
                
                HStack {
                    Text("Fantasy Realms")
                        .font(.wixMadeFont(.regular, fontSize: .title))
                    Spacer()
                    Button {
                        print("hi")
                    } label: {
                        Text("View More >")
                            .font(.wixMadeFont(.regular, fontSize: .subTitle))
                            .foregroundColor(.white)
                    }
                }
                .padding()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        
                    }
                    .padding(.horizontal)
                }
                
                HStack {
                    Text("Adventure Stories")
                        .font(.wixMadeFont(.regular, fontSize: .title))
                    Spacer()
                    Button {
                        print("hi")
                    } label: {
                        Text("View More >")
                            .font(.wixMadeFont(.regular, fontSize: .subTitle))
                            .foregroundColor(.white)
                    }
                }
                .padding()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        
                    }
                    .padding(.horizontal)
                }
                
                HStack {
                    Text("Action Stories")
                        .font(.wixMadeFont(.regular, fontSize: .title))
                    Spacer()
                    Button {
                        print("hi")
                    } label: {
                        Text("View More >")
                            .font(.wixMadeFont(.regular, fontSize: .subTitle))
                            .foregroundColor(.white)
                    }
                }
                .padding()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        
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
            .navigationTitle("Story Time")
        }
    }
}

#Preview {
    StoryView()
}
