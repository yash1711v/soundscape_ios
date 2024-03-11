//
//  MarqueeText.swift
//  Soundscape
//
//  Created by admin on 11/03/24.
//

import SwiftUI

struct MarqueeText: View {
    @State var text: String
    var font: UIFont
    @State var storedSize: CGSize = .zero
    @State var offset: CGFloat = 0
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            Text(text)
                .font(Font(font))
                .offset(x: offset)
        }
        .disabled(true)
        .onAppear {
            let baseText = text
            storedSize = textSize()
            text.append(baseText)
            
            let timing: Double = (0.02 * storedSize.width)
        
            withAnimation(.linear(duration: timing)) {
                offset = -storedSize.width
            }
            
        }
        .onReceive(Timer.publish(every: ((0.02 * storedSize.width)), on: .main, in: .default).autoconnect()) { _ in
            offset = 0
            withAnimation(.linear(duration: (0.02 * storedSize.width))) {
                offset = -storedSize.width
            }
        }
    }
    
    func textSize() ->  CGSize {
        let attributes = [NSAttributedString.Key.font: font]
        let size = (text as NSString).size(withAttributes: attributes)
        return size
    }
}
