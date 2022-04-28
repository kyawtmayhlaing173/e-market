//
//  ProductViewModel.swift
//  e-market
//
//  Created by Kyawt May Hlaing on 28/04/2022.
//

import Foundation

class ProductViewModel {
    
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
    
//    func loadData() {
//        guard let url = URL(string: "https://c8d92d0a-6233-4ef7-a229-5a91deb91ea1.mock.pstmn.io/products") else {
//            print("Invalid URL")
//            return
//        }
//        let request = URLRequest(url: url)
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let data = data {
//                if let response = try? JSONDecoder().decode([Product].self, from: data) {
//                    DispatchQueue.main.async {
//                        self.results = response
//                        isLoading = false
//                        print("Results", results)
//                    }
//                    return
//                }
//            }
//        }.resume()
//    }
}
