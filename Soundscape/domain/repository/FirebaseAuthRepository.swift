//
//  FirebaseAuthRepository.swift
//  Soundscape
//
//  Created by admin on 18/03/24.
//

import Foundation
import Firebase

protocol FirebaseAuthRepository {
    func signIn(withEmail email: String, password: String) async throws -> Firebase.User?
    func createUser(withEmail email: String, password: String) async throws -> Firebase.User?
    func signInGoogle() async throws -> Firebase.User?
    func signOut() -> Bool
    func deleteAccount(userSession: Firebase.User) async throws -> Bool
    func fetchUser() async throws -> User?
    func forgotPassword(withEmail email: String) async throws -> Bool
    func saveUser(user: User) async throws -> Bool
}
