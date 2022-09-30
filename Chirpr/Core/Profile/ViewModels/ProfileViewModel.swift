//
//  ProfileViewModel.swift
//  Chirpr
//
//  Created by Valentin Silvera on 30/9/22.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var chirps = [Chirp]()
    private let service = ChirpService()
    let user: User
    
    init(user: User) {
        self.user = user
        self.fetchUserChirps()
    }
    
    func fetchUserChirps() {
        guard let uid = user.id else { return }
        service.fetchChirps(forUid: uid) {chirps in
            self.chirps = chirps
            
            for i in 0 ..< chirps.count {
                self.chirps[i].user = self.user
            }
        }
    }
}
