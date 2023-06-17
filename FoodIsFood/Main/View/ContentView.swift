//
//  ContentView.swift
//  FoodIsFood
//
//  Created by Mert ATK on 9.06.2023.
//

import SwiftUI

struct ContentView: View {
    @State var cart: [Product] = []
    var body: some View {
        NavigationStack{
            VStack{
                VStack{
                    //Header
                    ZStack{
                        
                    }
                    HStack{
                        Image("Logo")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 60, height: 60)
                            .padding(.horizontal, 22)
                    }
                    //Producter
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(alignment: .center){
                            Button{
                                
                            }label:{
                                Text("Yiyecekler")
                                    .modifier(MainButtonModifier())
                                
                                
                            }
                            Button{
                                
                            }label:{
                                Text("Tatlılar")
                                    .modifier(MainButtonModifier())
                            }
                            Button{
                                
                            }label:{
                                Text("İçecekler")
                                    .modifier(MainButtonModifier())
                            }
                            Button{
                                
                            }label:{
                                Text("Diğer")
                                    .modifier(MainButtonModifier())
                            }
                        }.padding()
                    }
                    
                    VStack{
                        ProductListView(products: products)
                    }
                }
                
            }
            
        }
    }
}
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
