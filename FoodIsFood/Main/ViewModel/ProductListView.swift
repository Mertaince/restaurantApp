//
//  ProductListView.swift
//  FoodIsFood
//
//  Created by Mert ATK on 10.06.2023.
//

import SwiftUI

struct ProductListView: View {
    @State var products: [Product]
    @State var cart: [Product] = []
    @State var isCartViewPresented = false
    
    var totalPrice: Double {
        cart.reduce(0) { $0 + Double($1.quantity) * $1.price }
    }
    
    var body: some View {
        VStack {
            List(products.indices, id: \.self) { index in
                VStack(alignment: .leading) {
                    Image(products[index].imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                    
                    Text(products[index].name)
                        .font(.headline)
                    
                    Text(products[index].description)
                        .font(.subheadline)
                    
                    
                }
                HStack {
                    
                    Button(action: {
                        incrementQuantity(for: index)
                        addToCart(product: products[index])
                    }) {
                        Image(systemName: "plus.circle")
                    }.buttonStyle(BorderedButtonStyle())
                    
                    Spacer()
                    Text("\(products[index].quantity)")
                    Spacer()
                    Button(action: {
                        decrementQuantity(for: index)
                        removeFromCart(product: products[index])
                    }) {
                        Image(systemName: "minus.circle")
                    }.buttonStyle(BorderedButtonStyle())
                        .foregroundColor(.red)
                }
            }
            
            Text("Toplam Fiyat: TL\(totalPrice, specifier: "%.2f")")
            
            Button(action: {
                isCartViewPresented = true
            }) {
                Text("Sepeti Göster")
                    .padding(10)
                    .frame(width: 150, height: 50)
                    .background(Color(.systemRed))
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }
            .sheet(isPresented: $isCartViewPresented) {
                CartView(cart: cart)
            }
        }
    }
    
    func incrementQuantity(for index: Int) {
        products[index].quantity += 1
    }
    
    func decrementQuantity(for index: Int) {
        if products[index].quantity > 0 {
            products[index].quantity -= 1
        }
    }
    
    func addToCart(product: Product) {
        if let index = cart.firstIndex(where: { $0.id == product.id }) {
            cart[index].quantity += 1
        } else {
            cart.append(product)
        }
    }
    
    func removeFromCart(product: Product) {
        if let index = cart.firstIndex(where: { $0.id == product.id }) {
            if cart[index].quantity > 0 {
                cart[index].quantity -= 1
            }
        }
    }
}



    
   




struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView(products: products)
    }
}
