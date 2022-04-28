//
//  Store.swift
//  e-market
//
//  Created by Kyawt May Hlaing on 28/04/2022.
//

import Foundation

struct Store:Decodable, Hashable{
    var name: String
    var openingTime: String
    var closingTime: String
}
