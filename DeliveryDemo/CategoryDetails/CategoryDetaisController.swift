//
//  CategoryDetaisController.swift
//  DeliveryDemo
//
//  Created by Марк Пушкарь on 28.06.2023.
//


import UIKit


class CategoryDetaisController: UIViewController {
    
    weak var coordinator: FirstScreenCoordinator?
    
    private let viewModel: FirtsScreenViewModel
    
    private let titleName: String
    
    private let categoryDetailsView = CategoryDetailsView()
    
    //MARK: Init and LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        print(titleName)
        viewModel.getCategoryDetails {
            print(self.viewModel.categoryDetails.count)
            self.categoryDetailsView.menuView.menu = self.viewModel.categoryDetails
        }
    }
        
    init(viewModel: FirtsScreenViewModel, titleName: String) {
        self.viewModel = viewModel
        self.titleName = titleName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension CategoryDetaisController {
    
     func setupViews() {
         view.addSubview(categoryDetailsView)
         setNavigationItems()
         view.backgroundColor = .white
         let constrains = [
            categoryDetailsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            categoryDetailsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            categoryDetailsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            categoryDetailsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
         ]
         NSLayoutConstraint.activate(constrains)
    }
    
    func setNavigationItems() {
        let imageView = CommonNavigationItems.imageView
        navigationItem.title = titleName
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: imageView)
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .black
  
    }
}
