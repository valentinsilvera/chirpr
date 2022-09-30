//
//  Chirp.swift
//  Chirpr
//
//  Created by Valentin Silvera on 30/9/22.
//

import Firebase
import FirebaseFirestoreSwift

struct Chirp: Identifiable, Decodable {
    @DocumentID var id: String?
    let caption: String
    let timestamp: Timestamp
    let uid: String
    var likes: Int
    
    var user: User?
}
