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
    Product(name: "Latte", price: 50, imageUrl: "coffee1"),
    Product(name: "Dark Tiramisu Mocha", price: 75, imageUrl: "coffee2")
]
