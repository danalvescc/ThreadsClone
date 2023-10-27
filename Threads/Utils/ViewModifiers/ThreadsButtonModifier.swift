//
//  ThreadsButtonModifier.swift
//  threands
//
//  Created by Daniel  Alves Barreto on 26/10/23.
//

import SwiftUI

struct ThreadsButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .fontWeight(.bold)
            .foregroundStyle(.white)
            .padding(.vertical, 12)
            .frame(maxWidth: .infinity)
            .background(Color(.black))
            .cornerRadius(10)
            .padding(24)
    }
}
