//
//  CurrentProfileView.swift
//  Threads
//
//  Created by Daniel  Alves Barreto on 31/10/23.
//

import SwiftUI

struct CurrentProfileView: View {
    @StateObject var viewModel = CurrentProfileViewModel()
    @State var showEdit = false
    
    private var currentUser: User? {
        return viewModel.currentUser
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    if let user = currentUser {
                        ProfileHeader(user: user)
                    }
                    HStack {
                        Button {
                            showEdit.toggle()
                        } label: {
                            Text("Edit Profile")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color(.black))
                                .frame(maxWidth: .infinity, minHeight: 32)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color(.systemGray4), lineWidth: 1)
                                }
                        }
                    }
                    
                    
                    if let user = currentUser {
                        UserContentListView(user: user)
                    }
                }
            }.padding(.horizontal)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            AuthService.shared.signOut()
                        } label: {
                            Image(systemName: "line.3.horizontal")
                        }
                        
                    }
                }
                .sheet(isPresented: $showEdit, content: {
                    EditProfileView(user: currentUser)
                })
        }
    }
}

#Preview {
    CurrentProfileView()
}

