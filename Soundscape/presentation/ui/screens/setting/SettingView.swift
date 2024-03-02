//
//  SettingView.swift
//  Soundscape
//
//  Created by admin on 28/02/24.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Text("Account")
                        .font(.wixMadeFont(.bold, fontSize: .heading))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    Button {
                        print("hi")
                    } label: {
                        Text("CREATE AN ACCOUNT")
                            .font(.wixMadeFont(.regular, fontSize: .subTitle))
                    }
                    .foregroundColor(.white)
                    .modifier(OutlineBigButtonStyle())
                    .padding()
                    
                    Text("Already A Member? Log in")
                        .font(.wixMadeFont(.regular, fontSize: .body))
                    
                    Text("OTHERS")
                        .font(.wixMadeFont(.bold, fontSize: .heading))
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .padding(.top, 50)
                    
                    Group {
                        Label("Share app", systemImage: "square.and.arrow.up.fill")
                            .padding(.bottom, 10)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Label("Rate our app", systemImage: "star.fill")
                            .padding(.bottom, 10)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Label("Privacy Policy", systemImage: "doc.fill")
                            .padding(.bottom, 10)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    Text("Version")
                        .font(.wixMadeFont(.bold, fontSize: .body))
                    
                    Text("1.0.0")
                        .font(.wixMadeFont(.bold, fontSize: .body))
                        .padding(.bottom)
                }
            }
            .background(
                ZStack {
                    Circle()
                        .fill(
                            .linearGradient(colors: [.darkBlue, .black],
                                            startPoint: .topTrailing,
                                            endPoint: .bottom)
                        )
                        .frame(width: 600, height: 600)
                        .offset(x: -100, y: -520)
                        .blur(radius: 30)
                    
                    Image("ic_top_line_shape")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 400)
                        
                }
            )
            .background(
                ZStack {
                    Circle()
                        .fill(
                            .linearGradient(colors: [.darkRed, .black],
                                            startPoint: .topTrailing,
                                            endPoint: .bottomLeading)
                        )
                        .frame(width: 500, height: 500)
                        .offset(x: 90, y: -30)
                        .blur(radius: 60)
                        
                }
            )
            .background(
                ZStack {
                    Circle()
                        .fill(
                            .linearGradient(colors: [.darkBlue, .black],
                                            startPoint: .topTrailing,
                                            endPoint: .bottom)
                        )
                        .frame(width: 700, height: 700)
                        .offset(x: -90, y: 120)
                        .blur(radius: 30)
                        
                }
            )
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingView()
}
