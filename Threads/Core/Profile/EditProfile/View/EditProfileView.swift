//
//  EditProfileView.swift
//  Threads
//
//  Created by Daniel  Alves Barreto on 02/11/23.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    let user: User?
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = EditProfileViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground)
                    .edgesIgnoringSafeArea([.bottom, .horizontal])
                
                VStack {
                    // Name and image
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.semibold)
                            
                            Text(user?.fullname ?? "")
                        }
                        Spacer()
                        
                        PhotosPicker(selection: $viewModel.selectedImage) {
                            if let image = viewModel.profileImage {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                            } else {
                                CircularProfileImageView(user: user)
                            }
                        }
                        
                    }
                    
                    Divider()
                    
                    // Bio
                    VStack(alignment: .leading) {
                        Text("Bio")
                            .fontWeight(.semibold)
                        TextField("Add bio...", text: $viewModel.bio, axis: .vertical)
                    }
                    
                    Divider()
                    
                    // Link
                    VStack(alignment: .leading) {
                        Text("Link")
                            .fontWeight(.semibold)
                        TextField("Add link...", text: $viewModel.link)
                    }
                    
                    Divider()
                    
                    Toggle("Private profile", isOn: $viewModel.isPrivate)
                }
                .font(.footnote)
                .padding()
                .background(.white)
                .cornerRadius(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                }
                .padding()
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }.font(.subheadline)
                        .foregroundStyle(Color(.black))
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        Task {
                            try await viewModel.uploadUserData()
                            dismiss()
                        }
                    }.font(.subheadline)
                        .foregroundStyle(Color(.black))
                        .fontWeight(.semibold)
                }
            }
        }
    }
}

#Preview {
    let user = DeveloperPreview.shared.user
    return EditProfileView(user: user)
}
