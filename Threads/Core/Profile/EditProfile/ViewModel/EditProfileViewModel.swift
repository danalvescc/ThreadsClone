//
//  EditProfileViewModel.swift
//  Threads
//
//  Created by Daniel  Alves Barreto on 18/11/23.
//

import SwiftUI
import PhotosUI

class EditProfileViewModel: ObservableObject {
    @Published var bio = ""
    @Published var link = ""
    @Published var isPrivate = false
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage() } }
    }
    @Published var profileImage: Image?
    private var uiImage: UIImage?
    
    
    func uploadUserData() async throws {
        try await uploadProfileImage()
    }
    
    private func loadImage() async {
        guard let item = selectedImage else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
    
    private func uploadProfileImage() async throws {
        guard let image = self.uiImage else { return }
        guard let imageUrl = try? await ImageUploader.uploadImage(image) else { return }
        try await UserService.shared.uploadUserProfileImage(withImageUrl: imageUrl)
    }
}
