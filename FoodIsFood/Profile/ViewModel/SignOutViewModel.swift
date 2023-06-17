//
//  SignOutViewModel.swift
//  FoodIsFood
//
//  Created by Mert ATK on 14.06.2023.
//

import SwiftUI

struct SignOutViewModel: View {
    @State private var signOutCurrent: Bool = false
    var body: some View {
        NavigationView{
            if self.signOutCurrent {
                ProfileView()
            }else{
                LoginView()
            }
        }
    }
}

struct SignOutViewModel_Previews: PreviewProvider {
    static var previews: some View {
        SignOutViewModel()
    }
}
