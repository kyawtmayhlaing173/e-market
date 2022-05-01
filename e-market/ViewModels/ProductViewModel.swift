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
    @Published private(set) var success: Bool = false
    @Published private(set) var products: [Product] = []
    
    init(productService: ProductServiceProtocol = ProductService()) {
        self.productService = productService
    }
    
    func fetchProducts() {
        productService.fetchProducts { (results) in
            DispatchQueue.main.async {
                self.products = results
            }
        }
    }
    
    func postOrder(order: [ProductOrder], delivery_address: String) {
            productService.postOrder(order: order, delivery_address: delivery_address) { (status) in
                DispatchQueue.main.async {
                    self.success = status
                }
            }
        }
    
    func postOrder(order: [ProductOrder], delivery_address: String, completion:@escaping (Bool) -> ()) {
        productService.postOrder(order: order, delivery_address: delivery_address) { (status) in
            DispatchQueue.main.async {
                self.success = status
                completion(self.success)
            }
        }
    }
}
