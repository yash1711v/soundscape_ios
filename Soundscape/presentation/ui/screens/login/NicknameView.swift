//
//  NicknameView.swift
//  Soundscape
//
//  Created by admin on 04/03/24.
//

import SwiftUI

struct NicknameView: View {
    @State var nickname: Binding<String> = .constant("")
    
    var body: some View {
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
            
            TextField("Type here...", text: nickname)
                .foregroundColor(.white)
                .padding(.horizontal, 30)
                .modifier(OutlineBigButtonStyle())

            Spacer()
            
            Image("signup_continue_button")
                .resizable()
                .scaledToFit()
                .padding()
            
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

#Preview {
    NicknameView()
}
