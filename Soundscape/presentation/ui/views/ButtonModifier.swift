//
//  CustomModifier.swift
//  Soundscape
//
//  Created by Aman Kumar on 02/03/24.
//

import SwiftUI

struct OutlineButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.white, lineWidth: 1)
                    .frame(width: 130, height: 40)
            )
    }
}

struct FilledButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 130, height: 40)
            )
    }
}
