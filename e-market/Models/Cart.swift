//
//  Cart.swift
//  e-market
//
//  Created by Kyawt May Hlaing on 28/04/2022.
//

import Foundation

struct Cart:Decodable, Hashable{
    var name: String
    var price: Int
    var imageUrl: String
    var count: Int = 0
}
