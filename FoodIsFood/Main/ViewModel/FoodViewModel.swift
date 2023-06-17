//
//  FoodViewModel.swift
//  FoodIsFood
//
//  Created by Mert ATK on 9.06.2023.
//

import SwiftUI

struct FoodViewModel: View {
    
    var body: some View {
        VStack{
            ZStack{
                Color.gray.frame(width: 350, height: 300, alignment: .center)
                    .cornerRadius(10)
//                Image(products.image)
//                    .resizable()
//                    .scaledToFit()
//                    .clipped()
//                    .frame(width: 250, height: 250)
//                    .clipped()
//                    .shadow(color: .white, radius: 40, x: 10, y: 10)
            }
            ZStack{
                Color.gray.frame(width: UIScreen.main.bounds.width - (10*10) / 2, height: UIScreen.main.bounds.height - (52*30) / 2, alignment: .center)
                    .cornerRadius(10)
                HStack{
//                    Text(products.caption)
//                        .bold()
//                        .font(.system(size:20))
//                    Text(products.price)
//                        .bold()
//                        .font(.system(size: 20))
                    Spacer()
                }.padding(.horizontal, 40)
            }
        }
    }
}

struct FoodViewModel_Previews: PreviewProvider {
    static var previews: some View {
        FoodViewModel()
    }
}

func buttonHeight() -> CGFloat{
    UIScreen.main.bounds.height - (5*12) / 4
}
