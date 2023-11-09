//
//  DeveloperPreview.swift
//  Threads
//
//  Created by Daniel  Alves Barreto on 08/11/23.
//

import Foundation

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let user = User(id: NSUUID().uuidString, fullname: "Angélica Alves", username: "angel-barreto", email: "angelbarreto@gmail.com")
}
