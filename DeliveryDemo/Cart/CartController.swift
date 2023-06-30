//
//  CartController.swift
//  DeliveryDemo
//
//  Created by Марк Пушкарь on 30.06.2023.
//

import UIKit

class CartController: UIViewController {
    
    weak var coordinator: CartCoordinator?
    
    private let viewModel: CartViewModel
            
    static var cart = [(DishModel, Int)]()
    
//    private lazy var total: String = {
//        var totalPrice = 0
//        CartController.cart.forEach { dish in
//            if let price = dish.0.price {
//                totalPrice += price * dish.1
//            }
//        }
//        let totalPriceStr = String(totalPrice)
//        return totalPriceStr
//    }()
    
    private lazy var total: () -> String = {
        var totalPrice = 0
        CartController.cart.forEach { dish in
            if let price = dish.0.price {
                totalPrice += price * dish.1
            }
        }
        let totalPriceStr = String(totalPrice)
        return totalPriceStr
    }
        
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = .white
        tableView.toAutoLayout()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CartCell.self, forCellReuseIdentifier: cellID)
        return tableView
    }()
    
    private let cellID = "cellID"
    
    private let buyButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 15
        button.backgroundColor = UIColor(red: 0.2, green: 0.39, blue: 0.88, alpha: 1)
        button.toAutoLayout()
        return button
    }()
    
    //MARK: Funcs
    
    private func remove(dish: DishModel) {
        viewModel.remove(dish: dish)
        setTotalPrice()
        tableView.reloadData()
    }
    
    private func add(dish: DishModel) {
        viewModel.add(dish: dish)
        setTotalPrice()
        tableView.reloadData()
    }
    
    private func setTotalPrice() {
        let buttonTitle = "Оплатить \(total()) ₽"
        buyButton.setTitle(buttonTitle, for: .normal)

    }
    



    //MARK: Init and LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setTotalPrice()
        tableView.reloadData()
    }
        
    init(viewModel: CartViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

private extension CartController {
    
     func setupViews() {
         setupNavigation()
         view.backgroundColor = .white
         tableView.separatorStyle = .none
         view.addSubviews(tableView, buyButton)
         let constrains = [
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: buyButton.topAnchor),
            
            buyButton.heightAnchor.constraint(equalToConstant: 48),
            buyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            buyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            buyButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
         ]
         NSLayoutConstraint.activate(constrains)
    }
    
   
}

//MARK: EXTENSIONS

extension CartController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CartController.cart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! CartCell
        cell.dish = CartController.cart[indexPath.row].0
        let quantity = String(CartController.cart[indexPath.row].1)
        cell.quantityLabel.text = quantity
        cell.addDishClosure = { dish in
            self.add(dish: dish)
        }
        cell.removeDishClosure = { dish in
            self.remove(dish: dish)
        }
        return cell
        
    }
}

extension CartController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 75
    }
    
    
}

