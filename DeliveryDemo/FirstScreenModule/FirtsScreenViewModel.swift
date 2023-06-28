//
//  FirtsScreenViewModel.swift
//  DeliveryDemo
//
//  Created by Марк Пушкарь on 28.06.2023.
//


import UIKit

protocol FirstScreenOutput {
    
    func getCategories(closure: @escaping() -> ()) -> (Void)
   
}

final class FirtsScreenViewModel: FirstScreenOutput {
    
    var categories = [CategoryModel]()
    
    private let networkService = NetworkFetcherService()

    func getCategories(closure: @escaping() -> ()) {
        networkService.fetchCategories { categories in
            if let categories = categories {
                categories.сategories?.forEach({ category in
                    let image = category.imageURL
                    let name = category.name
                    let id = category.id
                    let categoryModel = CategoryModel(id: id, name: name, imageURL: image)
                    self.categories.append(categoryModel)
                })
                closure()
            }
        }
    }
    
    
    
  
    
   
}

