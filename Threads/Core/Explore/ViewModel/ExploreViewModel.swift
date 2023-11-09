//
//  ExploreViewModel.swift
//  Threads
//
//  Created by Daniel  Alves Barreto on 08/11/23.
//

import SwiftUI

class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task { try await fetchUsers()}
    }
    
    @MainActor
    func fetchUsers() async throws{
        self.users = try await UserService.shared.fetchUsers()
    }
}
