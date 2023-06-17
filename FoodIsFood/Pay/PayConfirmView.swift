//
//  PayConfirmView.swift
//  FoodIsFood
//
//  Created by Mert ATK on 10.06.2023.
//

import SwiftUI

struct PayConfirmView: View {
    var body: some View {
        NavigationStack{
            VStack{
                Image(systemName: "chevron.down")
                    .resizable()
                    .frame(width: 50, height: 20)
                    .foregroundColor(.gray)
                    .padding()
                Spacer()
                Image(systemName: "checkmark.circle")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .foregroundColor(.green)
                Text("Ödemeniz gerçekleşti")
                Spacer()
            }
        }
    }
}

struct PayConfirmView_Previews: PreviewProvider {
    static var previews: some View {
        PayConfirmView()
    }
}
