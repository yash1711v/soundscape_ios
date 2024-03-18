//
//  FirebaseAuthRepositoryImpl.swift
//  Soundscape
//
//  Created by admin on 18/03/24.
//

import Foundation
import Firebase

final class FirebaseAuthRepositoryImpl: FirebaseAuthRepository {
    static let shared = FirebaseAuthRepositoryImpl()
    
    let firebaseAuthRemoteDataSource: FirebaseAuthRemoteDataSource
    
    init(firebaseAuthRemoteDataSource: FirebaseAuthRemoteDataSource = FirebaseAuthRemoteDataSourceImpl()) {
        self.firebaseAuthRemoteDataSource = firebaseAuthRemoteDataSource
    }
    
    func signIn(withEmail email: String, password: String) async throws -> Firebase.User? {
        return try await firebaseAuthRemoteDataSource.signIn(withEmail: email, password: password)
    }
    
    func createUser(withEmail email: String, password: String) async throws -> Firebase.User? {
        return try await firebaseAuthRemoteDataSource.createUser(withEmail: email, password: password)
    }
    
    func signInGoogle() async throws -> Firebase.User? {
        return try await firebaseAuthRemoteDataSource.signInGoogle()
    }
    
    func signOut() -> Bool {
        return firebaseAuthRemoteDataSource.signOut()
    }
    
    func deleteAccount(userSession: Firebase.User) async throws -> Bool {
        return try await firebaseAuthRemoteDataSource.deleteAccount(userSession: userSession)
    }
    
    func fetchUser() async throws -> User? {
        return try await firebaseAuthRemoteDataSource.fetchUser()
    }
    
    func forgotPassword(withEmail email: String) async throws -> Bool {
        return try await firebaseAuthRemoteDataSource.forgotPassword(withEmail: email)
    }
    
    func saveUser(user: User) async throws -> Bool {
        return try await firebaseAuthRemoteDataSource.saveUser(user: user)
    }
}
