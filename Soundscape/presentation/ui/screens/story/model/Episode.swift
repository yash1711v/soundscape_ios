//
//  Episodes.swift
//  Soundscape
//
//  Created by admin on 07/03/24.
//

import Foundation

struct Episode: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let songPath: String
}
