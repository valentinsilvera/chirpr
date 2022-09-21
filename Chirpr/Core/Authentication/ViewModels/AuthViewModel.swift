//
//  AuthViewModel.swift
//  Chirpr
//
//  Created by Valentin Silvera on 21/9/22.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: Firebase.User?
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email: String, password: String) {
        
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String) {
        
    }
}
