//
//  Factory.swift
//  DeliveryDemo
//
//  Created by Марк Пушкарь on 28.06.2023.
//

import Foundation

protocol ControllerFactory {
    func makeFirstScreen() -> (viewModel: FirtsScreenViewModel, controller: ViewController)
    
}

struct ControllerFactoryImpl: ControllerFactory {
    
    func makeFirstScreen() -> (viewModel: FirtsScreenViewModel, controller: ViewController) {
        let viewModel = FirtsScreenViewModel()
        let vc = ViewController(viewModel: viewModel)
        return (viewModel, vc)
    }
 
}
