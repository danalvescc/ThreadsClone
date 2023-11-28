//
//  ProfileView.swift
//  Threads
//
//  Created by Daniel  Alves Barreto on 11/11/23.
//

import SwiftUI

struct ProfileView: View {
    var user: User
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                ProfileHeader(user: user)
                HStack {
                    Button {
                        print("DEBUG: Share")
                    } label: {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(.black))
                            .frame(maxWidth: .infinity, minHeight: 32)
                            .overlay {
                                Text("Follow")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color(.white))
                            }
                    }
                }
                UserContentListView(user: user)
            }
        }.padding(.horizontal)
    }
}

#Preview {
    var mook = DeveloperPreview.shared
    return ProfileView(user: mook.user)
}
