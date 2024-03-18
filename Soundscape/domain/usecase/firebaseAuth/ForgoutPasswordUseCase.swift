//
//  ForgoutPasswordUseCase.swift
//  Soundscape
//
//  Created by admin on 18/03/24.
//

import Foundation

final class ForgoutPasswordUseCase {
    static let shared = ForgoutPasswordView()
    
    let firebaseAuthRepository: FirebaseAuthRepository
    
    init(firebaseAuthRepository: FirebaseAuthRepository = FirebaseAuthRepositoryImpl.shared) {
        self.firebaseAuthRepository = firebaseAuthRepository
    }
    
    func execute(withEmail email: String) async throws -> Bool {
        return try await firebaseAuthRepository.forgotPassword(withEmail: email)
    }
}
