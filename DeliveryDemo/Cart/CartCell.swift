//
//  CartCell.swift
//  DeliveryDemo
//
//  Created by Марк Пушкарь on 30.06.2023.
//


import UIKit

class CartCell: UITableViewCell {
    
    var addDishClosure: ((DishModel) -> ())?
    
    var removeDishClosure: ((DishModel) -> ())?
    
    var dish: DishModel? {
        willSet {
            title.text = newValue?.name
            if let priceInt = newValue?.price {
                price.text = "\(String(describing: priceInt)) ₽ "
            }
            if let weightInt =  newValue?.weight {
                weight.text = "· \(String(describing: weightInt))г"
            }
            if let urlString = newValue?.imageURL {
                guard let url = URL(string: urlString) else { return }
                image.load(url: url)
            }
        }
    }
    
    var image: UIImageView = {
        let imageView = UIImageView()
        imageView.toAutoLayout()
        imageView.backgroundColor = UIColor(red: 0.97, green: 0.97, blue: 0.96, alpha: 1)
        imageView.layer.cornerRadius = 6
        return imageView
    }()
    
    private let title: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        label.toAutoLayout()
        return label
    }()
    
    private let price: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .left
        label.toAutoLayout()
        return label
    }()
    
    private let weight: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .left
        label.toAutoLayout()
        return label
    }()
    
    let plusButton: UIButton = {
        let button = UIButton()
        button.imageView?.tintColor = .black
        button.backgroundColor = UIColor(red: 0.94, green: 0.93, blue: 0.93, alpha: 1)
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        button.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        button.toAutoLayout()
        return button
    }()
    
    let minusButton: UIButton = {
        let button = UIButton()
        button.imageView?.tintColor = .black
        button.backgroundColor = UIColor(red: 0.94, green: 0.93, blue: 0.93, alpha: 1)
        button.setImage(UIImage(systemName: "minus"), for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        button.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        button.toAutoLayout()
        return button
    }()
    
    let quantityLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .center
        label.backgroundColor = UIColor(red: 0.94, green: 0.93, blue: 0.93, alpha: 1)
        label.toAutoLayout()
        return label
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
        minusButton.addTarget(self, action: #selector(minusButtonPressed), for: .touchUpInside)
        plusButton.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func addButtonPressed() {
        guard let closure = addDishClosure else { return }
        closure(dish!)
    }
    
    @objc private func minusButtonPressed() {
        guard let closure = removeDishClosure else { return }
        closure(dish!)
    }
    
    func setUpViews() {
        contentView.addSubviews(image, title, price, weight, minusButton, quantityLabel, plusButton)
        let constraints = [
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            image.heightAnchor.constraint(equalToConstant: 62),
            image.widthAnchor.constraint(equalToConstant: 62),
            
            title.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 12),
            title.bottomAnchor.constraint(equalTo: contentView.centerYAnchor),
            title.widthAnchor.constraint(equalToConstant: 119),
            
            price.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            price.topAnchor.constraint(equalTo: title.bottomAnchor),
            
            weight.topAnchor.constraint(equalTo: title.bottomAnchor),
            weight.leadingAnchor.constraint(equalTo: price.trailingAnchor),
            
            plusButton.heightAnchor.constraint(equalToConstant: 33),
            plusButton.widthAnchor.constraint(equalToConstant: 33),
            plusButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            plusButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            quantityLabel.heightAnchor.constraint(equalToConstant: 33),
            quantityLabel.widthAnchor.constraint(equalToConstant: 33),
            quantityLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            quantityLabel.trailingAnchor.constraint(equalTo: plusButton.leadingAnchor),
            
            minusButton.heightAnchor.constraint(equalToConstant: 33),
            minusButton.widthAnchor.constraint(equalToConstant: 33),
            minusButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            minusButton.trailingAnchor.constraint(equalTo: quantityLabel.leadingAnchor),

        ]
        NSLayoutConstraint.activate(constraints)
        
        
    }

}

