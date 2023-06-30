//
//  FirstScreenCoordinator.swift
//  DeliveryDemo
//
//  Created by Марк Пушкарь on 28.06.2023.
//

import UIKit

class FirstScreenCoordinator: Coordinator {
    
    var coordinators: [Coordinator] = []
    let navigation: UINavigationController
    let factory: ControllerFactory

    private lazy var firstScreen = {
        factory.makeFirstScreen()
    }()
    
    init(navigation: UINavigationController,factory: ControllerFactory) {
        self.navigation = navigation
        self.factory = factory
    }
    
    func start() {
        navigation.pushViewController(firstScreen.controller, animated: true)
        firstScreen.viewModel.onShowNext = { [self]  title in
            let vc = CategoryDetaisController(viewModel: firstScreen.viewModel, titleName: title)
            navigation.pushViewController(vc, animated: true)
        }
        firstScreen.viewModel.showDish =  { [self] dish in
            let vc = DishDetailsVC(viewModel: firstScreen.viewModel, dish: dish)
            navigation.present(vc, animated: true)
        }
    }
    
   
}
