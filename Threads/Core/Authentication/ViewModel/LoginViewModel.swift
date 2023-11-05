//
//  LoginViewModel.swift
//  Threads
//
//  Created by Daniel  Alves Barreto on 05/11/23.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email = "danteste@gmail.com"
    @Published var password = "123123"
    
    @MainActor
    func login() async throws {
        try await AuthService.shared.login(
            withEmail: email,
            password: password)
    }
    
}
