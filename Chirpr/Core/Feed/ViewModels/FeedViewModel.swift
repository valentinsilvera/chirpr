//
//  FeedViewModel.swift
//  Chirpr
//
//  Created by Valentin Silvera on 30/9/22.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var chirps = [Chirp]()
    let service = ChirpService()
    let userService = UserService()
    
    init() {
        fetchChirps()
    }
    
    func fetchChirps() {
        service.fetchChirps { chirps in
            self.chirps = chirps
            
            for i in 0 ..< chirps.count {
                let uid = chirps[i].uid
                
                self.userService.fetchUser(withUid: uid) { user in
                    self.chirps[i].user = user
                }
            }
        }
    }
}
