//
//  ThreadCell.swift
//  Threads
//
//  Created by Daniel  Alves Barreto on 30/10/23.
//

import SwiftUI

struct ThreadCell: View {
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 12) {
                CircularProfileImageView(imageName: "Dan_profile")
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("Daniel")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        Spacer()
                        Text("10m")
                            .font(.caption)
                            .foregroundStyle(Color(.systemGray3))
                        Button {
                            print("something")
                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundStyle(Color(.darkGray))
                        }

                    }
                    Text("Algum post sobre algo")
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                    
                    HStack(spacing: 16) {
                        Button {
                            
                        } label: {
                            Image(systemName: "heart")
                        }
                        Button {
                            
                        } label: {
                            Image(systemName: "bubble.right")
                        }
                        Button {
                            
                        } label: {
                            Image(systemName: "arrow.rectanglepath")
                        }
                        Button {
                            
                        } label: {
                            Image(systemName: "paperplane")
                        }
                    }
                    .foregroundStyle(Color(.black))
                    .padding(.vertical, 8)
                    
                    Text("2 likes")
                        .font(.footnote)
                        .foregroundStyle(Color(.systemGray2))
                }
            }
            Divider()
        }
        .padding()
    }
}

#Preview {
    ThreadCell()
}
