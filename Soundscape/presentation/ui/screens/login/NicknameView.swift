//
//  NicknameView.swift
//  Soundscape
//
//  Created by admin on 04/03/24.
//

import SwiftUI

struct NicknameView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    @State var nickname = ""
    var email: String
    
    var body: some View {
        if appViewModel.isUserDataSaved == true {
            SoundscapeTabView()
                .navigationBarHidden(true)
                .task {
                    Task {
                        try await appViewModel.fetchUserAccount()
                    }
                }
        } else {
            VStack {
                Spacer()
                Text("HOW ABOUT A NAME?")
                    .font(.wixMadeFont(.bold, fontSize: .heading))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                Text("Username")
                    .font(.wixMadeFont(.bold, fontSize: .title))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                TextField("Type here...", text: $nickname)
                    .foregroundColor(.white)
                    .padding(.horizontal, 30)
                    .modifier(OutlineBigButtonStyle())
                
                Spacer()
                
                Button {
                    Task {
                        guard let uid = appViewModel.userSession?.uid else {
                            return
                        }
                        try await appViewModel.saveUserAccount(user: User(id: uid, email: email, nickname: nickname))
                    }
                } label: {
                    Image("signup_continue_button")
                        .resizable()
                        .scaledToFit()
                        .padding()
                }
                
                Spacer()
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
    NicknameView(email: "")
}

