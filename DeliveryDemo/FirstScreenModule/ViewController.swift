//
//  ViewController.swift
//  DeliveryDemo
//
//  Created by Марк Пушкарь on 28.06.2023.
//

import UIKit

class ViewController: UIViewController {
    
    weak var coordinator: FirstScreenCoordinator?
    
    private let viewModel: FirtsScreenViewModel
    
    private let firstScreenView = FirstScreenView()
    
    //MARK: Init and LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        viewModel.getCategories {
            self.firstScreenView.categories = self.viewModel.categories
            self.firstScreenView.onTap = self.viewModel.onTapShowNextModule
        }
    }
        
    init(viewModel: FirtsScreenViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension ViewController {
    
     func setupViews() {
         setupNavigation()
         view.addSubview(firstScreenView)
         view.backgroundColor = .white
         let constrains = [
            firstScreenView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            firstScreenView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            firstScreenView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            firstScreenView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
         ]
         NSLayoutConstraint.activate(constrains)
    }
}
