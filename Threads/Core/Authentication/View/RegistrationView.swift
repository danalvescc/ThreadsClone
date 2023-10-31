//
//  RegistrationView.swift
//  threands
//
//  Created by Daniel  Alves Barreto on 26/10/23.
//

import SwiftUI

struct RegistrationView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var email = ""
    @State private var password = ""
    @State private var fullName = ""
    @State private var username = ""
    var body: some View {
        VStack {
            Spacer()
            
            Image("Threads-Logo")
                .resizable()
                .scaledToFit()
                .padding()
                .frame(width: 300)
            
            VStack {
                TextField("Enter your email", text: $email)
                    .modifier(ThreadsTextFieldModifier())
                    .autocapitalization(.none)
                SecureField("Enter your password", text: $password)
                    .modifier(ThreadsTextFieldModifier())
                TextField("Enter your full name", text: $fullName)
                    .modifier(ThreadsTextFieldModifier())
                TextField("Enter your username", text: $username)
                    .modifier(ThreadsTextFieldModifier())
            }
            
            Button (action: {
                print("Teste")
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
