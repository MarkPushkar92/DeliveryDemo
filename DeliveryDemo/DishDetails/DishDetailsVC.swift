//
//  DishDetailsVC.swift
//  DeliveryDemo
//
//  Created by Марк Пушкарь on 29.06.2023.
//

import UIKit

class DishDetailsVC: UIViewController {
    
    weak var coordinator: FirstScreenCoordinator?
    
    private let viewModel: FirtsScreenViewModel
    
    private let dish: DishModel
    
    private let dishView = DishDetailsView()
    
        
    //MARK: Init and LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        dishView.dish = dish
        dishView.dismissButton.addTarget(self, action: #selector(dismissDetailsVC), for: .touchUpInside)
        dishView.addToCartButton.addTarget(self, action: #selector(addToCart), for: .touchUpInside)
       
    }
        
    init(viewModel: FirtsScreenViewModel, dish: DishModel) {
        self.viewModel = viewModel
        self.dish = dish
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func dismissDetailsVC() {
        self.dismiss(animated: true)
    }
    
    @objc private func addToCart() {
        sendToCart(dish: dish)
        dismissDetailsVC()
    }
    
    private func sendToCart(dish: DishModel) {
        viewModel.sendToCart(dish: dish)
    }
    
}

private extension DishDetailsVC {
    
     func setupViews() {
         view.addSubview(dishView)
         view.backgroundColor = .clear
         let constrains = [

            dishView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dishView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            dishView.heightAnchor.constraint(equalToConstant: 446),
            dishView.widthAnchor.constraint(equalToConstant: 343)
         ]
         NSLayoutConstraint.activate(constrains)
    }
    
   
}
