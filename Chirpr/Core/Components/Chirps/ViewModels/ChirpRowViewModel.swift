//
//  ChirpRowViewModel.swift
//  Chirpr
//
//  Created by Valentin Silvera on 30/9/22.
//

import Foundation

class ChirpRowViewModel: ObservableObject {
    @Published var chirp: Chirp
    private let service = ChirpService()
    
    init(chirp: Chirp) {
        self.chirp = chirp
        checkIfUserLikedChirp()
    }
    
    func likeChirp() {
        service.likeChirp(chirp) {
            self.chirp.didLike = true
        }
    }
    
    func checkIfUserLikedChirp() {
        service.checkIfUserLikedChirp(chirp) { didLike in
            if didLike {
                self.chirp.didLike = true
            }
        }
    }
}
