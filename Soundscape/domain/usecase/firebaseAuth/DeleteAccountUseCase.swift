//
//  DeleteAccountUseCase.swift
//  Soundscape
//
//  Created by admin on 18/03/24.
//

import Foundation
import Firebase

final class DeleteAccountUseCase {
    static let shared = DeleteAccountUseCase()
    
    let firebaseAuthRepository: FirebaseAuthRepository
    
    init(firebaseAuthRepository: FirebaseAuthRepository = FirebaseAuthRepositoryImpl.shared) {
        self.firebaseAuthRepository = firebaseAuthRepository
    }
    
    func execute(userSession: Firebase.User) async throws -> Bool {
        return try await firebaseAuthRepository.deleteAccount(userSession: userSession)
    }
}
