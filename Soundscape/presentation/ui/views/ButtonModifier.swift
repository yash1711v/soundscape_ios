//
//  CustomModifier.swift
//  Soundscape
//
//  Created by Aman Kumar on 02/03/24.
//

import SwiftUI

struct OutlineSmallButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.white, lineWidth: 1)
                    .frame(width: 150, height: 40)
            )
    }
}

struct FilledSmallButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 150, height: 40)
            )
    }
}

struct OutlineBigButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.white, lineWidth: 1)
                    .frame(width: 370, height: 40)
            )
    }
}

struct FilledBigButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 370, height: 40)
            )
    }
}
