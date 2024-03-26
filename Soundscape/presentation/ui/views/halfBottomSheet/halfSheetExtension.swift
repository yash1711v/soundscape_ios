//
//  halfSheetExtension.swift
//  Soundscape
//
//  Created by Aman Kumar on 26/03/24.
//

import SwiftUI

extension View {
    // MARK: For bottom Sheet

    func halfSheet<SheetView: View>(showSheet: Binding<Bool>, @ViewBuilder sheeView: @escaping () -> SheetView) -> some View {
        return background {
            HalfSheetHelper(sheetView: sheeView(), showSheet: showSheet)
        }
    }
}
