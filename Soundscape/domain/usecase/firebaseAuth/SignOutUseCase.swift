//
//  SignOutUseCase.swift
//  Soundscape
//
//  Created by admin on 18/03/24.
//

import Foundation

final class SignOutUseCase {
    static let shared = SignOutUseCase()
    
    let firebaseAuthRepository: FirebaseAuthRepository
    
    init(firebaseAuthRepository: FirebaseAuthRepository = FirebaseAuthRepositoryImpl.shared) {
        self.firebaseAuthRepository = firebaseAuthRepository
    }
    
    func execute() -> Bool {
        return firebaseAuthRepository.signOut()
    }
}
