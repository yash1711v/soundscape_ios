//
//  AuthError.swift
//  Soundscape
//
//  Created by admin on 18/03/24.
//

import Foundation

enum AuthError: Error {
    case loginError
    case invalidEmailError
    case userExistError
    case wrongPasswordError
}
