//
//  ThreadCreationView.swift
//  Threads
//
//  Created by Daniel  Alves Barreto on 02/11/23.
//

import SwiftUI

struct ThreadCreationView: View {
    @State private var caption = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .top) {
                    CircularProfileImageView() // TODO: CHANGE
                    VStack(alignment: .leading, spacing: 4) {
                        Text("soudanalves")
                            .fontWeight(.semibold)
                        TextField("Write a thread", text: $caption, axis: .vertical)
                    }
                    .font(.footnote)
                    
                    Spacer()
                    
                    if !caption.isEmpty {
                        Button {
                            caption = ""
                        } label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundStyle(Color(.gray))
                        }
                    }
                }
                Spacer()
            }
            .padding()
                .navigationTitle("New Thread")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Text("Cancel")
                                .font(.subheadline)
                                .foregroundStyle(Color(.black))
                        }
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            
                        } label: {
                            Text("Post")
                                .opacity(caption.isEmpty ? 0.5 : 1.0)
                                .disabled(caption.isEmpty)
                                .font(.subheadline)
                                .foregroundStyle(Color(.black))
                                .fontWeight(.semibold)
                        }
                    }
                }
        }
    }
}

#Preview {
    ThreadCreationView()
}
