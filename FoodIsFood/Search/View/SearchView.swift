//
//  SearchView.swift
//  FoodIsFood
//
//  Created by Mert ATK on 11.06.2023.
//

import SwiftUI

struct SearchView: View {
    @State private var search = ""
    var body: some View {
        NavigationStack{
            VStack{
                
            }
        }.searchable(text: $search, prompt: "Ara"){
            Text("asdasd")
        }
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
