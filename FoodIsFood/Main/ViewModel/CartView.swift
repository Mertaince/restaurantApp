//
//  CartView.swift
//  FoodIsFood
//
//  Created by Mert ATK on 10.06.2023.
//

import SwiftUI

struct CartView: View {
    @State var cart: [Product] = []
    
    var totalPrice: Double {
        cart.reduce(0) { $0 + Double($1.quantity) * $1.price }
    }
    
    var body: some View {
        NavigationStack{
            VStack {
                VStack(alignment: .leading){
                    Text("Sepetim")
                        .font(.system(size:30))
                        .bold()
                        .padding()
                    Divider()
                    
                    
                    
                }
                List(cart.indices, id: \.self) { index in
                    VStack(alignment: .leading) {
                        Image(cart[index].imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                        
                        Text(cart[index].name)
                            .font(.headline)
                        
                        Text(cart[index].description)
                            .font(.subheadline)
                        
                        
                        HStack {
                            Spacer()
                            
                            Button(action: {
                                removeFromCart(product: cart[index])
                            }) {
                                Image(systemName: "minus.circle")
                            }
                        }
                        
                    }
                }
                NavigationLink{
                  PayView()
                }label:{
                    Text("Ödeme Yap")
                        .modifier(ButtonModifier())
                }
                
                Text("Toplam Fiyat: TL \(totalPrice, specifier: "%.2f")")
            }
        }
    }
        func removeFromCart(product: Product) {
            if let index = cart.firstIndex(where: { $0.id == product.id }) {
                if cart[index].quantity > 0 {
                    cart[index].quantity -= 1
                }
                
                if cart[index].quantity == 0 {
                    cart.remove(at: index)
                }
            }
        }
    }




struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
