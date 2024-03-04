//
//  LoginSelectionView.swift
//  Soundscape
//
//  Created by admin on 04/03/24.
//

import SwiftUI

struct LoginSelectionView: View {
    
    @State var openTabView: Bool = false
    
    var body: some View {
        if openTabView {
            SoundscapeTabView()
        } else {
            NavigationView {
                VStack {
                    Spacer()
                    
                    Image("splash_icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .padding()
                    
                    Spacer()
                    
                    Text("Let’s get started")
                        .font(.wixMadeFont(.bold, fontSize: .largeHeading))
                        .padding(.bottom)
                    
                    Text("Login Or Create An\nAccount To Proceed.")
                        .font(.wixMadeFont(.regular, fontSize: .title))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding(.bottom)
                    
                    NavigationLink(destination: SignupView()) {
                        Image("sign_up_button")
                            .resizable()
                            .scaledToFit()
                    }
                    .padding(.vertical)
                    .padding(.horizontal, 30)
                    
                    NavigationLink(destination: LoginView()) {
                        Image("login_button")
                            .resizable()
                            .scaledToFit()
                    }
                    .foregroundColor(.white)
                    .padding(.horizontal, 30)
                    
                    Spacer()
                    
                    Text("Continue as Guest")
                        .font(.wixMadeFont(.regular, fontSize: .subTitle))
                        .underline()
                        .foregroundStyle(.white)
                        .padding()
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                openTabView = true
                            }
                        }
                }
                .navigationTitle("")
            }
        }
    }
}

#Preview {
    LoginSelectionView()
}
