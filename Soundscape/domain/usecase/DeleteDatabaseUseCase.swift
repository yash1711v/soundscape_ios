//
//  DeleteDatabaseUseCase.swift
//  Soundscape
//
//  Created by Aman Kumar on 21/03/24.
//

import Foundation

final class DeleteDatabaseUseCase {
    static let shared = DeleteDatabaseUseCase()
    
    let soundscapeDatabase = SoundscapeDatabase.shared
    
    func execute() async throws {
        try await soundscapeDatabase.deleteDatabase()
    }
}
