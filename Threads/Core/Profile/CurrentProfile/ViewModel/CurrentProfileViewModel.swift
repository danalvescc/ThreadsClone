//
//  CurrentProfileViewModel.swift
//  Threads
//
//  Created by Daniel  Alves Barreto on 06/11/23.
//

import Firebase
import Combine
class CurrentProfileViewModel: ObservableObject {
    @Published var currentUser: User?
    private var cancellables = Set<AnyCancellable>()
    
    
    init () {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }.store(in: &cancellables)
    }
}
