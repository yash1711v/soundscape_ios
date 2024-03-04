//
//  FontExtension.swift
//  Soundscape
//
//  Created by Aman Kumar on 02/03/24.
//

import SwiftUI

enum WixMadeforText: String {
    case regular = "WixMadeforText-Regular"
    case bold = "WixMadeforText-Bold"
    case semiBold = "WixMadeforText-semiBold"
}

enum FontSize: CGFloat {
    case body = 12
    case titleSmall = 14
    case subTitle = 16
    case title = 18
    case subHeading = 20
    case heading = 25
    case splash = 40
}

// TODO: Setup with relative to later on
extension Font {
    static func wixMadeFont(_ font: WixMadeforText, fontSize: FontSize) -> Font {
        custom(font.rawValue, size: fontSize.rawValue)
    }
}
