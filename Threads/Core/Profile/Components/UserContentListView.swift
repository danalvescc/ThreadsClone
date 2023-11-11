//
//  UserContentListView.swift
//  Threads
//
//  Created by Daniel  Alves Barreto on 11/11/23.
//

import SwiftUI

struct UserContentListView: View {
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    
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
                ForEach (1...10, id: \.self) { thread in
                    ThreadCell()
                }
            }
        }.padding(.vertical, 8)
    }
}

#Preview {
    UserContentListView()
}
