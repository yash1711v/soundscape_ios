//
//  FetchUserUseCase.swift
//  Soundscape
//
//  Created by admin on 18/03/24.
//

import Foundation

final class FetchUserUseCase {
    static let shared = FetchUserUseCase()
    
    let firebaseAuthRepository: FirebaseAuthRepository
    
    init(firebaseAuthRepository: FirebaseAuthRepository = FirebaseAuthRepositoryImpl.shared) {
        self.firebaseAuthRepository = firebaseAuthRepository
    }
    
    func execute() async throws -> User? {
        return try await firebaseAuthRepository.fetchUser()
    }
}
