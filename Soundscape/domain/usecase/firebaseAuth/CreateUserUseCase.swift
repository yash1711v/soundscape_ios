//
//  CreateUserUseCase.swift
//  Soundscape
//
//  Created by admin on 18/03/24.
//

import Foundation
import Firebase

final class CreateUserUseCase {
    static let shared = CreateUserUseCase()
    
    let firebaseAuthRepository: FirebaseAuthRepository
    
    init(firebaseAuthRepository: FirebaseAuthRepository = FirebaseAuthRepositoryImpl.shared) {
        self.firebaseAuthRepository = firebaseAuthRepository
    }
    
    func execute(withEmail email: String, password: String) async throws -> Firebase.User? {
        return try await firebaseAuthRepository.createUser(withEmail: email, password: password)
    }
}
