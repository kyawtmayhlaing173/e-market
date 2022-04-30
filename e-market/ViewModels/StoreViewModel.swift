//
//  StoreViewModel.swift
//  e-market
//
//  Created by Kyawt May Hlaing on 28/04/2022.
//
import Foundation

class StoreViewModel: ObservableObject {
    
    private let storeService: StoreServiceProtocol
    
    init(storeService: StoreServiceProtocol = StoreService()) {
        self.storeService = storeService
    }
    
    func fetchStoreInformation(completion:@escaping (Store) -> ()) {
        storeService.fetchStoreInformation { (storeInfo) in
            DispatchQueue.main.async {
                completion(storeInfo)
            }
        }
    }
}
