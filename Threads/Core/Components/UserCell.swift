//
//  UserCell.swift
//  Threads
//
//  Created by Daniel  Alves Barreto on 30/10/23.
//

import SwiftUI

struct UserCell: View {
    var user: User
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            CircularProfileImageView(user: user)
            VStack(alignment: .leading, spacing: 4) {
                Text(user.username)
                    .fontWeight(.semibold)
                Text(user.fullname)
            }
            .font(.footnote)
            Spacer()
            Button {
                print("DEBUG: Follow")
            } label: {
                Text("Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color(.black))
                    .frame(width: 100, height: 32)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(.systemGray4), lineWidth: 1)
                    }
            }
            
        }
        .padding(.horizontal)
 
    }
}

#Preview {
    var mook = DeveloperPreview.shared
    return UserCell(user: mook.user)
}
