//
//  SignupVIew.swift
//  Soundscape
//
//  Created by admin on 04/03/24.
//

import SwiftUI

struct SignupView: View {
    @State var emailId: Binding<String> = .constant("")
    @State var password: Binding<String> = .constant("")
    @State var openTabView: Bool = false
    
    var body: some View {
        if openTabView {
            SoundscapeTabView()
                .navigationBarHidden(true)
        } else {
            VStack {
                Text("CREATE AN ACCOUNT")
                    .font(.wixMadeFont(.bold, fontSize: .heading))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                Image("signup_google_button")
                    .resizable()
                    .scaledToFit()
                    .padding()
                
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
                
                TextField("Type here...", text: emailId)
                    .foregroundColor(.white)
                    .padding(.horizontal, 30)
                    .modifier(OutlineBigButtonStyle())
                
                Text("Email id already in use")
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
                    TextField("Type here...", text: emailId)
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
                
                Image("signup_continue_button")
                    .resizable()
                    .scaledToFit()
                    .padding()
                
                NavigationLink(destination: LoginView()) {
                    HStack {
                        Text("Already have an account?")
                            .font(.wixMadeFont(.regular, fontSize: .subTitle))
                            .foregroundStyle(.gray)
                        
                        Text("Login")
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
                Image("signup_background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            )
            .navigationTitle("")
        }
    }
}

#Preview {
    SignupView()
}
