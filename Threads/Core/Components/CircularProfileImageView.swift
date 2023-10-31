//
//  CircularProfileImageView.swift
//  Threads
//
//  Created by Daniel  Alves Barreto on 30/10/23.
//

import SwiftUI

struct CircularProfileImageView: View {
    var imageName: String
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .frame(width: 40, height: 40)
            .clipShape(Circle())
    }
}

#Preview {
    CircularProfileImageView(imageName: "Dan_profile")
}
