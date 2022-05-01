//
//  MockProductService.swift
//  e-marketTests
//
//  Created by Kyawt May Hlaing on 01/05/2022.
//

import Foundation
@testable import e_market

final class MockProductService: ProductServiceProtocol {
    func fetchProducts(completion: @escaping ([Product]) -> ()) {
        completion([Product(name: "Hello", price: 0, imageUrl: "")])
    }
    
    func postOrder(order: [ProductOrder], delivery_address: String, completion: @escaping (Bool) -> ()) {
        completion(true)
    }
}
