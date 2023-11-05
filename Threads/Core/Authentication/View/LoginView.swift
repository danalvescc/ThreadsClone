//
//  LoginView.swift
//  threands
//
//  Created by Daniel  Alves Barreto on 26/10/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
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
                }
                
                NavigationLink {
                    Text("Forget password")
                } label: {
                    Text("Forget Password?")
                        .foregroundStyle(.black)
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.horizontal, 24)
                        .padding(.vertical)
                }
                
                Button (action: {
                    Task {
                        try await viewModel.login()
                    }
                }, label: {
                    Text("Login")
                        .modifier(ThreadsButtonModifier())
                })
                
                
                Spacer()
                
                Divider()
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack(spacing: 2){
                        Text("Don't have an account?")
                        Text("Sign Up")
                            .fontWeight(.bold)
                    }.foregroundColor(.black)
                        .font(.footnote)
                }
                .padding()
            }
        }
    }
}

#Preview {
    LoginView()
}
