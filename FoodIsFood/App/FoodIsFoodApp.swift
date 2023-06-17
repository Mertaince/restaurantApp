//
//  FoodIsFoodApp.swift
//  FoodIsFood
//
//  Created by Mert ATK on 9.06.2023.
//

import SwiftUI
import Firebase

@main
struct FoodIsFoodApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    @State private var sessionManeger = SessionManager()
    var body: some Scene {
        WindowGroup {
            LoginView()
                .environmentObject(sessionManeger)
        }
    }
}
