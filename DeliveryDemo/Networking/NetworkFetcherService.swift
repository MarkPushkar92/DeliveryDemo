//
//  NetworkFetcherService.swift
//  DeliveryDemo
//
//  Created by Марк Пушкарь on 28.06.2023.
//

import Foundation

class NetworkFetcherService {
    
    private let networkDataFetcher = DataFetcher()
        

    func fetchCategories(completion: @escaping (Categories?) -> Void) {
        let urlString = "https://run.mocky.io/v3/058729bd-1402-4578-88de-265481fd7d54"
        networkDataFetcher.fetchData(urlString: urlString, response: completion)
    }
    
    
    
}
