//
//  TabBar.swift
//  FoodIsFood
//
//  Created by Mert ATK on 11.06.2023.
//

import SwiftUI

struct TabBar: View {
    @State static var signOutCurrent = false
    @State private var selectIndex = 0
    var body: some View {
        TabView(selection: $selectIndex){
            ContentView()
                .onAppear(){
                    selectIndex = 0
                }.tabItem(){
                    Image(systemName: "house")
                        
                }.tag(0)
            
            SearchView()
                .onAppear(){
                    selectIndex = 1
                }.tabItem(){
                    Image(systemName: "magnifyingglass.circle")
                }.tag(1)
            
            ProfileView()
                .onAppear(){
                    selectIndex = 2
                }.tabItem {
                    Image(systemName: "person")
                }.tag(2)
            
            
        }
            
        
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
