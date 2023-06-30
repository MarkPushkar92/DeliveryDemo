//
//  CartCoordinator.swift
//  DeliveryDemo
//
//  Created by Марк Пушкарь on 30.06.2023.
//

import UIKit

class CartCoordinator: Coordinator {
    
    var coordinators: [Coordinator] = []
    let navigation: UINavigationController
    let factory: ControllerFactory

    private lazy var cart = {
        factory.makeCart()
    }()
    
    init(navigation: UINavigationController,factory: ControllerFactory) {
        self.navigation = navigation
        self.factory = factory
    }
    
    func start() {
        navigation.pushViewController(cart.controller, animated: true)
        
    }
    
   
}
