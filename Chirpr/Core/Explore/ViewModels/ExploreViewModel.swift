//
//  ExploreViewModel.swift
//  Chirpr
//
//  Created by Valentin Silvera on 27/9/22.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    let service = UserService()
    
    func fetchUsers() {
        service.fetchUsers { users in
            self.users = users
        }
    }
}
