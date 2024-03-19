//
//  FirebaseAuthImpl.swift
//  Soundscape
//
//  Created by admin on 18/03/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import GoogleSignIn
import GoogleSignInSwift

final class FirebaseAuthRemoteDataSourceImpl: FirebaseAuthRemoteDataSource {
    static let shared = FirebaseAuthRemoteDataSourceImpl()
    
    func signIn(withEmail email: String, password: String) async throws -> Firebase.User? {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            return result.user
        } catch let error as AuthErrorCode {
            switch error.code {
            case .invalidEmail:
                throw AuthError.invalidEmailError
            case .invalidCredential:
                throw AuthError.invalidEmailError
            case .wrongPassword:
                throw AuthError.wrongPasswordError
            default:
                throw AuthError.loginError
            }
        }
    }
    
    func createUser(withEmail email: String, password: String) async throws -> Firebase.User? {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            return result.user
        } catch let error as AuthErrorCode {
            switch error.code {
            case .invalidEmail:
                throw AuthError.invalidEmailError
            case .invalidCredential:
                throw AuthError.invalidEmailError
            case .emailAlreadyInUse:
                throw AuthError.userExistError
            default:
                throw AuthError.loginError
            }
        }
    }
    
    @MainActor
    func signInGoogle() async throws -> Firebase.User? {
        do {
            guard let topVC = TopViewUtil.shared.topViewController() else {
                throw URLError(.cannotFindHost)
            }

            let googleResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: topVC)
            
            guard let idToken = googleResult.user.idToken?.tokenString else {
                throw URLError(.cannotFindHost)
            }
            
            let accessToken = googleResult.user.accessToken.tokenString
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
            let result = try await Auth.auth().signIn(with: credential)
            return result.user
        } catch {
            print("DEBUG: Failed with error \(error.localizedDescription)")
            return nil
        }
    }
    
    func signOut() -> Bool {
        do {
            try Auth.auth().signOut()
            return true
        } catch {
            print("DEBUG: Failed with error \(error.localizedDescription)")
            return false
        }
    }
    
    func deleteAccount(userSession: Firebase.User) async throws -> Bool {
        do {
            try await userSession.delete()
            let uid = userSession.uid
            try await Firestore.firestore().collection("users").document(uid).delete()
            return true
        } catch {
            print("DEBUG: Failed to delete account with error \(error.localizedDescription)")
            return false
        }
    }
    
    func fetchUser() async throws -> User? {
        do {
            guard let uid = Auth.auth().currentUser?.uid else { throw URLError(.cannotFindHost)  }
            guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else {
                throw URLError(.cannotFindHost)
            }
            
            if let userData = snapshot.data()?["user"] as? [String: Any] {
                var users: [User] = []
                for (_, value) in userData {
                    if let userDict = value as? [String: Any] {
                        do {
                            let user = try Firestore.Decoder().decode(User.self, from: userDict)
                            users.append(user)
                        } catch {
                            // Handle decoding error here
                            print("Failed to decode song: \(error.localizedDescription)")
                        }
                    }
                }
                return users.first
            } else {
                // No user found
                return nil
            }
        } catch {
            throw error
        }
    }
    
    func forgotPassword(withEmail email: String) async throws -> Bool {
        do {
            try await Auth.auth().sendPasswordReset(withEmail: email)
            return true
        } catch {
            print("DEBUG: Failed with error \(error.localizedDescription)")
            return false
        }
    }
    
    func saveUser(user: User) async throws -> Bool {
        do {
            let encodeUser = try Firestore.Encoder().encode(user)
            let userData = ["\(user.id)": encodeUser]
            try await Firestore.firestore().collection("users").document(user.id).setData(["user": userData], merge: true)
            return true
        } catch {
            print("DEBUG: Failed with error \(error.localizedDescription)")
            return false
        }
    }
}
