//
//  MockStoreService.swift
//  e-marketTests
//
//  Created by Kyawt May Hlaing on 01/05/2022.
//

@testable import e_market

final class MockStoreService: StoreServiceProtocol {
    
    func fetchStoreInformation(completion:@escaping (Store) -> ()) {
        completion(Store(name: "The Coffee Shop", openingTime: "15:01:01.772Z", closingTime: "19:45:51.365Z"))
    }
}
