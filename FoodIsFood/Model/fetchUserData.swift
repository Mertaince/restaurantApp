//
//  fetchUserData.swift
//  FoodIsFood
//
//  Created by Mert ATK on 16.06.2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

func fetchUserData(completion: @escaping (Result<User, Error>) -> Void) {
    guard let userId = Auth.auth().currentUser?.uid else {
        completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Kullanıcı oturumu açık değil"])))
        return
    }
    
    let db = Firestore.firestore()
    db.collection("users").document(userId).getDocument { (snapshot, error) in
        if let error = error {
            completion(.failure(error))
            return
        }
        
        if let data = snapshot?.data(),
           let firstName = data["firstName"] as? String,
           let lastName = data["lastName"] as? String {
           let user = User(firstName: firstName, lastName: lastName, email: "", password: "")
            completion(.success(user))
        } else {
            completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Kullanıcı verileri bulunamadı"])))
        }
    }
}
