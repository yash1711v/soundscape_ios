//
//  SaveUserUseCase.swift
//  Soundscape
//
//  Created by admin on 18/03/24.
//

import Foundation

final class SaveUserUseCase {
    static let shared = SaveUserUseCase()
    
    let firebaseAuthRepository: FirebaseAuthRepository
    
    init(firebaseAuthRepository: FirebaseAuthRepository = FirebaseAuthRepositoryImpl.shared) {
        self.firebaseAuthRepository = firebaseAuthRepository
    }
    
    func execute(user: User) async throws -> Bool {
        return try await firebaseAuthRepository.saveUser(user: user)
    }
}
