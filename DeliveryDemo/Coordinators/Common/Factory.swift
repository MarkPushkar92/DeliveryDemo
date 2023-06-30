//
//  Factory.swift
//  DeliveryDemo
//
//  Created by Марк Пушкарь on 28.06.2023.
//

import Foundation

protocol ControllerFactory {
    func makeFirstScreen() -> (viewModel: FirtsScreenViewModel, controller: ViewController)
    
    func makeCart() -> (viewModel: CartViewModel, controller: CartController)
    
}

struct ControllerFactoryImpl: ControllerFactory {
    
    func makeFirstScreen() -> (viewModel: FirtsScreenViewModel, controller: ViewController) {
        let viewModel = FirtsScreenViewModel()
        let vc = ViewController(viewModel: viewModel)
        return (viewModel, vc)
    }
    
    func makeCart() -> (viewModel: CartViewModel, controller: CartController) {
        let viewModel = CartViewModel()
        let vc = CartController(viewModel: viewModel)
        return (viewModel, vc)
    }
 
}
