//
//  CartViewModel.swift
//  DeliveryDemo
//
//  Created by Марк Пушкарь on 30.06.2023.
//

import Foundation

import UIKit

protocol CartViewModelOutput {
    
    func remove(dish: DishModel)
    
    func add(dish: DishModel)
   
}

final class CartViewModel: CartViewModelOutput {
    
    func remove(dish: DishModel) {
        if let index = CartController.cart.firstIndex(where: {$0.0 == dish}) {
            var item = CartController.cart[index]
            if item.1 > 1 {
                item.1 -= 1
                CartController.cart[index] = item
            } else {
                CartController.cart.remove(at: index)
            }
        }
    }
    
    func add(dish: DishModel) {
        if let index = CartController.cart.firstIndex(where: {$0.0 == dish}) {
            var item = CartController.cart[index]
            item.1 += 1
            CartController.cart[index] = item
        }
    }
 
}

