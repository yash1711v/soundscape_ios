//
//  BlurView.swift
//  Soundscape
//
//  Created by admin on 11/03/24.
//

import SwiftUI

struct BlurView: UIViewRepresentable {
    
    
    func makeUIView(context: Context) -> some UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemChromeMaterial))
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
}
