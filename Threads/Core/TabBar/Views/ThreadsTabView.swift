//
//  ThreadsTabView.swift
//  Threads
//
//  Created by Daniel  Alves Barreto on 28/10/23.
//

import SwiftUI

struct ThreadsTabView: View {
    @State private var selectedTab = 0
    var body: some View {
        TabView(selection: $selectedTab) {
            Text("Home")
                .tabItem {
                    Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                        .environment(\.symbolVariants, selectedTab == 0 ? .fill :  .none)
                }
                .onAppear {
                    selectedTab = 0
                }
                .tag(0)
            Text("Explore")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .tag(1)
            Text("Upload")
                .tabItem {
                    Image(systemName: "plus")
                }
                .tag(2)
            Text("Activity")
                .tabItem {
                    Image(systemName: selectedTab == 3 ? "heart.fill" : "heart")
                        .environment(\.symbolVariants, selectedTab == 3 ? .fill :  .none)
                        
                }
                .tag(3)
            Text("Profile")
                .tabItem {
                    Image(systemName: selectedTab == 4 ? "person.fill" : "person")
                        .environment(\.symbolVariants, selectedTab == 4 ? .fill :  .none)
                }
                .tag(4)
        }
        .tint(.black)
    }
}

#Preview {
    ThreadsTabView()
}
