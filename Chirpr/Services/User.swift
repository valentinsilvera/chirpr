//
//  User.swift
//  Chirpr
//
//  Created by Valentin Silvera on 25/9/22.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let email: String
}
