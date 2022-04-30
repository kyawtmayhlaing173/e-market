//
//  Product.swift
//  e-market
//
//  Created by Kyawt May Hlaing on 26/04/2022.
//

import Foundation

struct Product: Hashable, Codable{
    var name: String
    var price: Int
    var imageUrl: String
}

struct ProductOrder: Hashable {
    var product: Product
    var quantity: Int
}

var productLists = [
    Product(name: "Coffee 1", price: 10, imageUrl: "coffee1"),
    Product(name: "Coffee 2", price: 15, imageUrl: "coffee2")
]
