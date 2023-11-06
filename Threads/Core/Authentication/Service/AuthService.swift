//
//  AuthService.swift
//  Threads
//
//  Created by Daniel  Alves Barreto on 03/11/23.
//

import Firebase
import FirebaseFirestoreSwift

class AuthService {
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func login(withEmail: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: withEmail, password: password)
            self.userSession = result.user
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(withEmail: String, password: String, fullname: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: withEmail, password: password)
            self.userSession = result.user
            try await uploadUserData(id: result.user.uid, email: withEmail, fullname: fullname, username: username)
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        try? Auth.auth().signOut()
        self.userSession = nil
    }
    
    @MainActor
    private func uploadUserData(
        id: String,
        email: String,
        fullname: String,
        username: String
    ) async throws {
        let user = User(id: id, fullname: fullname, username: username, email: email)
        guard let userData = try? Firestore.Encoder().encode(user) else {
            return
        }
        try await Firestore.firestore().collection("users").document(id).setData(userData)
    }
}
