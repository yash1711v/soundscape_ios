//
//  SettingView.swift
//  Soundscape
//
//  Created by admin on 28/02/24.
//

import SwiftUI

struct SettingView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView(.vertical, showsIndicators: false) {
                    Text("Account")
                        .font(.wixMadeFont(.bold, fontSize: .heading))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    if appViewModel.currentUser == nil {
                        CreateAccountView()
                    } else {
                        LoggedInAccountView(showAlert: $showAlert)
                    }

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
                            .onTapGesture {
                                guard let url = URL(string: "http://www.boostproductivity.online/soundscape/privacypolicy") else { return }
                                UIApplication.shared.open(url)
                            }
                        if appViewModel.userSession != nil {
                            Label("Log out", systemImage: "rectangle.portrait.and.arrow.right.fill")
                                .padding(.bottom, 10)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .onTapGesture {
                                    appViewModel.signOut()
                                    Task {
                                        await appViewModel.deleteDatabase()
                                    }
                                }
                        }
                    }
                    .padding(.horizontal)
                    
                    if appViewModel.userSession != nil {
                        Text("Delete Account")
                            .font(.wixMadeFont(.regular, fontSize: .subTitle))
                            .foregroundColor(.errorRed)
                            .background(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(.errorRed, lineWidth: 1)
                                    .frame(width: 370, height: 40)
                            )
                            .padding()
                            .onTapGesture {
                                Task {
                                    try await appViewModel.deleteAccount()
                                    await appViewModel.deleteDatabase()
                                }
                            }
                    }
                    
                    Text("Version")
                        .font(.wixMadeFont(.bold, fontSize: .body))
                        .underline()
                        .padding(.top)
                    
                    Text("1.0.0")
                        .font(.wixMadeFont(.bold, fontSize: .body))
                        .padding(.bottom)
                }
                .task {
                    Task {
                        try await appViewModel.fetchUserAccount()
                    }
                }
            }
            .background(
                Image("setting_background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            )
            .alert(isPresented: $showAlert) {
                AlertContext.passwordResetLink
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingView().environmentObject(AppViewModel())
}

struct CreateAccountView: View {
    var body: some View {
        NavigationLink {
            SignupView()
        } label: {
            Text("CREATE AN ACCOUNT")
                .font(.wixMadeFont(.regular, fontSize: .subTitle))
                .modifier(OutlineBigButtonStyle())
                .padding()
        }
        .foregroundColor(.white)
        
        NavigationLink {
            LoginView()
        } label: {
            Text("Already A Member? Log in")
                .font(.wixMadeFont(.regular, fontSize: .body))
        }
        .foregroundColor(.white)
    }
}

struct LoggedInAccountView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    @Binding var showAlert: Bool
    
    var body: some View {
        Text("Username")
            .font(.wixMadeFont(.regular, fontSize: .title))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
        
        Text(appViewModel.currentUser?.nickname ?? "")
            .font(.wixMadeFont(.regular, fontSize: .title))
            .foregroundColor(.gray)
            .modifier(OutlineBigButtonStyle())
            .padding()
        
        Text("Email")
            .font(.wixMadeFont(.regular, fontSize: .title))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
        
        Text(appViewModel.currentUser?.email ?? "")
            .font(.wixMadeFont(.regular, fontSize: .title))
            .foregroundColor(.gray)
            .modifier(OutlineBigButtonStyle())
            .padding()
        
        Button {
            Task {
                guard let email = appViewModel.currentUser?.email else {
                    return
                }
                try await appViewModel.forgotPassword(withEmail: email)
                showAlert = true
            }
        } label: {
            Text("Change Password")
                .font(.wixMadeFont(.regular, fontSize: .title))
                .underline()
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .padding(.bottom)
        .padding(.horizontal)
    }
}
