//
//  DBError.swift
//  Soundscape
//
//  Created by Aman Kumar on 14/03/24.
//

import Foundation

enum DBError: Error {
    case dataSourceError
    case createError
    case deleteError
    case updateError
    case fetchError
}
