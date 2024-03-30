//
//  LoginView.swift
//  Soundscape
//
//  Created by admin on 04/03/24.
//

import SwiftUI
import Firebase

struct LoginView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    @State var email = ""
    @State var password = ""
    @State var openTabView: Bool = false
    
    var body: some View {
        if appViewModel.userSession != nil {
            if appViewModel.currentUser != nil {
                SoundscapeTabView()
                    .navigationBarHidden(true)
            } else {
                var email = Auth.auth().currentUser?.email ?? ""
                NicknameView(email: email)
            }
        } else {
                ScrollView {
                    Text("LOGIN")
                        .font(.wixMadeFont(.bold, fontSize: .heading))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    Button {
                        Task {
                            try await appViewModel.signInGoogle()
                            try await appViewModel.fetchUserAccount()
                            await appViewModel.deleteDatabase()
                        }
                    } label: {
                        Image("login_google_button")
                            .resizable()
                            .scaledToFit()
                            .padding()
                    }
                    
                    Button {
                        Task {
                            try await appViewModel.signInApple()
                        }
                    } label: {
                        SignInWithAppleButton(type: .default, style: .white)
                            .allowsHitTesting(false)
                    }
                    .frame(height: 44)
                    .cornerRadius(30)
                    .padding(.horizontal)
                    
                    
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
                        .hidden()
                    
                    Text("Enter Password")
                        .font(.wixMadeFont(.bold, fontSize: .title))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    HStack {
                        SecureField("Type here...", text: $password)
                            .textContentType(.password)
                            .foregroundColor(.white)
                        
                        Button {
                            
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
                    
                    Button {
                        Task {
                            try await appViewModel.signIn(withEmail: email, password: password)
                            try await appViewModel.fetchUserAccount()
                            await appViewModel.deleteDatabase()
                        }
                    } label: {
                        Image("login_continue_button")
                            .resizable()
                            .scaledToFit()
                            .padding()
                    }
                    .disabled(!formIsValid)
                    .opacity(formIsValid ? 1.0 : 0.5)
                    
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
                        .padding(.bottom, appViewModel.showBottomPlayer ? 60 : 10)
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                openTabView = true
                            }
                        }
                    
                }
                .alert(item: $appViewModel.alertItem) { alertItem in
                    Alert(title: alertItem.title,
                          message: alertItem.message,
                          dismissButton: alertItem.dismissButton)
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

extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        let emailRegex = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        
        return emailPredicate.evaluate(with: email) &&
               !password.isEmpty &&
               password.count > 5
    }
}
