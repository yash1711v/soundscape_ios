//
//  LoginView.swift
//  Soundscape
//
//  Created by admin on 04/03/24.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    @State var email = ""
    @State var password = ""
    @State var openTabView: Bool = false
    
    var body: some View {
        if appViewModel.userSession != nil {
            SoundscapeTabView()
                .navigationBarHidden(true)
        } else {
                VStack {
                    Text("LOGIN")
                        .font(.wixMadeFont(.bold, fontSize: .heading))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    Image("login_google_button")
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .onTapGesture {
                            Task {
                                try await appViewModel.signInGoogle()
                            }
                        }
                    
                    HStack {
                        Rectangle()
                            .foregroundColor(.gray)
                            .frame(height: 1)
                        
                        Text("or")
                            .font(.wixMadeFont(.regular, fontSize: .title))
                            .foregroundStyle(.gray)
                            .padding(.horizontal)
                        
                        Rectangle()
                            .foregroundColor(.gray)
                            .frame(height: 1)
                    }
                    
                    Text("Email ID")
                        .font(.wixMadeFont(.bold, fontSize: .title))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    TextField("Type here...", text: $email)
                        .foregroundColor(.white)
                        .padding(.horizontal, 30)
                        .modifier(OutlineBigButtonStyle())
                    
                    Text("Enter correct email address.")
                        .font(.wixMadeFont(.regular, fontSize: .body))
                        .foregroundColor(.errorRed)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .padding(.top, 5)
                    
                    Text("Enter Password")
                        .font(.wixMadeFont(.bold, fontSize: .title))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    HStack {
                        TextField("Type here...", text: $email)
                            .textContentType(.password)
                            .foregroundColor(.white)
                        
                        Button {
                            print("hi")
                        } label: {
                            Image(systemName: "eye")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.horizontal, 30)
                    .modifier(OutlineBigButtonStyle())
                    
                    NavigationLink(destination: ForgoutPasswordView()) {
                        Text("Forgout Password")
                            .font(.wixMadeFont(.regular, fontSize: .title))
                            .underline()
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding()
                    }
                    
                    Image("login_continue_button")
                        .resizable()
                        .scaledToFit()
                        .padding()
                    
                    NavigationLink(destination: SignupView()) {
                        HStack {
                            Text("Don’t have an account?")
                                .font(.wixMadeFont(.regular, fontSize: .subTitle))
                                .foregroundStyle(.gray)
                            
                            Text("Sign-Up")
                                .font(.wixMadeFont(.regular, fontSize: .subTitle))
                                .underline()
                                .foregroundColor(.white)
                        }
                    }
                    
                    Text("Continue as Guest")
                        .font(.wixMadeFont(.regular, fontSize: .subTitle))
                        .underline()
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                openTabView = true
                            }
                        }
                    
                }
                .background(
                    Image("login_background")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                )
                .navigationTitle("")
        }
    }
}

#Preview {
    LoginView()
}
