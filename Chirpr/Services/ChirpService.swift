//
//  ChirpService.swift
//  Chirpr
//
//  Created by Valentin Silvera on 30/9/22.
//

import Firebase

struct ChirpService {
    func uploadChirp(caption: String, completion: @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let data = ["uid": uid,
                    "caption": caption,
                    "likes": 0,
                    "timestamp": Timestamp(date: Date())] as [String : Any]
        
        Firestore.firestore().collection("chirps").document()
            .setData(data) { error in
                if let error {
                    print("DEBUG: Failed with error: \(error.localizedDescription)")
                    completion(false)
                    return
                } else {
                    completion(true)
                }
            }
    }
    
    func fetchChirps(completion: @escaping([Chirp]) -> Void) {
        Firestore.firestore().collection("chirps").getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            
            let chirps = documents.compactMap({ try? $0.data(as: Chirp.self)})
            completion(chirps)
        }
    }
}
