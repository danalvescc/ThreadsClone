//
//  ProfileThreadFilter.swift
//  Threads
//
//  Created by Daniel  Alves Barreto on 31/10/23.
//

import Foundation

enum ProfileThreadFilter: Int, CaseIterable, Identifiable {
    case threads 
    case replies
    
    var title: String {
        switch self  {
        case .threads: return "Threads"
        case .replies: return "Replies"
        }
    }
    
    var id: Int { return self.rawValue }
}
