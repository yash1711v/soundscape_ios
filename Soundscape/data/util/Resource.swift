//
//  Resource.swift
//  Soundscape
//
//  Created by admin on 13/03/24.
//

import Foundation

enum Resource<T> {
    case success(T)
    case loading(T?)
    case error(String, T?)
}
