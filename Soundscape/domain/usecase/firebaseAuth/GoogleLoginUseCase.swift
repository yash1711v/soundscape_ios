//
//  GoogleLoginUseCase.swift
//  Soundscape
//
//  Created by admin on 18/03/24.
//

import Foundation
import Firebase

final class GoogleLoginUseCase {
    static let shared = GoogleLoginUseCase()
    
    let firebaseAuthRepository: FirebaseAuthRepository
    
    init(firebaseAuthRepository: FirebaseAuthRepository = FirebaseAuthRepositoryImpl.shared) {
        self.firebaseAuthRepository = firebaseAuthRepository
    }
    
    func execute() async throws -> Firebase.User? {
        return try await firebaseAuthRepository.signInGoogle()
    }
}
