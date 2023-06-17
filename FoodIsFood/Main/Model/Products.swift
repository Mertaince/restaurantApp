//
//  Products.swift
//  FoodIsFood
//
//  Created by Mert ATK on 9.06.2023.
//

import Foundation

//struct Products: Identifiable{
//    let id: String
//    let caption: String
//    let image: String
//    let price: String
//}
//
//extension Products{
//    static var products: [Products] = [
//        .init(id: NSUUID().uuidString, caption: "Tavuk", image: "tavuk", price: "100 TL"),
//        .init(id: NSUUID().uuidString, caption: "Pizza", image: "pizza", price: "70 TL"),
//        .init(id: NSUUID().uuidString, caption: "Lazanya", image: "lazanya", price: "65 TL"),
//        .init(id: NSUUID().uuidString, caption: "Hamburger", image: "hamburger", price: "70 TL"),
//        .init(id: NSUUID().uuidString, caption: "Döner", image: "doner", price: "50 TL"),
//        .init(id: NSUUID().uuidString, caption: "Kola", image: "kola", price: "10 TL"),
//    ]
//}

struct Product: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let imageName: String
    let price: Double
    var quantity: Int = 0
    
}

var products: [Product] = [
    Product(name: "Tavuk", description: "Ürün 1 açıklama", imageName: "tavuk", price: 65),
    Product(name: "Pizza", description: "Ürün 2 açıklama", imageName: "pizza", price: 78.5),
    Product(name: "Lazanya", description: "Ürün 2 açıklama", imageName: "lazanya", price: 78.5),
    Product(name: "Hamburger", description: "Ürün 2 açıklama", imageName: "hamburger", price: 78.5),
    Product(name: "Döner", description: "Ürün 3 açıklama", imageName: "doner", price: 56),
    Product(name: "Kola", description: "Ürün 4 açıklama", imageName: "cole", price: 15)
]
