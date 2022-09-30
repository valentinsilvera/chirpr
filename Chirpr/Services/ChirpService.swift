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
        Firestore.firestore().collection("chirps")
            .order(by: "timestamp", descending: true)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                
                let chirps = documents.compactMap({ try? $0.data(as: Chirp.self)})
                completion(chirps)
            }
    }
    
    func fetchChirps(forUid uid: String, completion: @escaping([Chirp]) -> Void) {
        Firestore.firestore().collection("chirps")
            .whereField("uid", isEqualTo: uid)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                
                let chirps = documents.compactMap({ try? $0.data(as: Chirp.self)})
                // .order doesn't work when filtering, so we need a manual ordering
                completion(chirps.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() }))
            }
    }
    
    func likeChirp(_ chirp: Chirp, completion: @escaping() -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let chirpId = chirp.id else { return }
        
        let userLikesRef = Firestore.firestore().collection("users")
            .document(uid)
            .collection("users-likes")
        
        Firestore.firestore().collection("chirps").document(chirpId)
            .updateData(["chirps": chirp.likes + 1]) { _ in
                userLikesRef.document(chirpId).setData([:]) { _ in
                    completion()
                }
            }
    }
    
    func checkIfUserLikedChirp(_ chirp: Chirp, completion: @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let chirpId = chirp.id else { return }
        
        Firestore.firestore()
            .collection("users")
            .document(uid).collection("user-likes")
            .document(chirpId).getDocument { snapshot, _ in
                guard let snapshot = snapshot else { return }
                completion(snapshot.exists)
            }
    }
}
