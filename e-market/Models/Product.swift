//
//  Product.swift
//  e-market
//
//  Created by Kyawt May Hlaing on 26/04/2022.
//

import Foundation

struct Product:Decodable, Hashable{
    var name: String
    var price: Int
    var imageUrl: String
}

var productLists = [
    Product(name: "Coffee 1", price: 10, imageUrl: "coffee1"),
    Product(name: "Coffee 2", price: 15, imageUrl: "coffee2")
]
