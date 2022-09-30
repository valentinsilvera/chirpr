//
//  UploadChirpViewModel.swift
//  Chirpr
//
//  Created by Valentin Silvera on 30/9/22.
//

import Foundation

class UploadChirpViewModel: ObservableObject {
    @Published var didUploadChirp = false
    let service = ChirpService()
    
    func uploadChirp(withCaption caption: String) {
        service.uploadChirp(caption: caption) { success in
            if success {
                self.didUploadChirp = true
            } else {
                //show error message to user
            }
        }
    }
}
