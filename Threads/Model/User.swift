//
//  User.swift
//  Threads
//
//  Created by Daniel  Alves Barreto on 06/11/23.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    var id: String
    var fullname: String
    var username: String
    var email: String
    var bio: String?
    var profileImageUrl: String?
}
