//
//  RegistrationViewModel.swift
//  Threads
//
//  Created by Daniel  Alves Barreto on 03/11/23.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var fullname = ""
    @Published var username = ""
    
    @MainActor
    func login() async throws {
        
    }
    
    @MainActor
    func createUser() async throws {
        try await AuthService.shared.createUser(
            withEmail: email,
            password: password,
            fullname: fullname,
            username: username)
    }
    
}
