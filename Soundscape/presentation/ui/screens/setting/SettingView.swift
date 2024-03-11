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
                ScrollView(.vertical, showsIndicators: false) {
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
                    
                    Text("Version")
                        .font(.wixMadeFont(.bold, fontSize: .body))
                        .underline()
                        .frame(height: 200, alignment: .bottom)
                    
                    Text("1.0.0")
                        .font(.wixMadeFont(.bold, fontSize: .body))
                }
            }
            .padding(.bottom, 60)
            .background(
                Image("setting_background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            )
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingView()
}
