//
//  ProfileHeader.swift
//  Threads
//
//  Created by Daniel  Alves Barreto on 11/11/23.
//

import Foundation
import SwiftUI

struct ProfileHeader: View {
    var user: User
    
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 12) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(user.fullname)
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text(user.username)
                        .font(.subheadline)
                }
                if let bio = user.bio {
                    Text(bio)
                        .font(.footnote)
                }
                Text("2 followers")
                    .font(.caption)
                    .foregroundStyle(Color(.systemGray2))
            }
            
            Spacer()
            
            CircularProfileImageView(user: user)
        }
    }
}
