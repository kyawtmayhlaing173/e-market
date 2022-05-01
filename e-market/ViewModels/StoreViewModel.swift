//
//  StoreViewModel.swift
//  e-market
//
//  Created by Kyawt May Hlaing on 28/04/2022.
//
import Foundation

class StoreViewModel: ObservableObject {
    
    private let storeService: StoreServiceProtocol
    @Published private(set) var storeInfo: Store = Store(name: "", openingTime: "", closingTime: "")
    
    init(storeService: StoreServiceProtocol = StoreService()) {
        self.storeService = storeService
    }
    
    func fetchStoreInformation() {
        storeService.fetchStoreInformation { (store) in
            DispatchQueue.main.async {
                self.storeInfo = store
            }
        }
    }
}
