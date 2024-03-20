//
//  SignupVIew.swift
//  Soundscape
//
//  Created by admin on 04/03/24.
//

import SwiftUI

struct SignupView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    @Environment (\.dismiss) var dismiss
    @State var email = ""
    @State var password = ""
    @State var openTabView: Bool = false
    @State var openNicknameView: Bool = false
    
    var body: some View {
        if openTabView {
            SoundscapeTabView()
                .navigationBarHidden(true)
        } else if openNicknameView {
            NicknameView(email: email)
        } else {
            ScrollView {
                Text("CREATE AN ACCOUNT")
                    .font(.wixMadeFont(.bold, fontSize: .heading))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                Button {
                    Task {
                        try await appViewModel.signInGoogle()
                        guard let gmail = appViewModel.userSession?.email else {
                            return
                        }
                        email = gmail
                        openNicknameView = true
                    }
                } label: {
                    Image("signup_google_button")
                        .resizable()
                        .scaledToFit()
                        .padding()
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
                
                Text("Email id already in use")
                    .font(.wixMadeFont(.regular, fontSize: .body))
                    .foregroundColor(.errorRed)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .padding(.top, 5)
                    .hidden()
                
                Text("Enter Password")
                    .font(.wixMadeFont(.bold, fontSize: .title))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                HStack {
                    SecureField("Type here...", text: $password)
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
                
                NavigationLink {
                    ForgoutPasswordView()
                } label: {
                    Text("Forgout Password")
                        .font(.wixMadeFont(.regular, fontSize: .title))
                        .underline()
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding()
                }
                
                Button {
                    Task {
                        try await appViewModel.createUserAccount(withEmail: email, password: password)
                        openNicknameView = true
                    }
                } label: {
                    Image("signup_continue_button")
                        .resizable()
                        .scaledToFit()
                        .padding()
                }
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1.0 : 0.5)
                
                Button {
                    dismiss()
                } label: {
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
            .alert(item: $appViewModel.alertItem) { alertItem in
                Alert(title: alertItem.title,
                      message: alertItem.message,
                      dismissButton: alertItem.dismissButton)
            }
            .navigationTitle("")
        }
    }
}

#Preview {
    SignupView()
}

extension SignupView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        let emailRegex = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        
        return emailPredicate.evaluate(with: email) &&
               !password.isEmpty &&
               password.count > 5
    }
}
