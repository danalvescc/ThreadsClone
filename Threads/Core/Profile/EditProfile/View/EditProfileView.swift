//
//  EditProfileView.swift
//  Threads
//
//  Created by Daniel  Alves Barreto on 02/11/23.
//

import SwiftUI

struct EditProfileView: View {
    @State private var bio = ""
    @State private var link = ""
    @State private var isPrivate = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground)
                    .edgesIgnoringSafeArea([.bottom, .horizontal])
                
                VStack {
                    // Name and image
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.semibold)
                            
                            Text("Daniel Alves")
                        }
                        Spacer()
                        CircularProfileImageView(imageName: "Dan_profile")
                    }
                    
                    Divider()
                    
                    // Bio
                    VStack(alignment: .leading) {
                        Text("Bio")
                            .fontWeight(.semibold)
                        TextField("Add bio...", text: $bio, axis: .vertical)
                    }
                    
                    Divider()
                    
                    // Link
                    VStack(alignment: .leading) {
                        Text("Link")
                            .fontWeight(.semibold)
                        TextField("Add link...", text: $link)
                    }
                    
                    Divider()
                    
                    Toggle("Private profile", isOn: $isPrivate)
                }
                .font(.footnote)
                .padding()
                .background(.white)
                .cornerRadius(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                }
                .padding()
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        
                    }.font(.subheadline)
                        .foregroundStyle(Color(.black))
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        
                    }.font(.subheadline)
                        .foregroundStyle(Color(.black))
                        .fontWeight(.semibold)
                }
            }
        }
    }
}

#Preview {
    EditProfileView()
}
