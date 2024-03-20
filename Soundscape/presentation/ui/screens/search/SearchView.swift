//
//  SearchView.swift
//  Soundscape
//
//  Created by admin on 20/03/24.
//

import SwiftUI
import Lottie

struct SearchView: View {
    var body: some View {
        VStack {
            LottieView(animationFileName: "loading", loopMode: .loop)
        }
        .background(.white)
    }
}

#Preview {
    SearchView()
}
