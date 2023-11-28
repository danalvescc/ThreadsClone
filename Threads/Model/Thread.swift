//
//  Thread.swift
//  Threads
//
//  Created by Daniel  Alves Barreto on 27/11/23.
//

import Firebase
import FirebaseFirestoreSwift

struct Thread: Identifiable, Codable {
    @DocumentID var threadId: String?
    var id: String {
        return threadId ?? NSUUID().uuidString
    }
    
    let ownerUid: String
    let caption: String
    let timestamp: Timestamp
    var likes: Int
    
    var user: User?
}
