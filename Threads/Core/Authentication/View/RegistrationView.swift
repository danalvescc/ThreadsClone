//
//  RegistrationView.swift
//  threands
//
//  Created by Daniel  Alves Barreto on 26/10/23.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var viewModel = RegistrationViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Spacer()
            
            Image("Threads-Logo")
                .resizable()
                .scaledToFit()
                .padding()
                .frame(width: 300)
            
            VStack {
                TextField("Enter your email", text: $viewModel.email)
                    .modifier(ThreadsTextFieldModifier())
                    .autocapitalization(.none)
                SecureField("Enter your password", text: $viewModel.password)
                    .modifier(ThreadsTextFieldModifier())
                    .autocapitalization(.none)
                TextField("Enter your full name", text: $viewModel.fullname)
                    .modifier(ThreadsTextFieldModifier())
                TextField("Enter your username", text: $viewModel.username)
                    .modifier(ThreadsTextFieldModifier())
                    .autocapitalization(.none)
            }
            
            Button (action: {
                Task { try await viewModel.createUser() }
            }, label: {
                Text("Sign up")
                    .modifier(ThreadsButtonModifier())
            })
            
            
            Spacer()
            
            Divider()
            Button {
                dismiss()
            } label: {
                HStack(spacing: 2){
                    Text("Already have an account?")
                    Text("Sign in")
                        .fontWeight(.bold)
                }.foregroundColor(.black)
                    .font(.footnote)
            }
            .padding()
        }
    }
}

#Preview {
    RegistrationView()
}
