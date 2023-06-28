//
//  MainCoordinator.swift
//  DeliveryDemo
//
//  Created by Марк Пушкарь on 28.06.2023.
//

import Foundation

import UIKit

class MainCoordinator: Coordinator {
    
    var coordinators: [Coordinator] = []
    let tabBarController: TabBarViewController
    private let factory = ControllerFactoryImpl()
    
    init() {
        tabBarController = TabBarViewController()
        let first = firstScreen()
      
        tabBarController.viewControllers = [first.navigation ]
        first.start()
        
    }
    
    private func firstScreen() -> FirstScreenCoordinator {
        
        let navigation = UINavigationController()
        let coordinator = FirstScreenCoordinator(navigation: navigation, factory: factory)
          
        
        return coordinator
    }
    
   
}
