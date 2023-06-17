//
//  PayView.swift
//  FoodIsFood
//
//  Created by Mert ATK on 10.06.2023.
//

import SwiftUI

struct PayView: View {
    @State private var cardNo = ""
    @State private var calender = ""
    @State private var BcNo = ""
    var body: some View {
        NavigationStack{
            VStack{
                ZStack{
                    
                    Color.green
                        .edgesIgnoringSafeArea([.top])
                    Image("card")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 300, height: 300)
                        .shadow(color: .white, radius: 30, x: 10, y: 10)
                    
                }
                Spacer()
                
                VStack{
                    Text("Kart bilgilerinizi doğru şekilde giriniz.")
                        .font(.footnote)
                        .foregroundColor(Color(.systemGray2))
                        .padding()
                    
                    TextField("Kredi Kartının 16 hanesi", text: $cardNo)
                        .modifier(TextFieldModifier())
                    
                    HStack{
                        TextField("12/23", text: $calender)
                            .modifier(TextFieldModifier())
                        TextField("CVC", text: $BcNo)
                            .modifier(TextFieldModifier())
                    }
                    NavigationLink{
                        PayConfirmView()
                            .navigationBarBackButtonHidden(true)
                        
                    }label:{
                        Text("Ödemeyi Yap")
                            .modifier(ButtonModifier())
                    }
                    Spacer()
                }
                
            }
        }
    }
}

struct PayView_Previews: PreviewProvider {
    static var previews: some View {
        PayView()
    }
}
