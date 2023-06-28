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
    
    
    
    //MARK: Init and LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
      
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

         view.backgroundColor = .red
         
//         let constrains = [
//          
//         ]
//         NSLayoutConstraint.activate(constrains)
    }
}
