//
//  ProfileView.swift
//  Threads
//
//  Created by Daniel  Alves Barreto on 31/10/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    
    private var currentUser: User? {
        return viewModel.currentUser
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 12) {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(currentUser?.fullname ?? "")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                Text(currentUser?.username ?? "")
                                    .font(.subheadline)
                            }
                            if let bio = currentUser?.bio {
                                Text(bio)
                                    .font(.footnote)
                            }
                            Text("2 followers")
                                .font(.caption)
                                .foregroundStyle(Color(.systemGray2))
                        }
                        
                        Spacer()
                        
                        CircularProfileImageView(imageName: "Dan_profile")
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
    //                    Button {
    //                        print("DEBUG: Share")
    //                    } label: {
    //                        RoundedRectangle(cornerRadius: 10)
    //                            .fill(Color(.black))
    //                            .frame(maxWidth: .infinity, minHeight: 32)
    //                            .overlay {
    //                                Text("Follow")
    //                                    .font(.subheadline)
    //                                    .fontWeight(.semibold)
    //                                    .foregroundStyle(Color(.white))
    //                            }
    //                    }
                    }
                    VStack {
                        HStack {
                            ForEach(ProfileThreadFilter.allCases) { filter in
                                VStack {
                                    VStack {
                                        Text(filter.title)
                                            .font(.subheadline)
                                            .fontWeight(selectedFilter == filter ? .semibold : .regular)
                                            .foregroundStyle(Color(.black))
                                        
                                        if selectedFilter == filter {
                                            Rectangle()
                                                .fill(Color(.black))
                                                .frame(height: 2)
                                                .matchedGeometryEffect(id: "item", in: animation)
                                        } else {
                                            Rectangle()
                                                .fill(Color(.clear))
                                                .frame(height: 2)
                                        }
                                    }
                                }.frame(maxWidth: .infinity)
                                    .onTapGesture {
                                        withAnimation(.spring()) {
                                            selectedFilter = filter
                                        }
                                    }
                                
                            }
                        }
                        LazyVStack {
                            ForEach (1...10, id: \.self) { thread in
                                ThreadCell()
                            }
                        }
                    }.padding(.vertical, 8)
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
    ProfileView()
}
