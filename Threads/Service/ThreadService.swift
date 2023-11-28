//
//  ThreadService.swift
//  Threads
//
//  Created by Daniel  Alves Barreto on 27/11/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct ThreadService {
    static func uploadThread(_ thread: Thread) async throws {
        guard let threadData = try? Firestore.Encoder().encode(thread) else { return }
        let ref = try await Firestore.firestore().collection("threads").addDocument(data: threadData)
    }
}
