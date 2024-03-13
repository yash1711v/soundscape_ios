//
//  LoadingView.swift
//  Soundscape
//
//  Created by Aman Kumar on 13/03/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .brandPurple))
                .scaleEffect(2)
        }
    }
}

#Preview {
    LoadingView()
}
