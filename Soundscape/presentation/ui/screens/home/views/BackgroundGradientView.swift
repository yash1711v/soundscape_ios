//
//  BackgroundGradientView.swift
//  Soundscape
//
//  Created by Aman Kumar on 02/03/24.
//

import SwiftUI

struct BackgroundGradientView: View {
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
    }
}
