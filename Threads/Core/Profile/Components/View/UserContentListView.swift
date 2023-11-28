//
//  UserContentListView.swift
//  Threads
//
//  Created by Daniel  Alves Barreto on 11/11/23.
//

import SwiftUI

struct UserContentListView: View {
    @StateObject var viewModel: UserContentListViewModel
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: UserContentListViewModel(user: user))
    }
    
    var body: some View {
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
                ForEach (viewModel.threads) { thread in
                    ThreadCell(thread: thread)
                }
            }
        }.padding(.vertical, 8)
    }
}

#Preview {
    let mock = DeveloperPreview.shared.user
    return UserContentListView(user: mock)
}
