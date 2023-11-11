//
//  CurrentProfileView.swift
//  Threads
//
//  Created by Daniel  Alves Barreto on 31/10/23.
//

import SwiftUI

struct CurrentProfileView: View {
    @StateObject var viewModel = CurrentProfileViewModel()
    
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
                            print("DEBUG: Edit")
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
                        Button {
                            print("DEBUG: Share")
                        } label: {
                            Text("Share Profile")
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
                    UserContentListView()
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
        }
    }
}

#Preview {
    CurrentProfileView()
}

