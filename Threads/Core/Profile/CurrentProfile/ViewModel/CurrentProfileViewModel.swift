//
//  CurrentProfileViewModel.swift
//  Threads
//
//  Created by Daniel  Alves Barreto on 06/11/23.
//

import Firebase
import Combine
import PhotosUI
import SwiftUI

class CurrentProfileViewModel: ObservableObject {
    @Published var currentUser: User?
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage() } }
    }
    @Published var profileImage: Image?
    
    private var cancellables = Set<AnyCancellable>()
    
    
    init () {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }.store(in: &cancellables)
    }
    
    private func loadImage() async {
        guard let item = selectedImage else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.profileImage = Image(uiImage: uiImage)
    }
}
