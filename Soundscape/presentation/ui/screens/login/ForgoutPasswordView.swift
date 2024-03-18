//
//  ForgoutPasswordView.swift
//  Soundscape
//
//  Created by admin on 04/03/24.
//

import SwiftUI

struct ForgoutPasswordView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    @State var email = ""
    
    var body: some View {
        VStack {
            Spacer()
            Text("FORGOT PASSWORD")
                .font(.wixMadeFont(.bold, fontSize: .heading))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            Text("Email ID")
                .font(.wixMadeFont(.bold, fontSize: .title))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            TextField("Type here...", text: $email)
                .foregroundColor(.white)
                .padding(.horizontal, 30)
                .modifier(OutlineBigButtonStyle())
            
            Text("Password reset link has been sent to your email address.")
                .font(.wixMadeFont(.regular, fontSize: .title))
                .padding()
            
            Spacer()
            
            Button {
                Task {
                    try await appViewModel.forgoutPassword(withEmail: email)
                }
            } label: {
                Image("login_continue_button")
                    .resizable()
                    .scaledToFit()
                    .padding()
            }
            
            Spacer()
            
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

#Preview {
    ForgoutPasswordView()
}
