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
        let search = configureSearch()
        let cart = configureCart()
        let account = configureAccount()
      
        tabBarController.viewControllers = [first.navigation, search, cart, account ]
        first.start()
        
    }
    
    private func firstScreen() -> FirstScreenCoordinator {
        
        let navigation = UINavigationController()
        let coordinator = FirstScreenCoordinator(navigation: navigation, factory: factory)
        let image = UIImage.init(named: "main")
        navigation.tabBarItem = UITabBarItem(title: "Главная", image: image, tag: 0)
        return coordinator
    }
    
    private func configureSearch()  -> UINavigationController {
        let navigation = UINavigationController()
        let image = UIImage.init(named: "search")
        navigation.tabBarItem = UITabBarItem(title: "Поиск", image: image, tag: 1)
        return navigation
    }
    
    private func configureCart()  -> UINavigationController {
        let navigation = UINavigationController()
        let image = UIImage.init(named: "cart")
        navigation.tabBarItem = UITabBarItem(title: "Корзина", image: image, tag: 2)
        return navigation
    }
    
    private func configureAccount()  -> UINavigationController {
        let navigation = UINavigationController()
        let image = UIImage.init(named: "account")
        navigation.tabBarItem = UITabBarItem(title: "Аккаунт", image: image, tag: 3)
        return navigation
    }
    
  
}

    
   

