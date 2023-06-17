//
//  registerUser.swift
//  FoodIsFood
//
//  Created by Mert ATK on 16.06.2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

func registerUser(user: User, completion: @escaping (Result<String, Error>) -> Void) {
    Auth.auth().createUser(withEmail: user.email, password: user.password) { (authResult, error) in
        if let error = error {
            completion(.failure(error))
            return
        }
        
        let db = Firestore.firestore()
        let userData = [
            "firstName": user.firstName,
            "lastName": user.lastName,
            // Diğer kullanıcı verilerini buraya ekleyin...
        ]
        
        // Firestore'da kullanıcı verilerini kaydedin
        let userId = authResult?.user.uid ?? ""
        db.collection("users").document(userId).setData(userData) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success("Kullanıcı başarıyla kaydedildi."))
            }
        }
    }
}

