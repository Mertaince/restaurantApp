//
//  SessionManager.swift
//  FoodIsFood
//
//  Created by Mert ATK on 16.06.2023.
//  Firebase Auth SignOut

import Foundation
import FirebaseAuth
import Combine

class SessionManager: ObservableObject {
    @Published var isLoggedIn: Bool = false
    
    
    func signOut(){
        do{
            try Auth.auth().signOut()
            isLoggedIn = false
            print("Çıkıs yapıldı")
        }catch{
            print("Çıkış hatası \(error.localizedDescription)")
        }
    }
    
    
}
