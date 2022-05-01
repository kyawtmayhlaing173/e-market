//
//  ProductService.swift
//  e-market
//
//  Created by Kyawt May Hlaing on 30/04/2022.
//

import Foundation
import Alamofire

protocol ProductServiceProtocol {
    func fetchProducts(completion:@escaping ([Product]) -> ())
    func postOrder(order: [ProductOrder], delivery_address: String, completion:@escaping (Bool) -> ())
}

class ProductService: ProductServiceProtocol {
    func fetchProducts(completion:@escaping ([Product]) -> ()) {
        guard let url = URL(string: "https://c8d92d0a-6233-4ef7-a229-5a91deb91ea1.mock.pstmn.io/products") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let results = try! JSONDecoder().decode([Product].self, from: data!)
            print(results)
            
            DispatchQueue.main.async {
                completion(results)
            }
        }
        .resume()
    }
    
    func postOrder(order: [ProductOrder], delivery_address: String, completion:@escaping (Bool) -> ()){
        var products: [Product] = []
        for item in order {
            products.append(item.product)
        }
        
        let parameters: [String: Any] = [
            "products": products,
            "delivery_address": delivery_address
        ]
        
        print("Parameters", parameters)
        
        DispatchQueue.main.async {
            AF.request("https://jsonplaceholder.typicode.com/posts", method: .post, parameters: parameters)
                .validate(statusCode: 200..<300)
                .validate(contentType: ["application/json"])
                .responseData { response in
                    switch response.result {
                    case .success:
                        print("Validation Successful")
                        completion(true)
                    case .failure(let error):
                        print("Validation Error", error)
                        completion(false)
                    }
                }
        }
        
    }
}
