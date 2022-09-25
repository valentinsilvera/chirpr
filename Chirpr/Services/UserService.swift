//
//  UserService.swift
//  Chirpr
//
//  Created by Valentin Silvera on 25/9/22.
//

import Firebase

struct UserService {
    
    func fetchUser(withUid uid: String, completion: @escaping) {
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, _ in
                guard let data = snapshot else { return }
                
                guard let user = try? snapshot?.data(as: User.self) else { return }
                
                print("DEBUG: Username is \(user.username) with email \(user.email)")
            }
    }
}
