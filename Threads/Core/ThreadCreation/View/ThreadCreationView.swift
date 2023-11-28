//
//  ThreadCreationView.swift
//  Threads
//
//  Created by Daniel  Alves Barreto on 02/11/23.
//

import SwiftUI

struct ThreadCreationView: View {
    @StateObject var viewModel = CreateThreadViewModel()
    @Environment(\.dismiss) var dismiss
    
    private var user: User? {
        return UserService.shared.currentUser
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .top) {
                    CircularProfileImageView(user: user)
                    VStack(alignment: .leading, spacing: 4) {
                        Text(user?.username ?? "")
                            .fontWeight(.semibold)
                        TextField("Write a thread", text: $viewModel.caption, axis: .vertical)
                    }
                    .font(.footnote)
                    
                    Spacer()
                    
                    if !viewModel.caption.isEmpty {
                        Button {
                            viewModel.caption = ""
                        } label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundStyle(Color(.gray))
                        }
                    }
                }
                Spacer()
            }
            .padding()
            .navigationTitle("New Thread")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .font(.subheadline)
                            .foregroundStyle(Color(.black))
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        Task{ try await viewModel.uploadThread()
                            dismiss()
                        }
                    } label: {
                        Text("Post")
                            .opacity(viewModel.caption.isEmpty ? 0.5 : 1.0)
                            .disabled(viewModel.caption.isEmpty)
                            .font(.subheadline)
                            .foregroundStyle(Color(.black))
                            .fontWeight(.semibold)
                    }
                }
            }
        }
    }
}

#Preview {
    ThreadCreationView()
}
