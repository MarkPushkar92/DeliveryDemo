//
//  FirtsScreenViewModel.swift
//  DeliveryDemo
//
//  Created by Марк Пушкарь on 28.06.2023.
//


import UIKit

protocol FirstScreenOutput {
    
    func getCategories(closure: @escaping() -> ()) -> (Void)
    
    func getCategoryDetails(closure: @escaping() -> ())
    
    var onTapShowNextModule: (String) -> Void { get }
    
    var showDishDetailedInfo: (DishModel) -> Void { get }
    
    func sendToCart(dish: DishModel) -> Void
   
}

final class FirtsScreenViewModel: FirstScreenOutput {
    
    var categories = [CategoryModel]()
    
    var categoryDetails = [DishModel]()

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
    
    func getCategoryDetails(closure: @escaping() -> ()) {
        categoryDetails.removeAll()
        networkService.fetchDetails(completion: { details in
            guard let details = details else { return }
            details.dishes?.forEach({ dish in
                let id = dish.id
                let name = dish.name
                let price = dish.price
                let weight = dish.weight
                let description = dish.description
                let imageURL = dish.imageURL
                let tegs = dish.tegs
                let model = DishModel(id: id, name: name, price: price, weight: weight,
                                      description: description, imageURL: imageURL, tegs: tegs)
                self.categoryDetails.append(model)
            })
            closure()

        })
    }
    
    func sendToCart(dish: DishModel) -> Void {
        if CartController.cart.contains(where: {$0.0 == dish}) {
            print("такое я уже взял")
            if let index = CartController.cart.firstIndex(where: {$0.0 == dish}) {
                var item = CartController.cart[index]
                item.1 += 1
                CartController.cart[index] = item
            }
        } else {
            CartController.cart.append((dish, 1))
        }
    }

    
    // интерфейс для отправки данных в координатор
    var onShowNext: ((String) -> Void)?
    
    var showDish: ((DishModel) -> Void)?

    // интерфейс для приема данных от ViewController
    lazy var onTapShowNextModule: (String) -> Void = {  [weak self] name in
        self?.onShowNext?(name)
    }
    
    lazy var showDishDetailedInfo: (DishModel) -> Void = { [weak self] dish in
        self?.showDish?(dish)
    }
 
}

