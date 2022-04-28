//
//  StoreViewModel.swift
//  e-market
//
//  Created by Kyawt May Hlaing on 28/04/2022.
//

import Foundation

class StoreViewModel {
    
    func fetchStoreInformation(completion:@escaping (Store) -> ()) {
            guard let url = URL(string: "https://c8d92d0a-6233-4ef7-a229-5a91deb91ea1.mock.pstmn.io/storeInfo") else { return }
            
            URLSession.shared.dataTask(with: url) { (data, _, _) in
                let storeInfo = try! JSONDecoder().decode(Store.self, from: data!)
                print("Store Information", storeInfo)
                
                DispatchQueue.main.async {
                    completion(storeInfo)
                }
            }
            .resume()
        }
}
