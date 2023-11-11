//
//  ExploreView.swift
//  Threads
//
//  Created by Daniel  Alves Barreto on 30/10/23.
//

import SwiftUI

struct ExploreView: View {
    @StateObject var viewModel = ExploreViewModel()
    @State private var searchText = ""
    
    var users: [User] {
        return viewModel.users
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVStack(spacing: 2) {
                    ForEach(users) { user in
                        NavigationLink(value: user) {
                            VStack {
                                UserCell(user: user)
                                Divider()
                                
                            }.padding(.vertical, 4)
                        }
                    }
                }
            }
            .navigationTitle("Search")
            .searchable(text: $searchText, prompt: "Search")
            .navigationDestination(for: User.self) { user in
                ProfileView(user: user)
            }
        }
    }
}

#Preview {
    ExploreView()
}
