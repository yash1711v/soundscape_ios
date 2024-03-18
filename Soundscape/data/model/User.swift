//
//  User.swift
//  Soundscape
//
//  Created by admin on 18/03/24.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let email: String
    let nickname: String
}
