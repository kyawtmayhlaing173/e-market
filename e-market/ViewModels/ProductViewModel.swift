//
//  ProductViewModel.swift
//  e-market
//
//  Created by Kyawt May Hlaing on 28/04/2022.
//
import Foundation
import Alamofire

class ProductViewModel: ObservableObject {
    
    private let productService: ProductServiceProtocol
    
    init(productService: ProductServiceProtocol = ProductService()) {
        self.productService = productService
    }
    
    func fetchProducts(completion:@escaping([Product]) -> ()) {
        productService.fetchProducts { (results) in
            DispatchQueue.main.async {
                completion(results)
            }
        }
    }
    
    func postOrder(order: [ProductOrder], delivery_address: String, completion:@escaping (Bool) -> ()) {
        productService.postOrder(order: order, delivery_address: delivery_address) { (status) in
            DispatchQueue.main.async {
                completion(status)
            }
        }
    }
}
