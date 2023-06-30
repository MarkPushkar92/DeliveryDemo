//
//  DishDetailsView.swift
//  DeliveryDemo
//
//  Created by Марк Пушкарь on 29.06.2023.
//

import UIKit

class DishDetailsView: UIView {
    
    var dish: DishModel? {
        willSet {
            title.text = newValue?.name
            desc.text = newValue?.description
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
    
    private let image: UIImageView = {
        let image = UIImageView()
        image.toAutoLayout()
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 10
        image.layer.masksToBounds = true
        image.backgroundColor = UIColor(red: 0.97, green: 0.97, blue: 0.96, alpha: 1)
        return image
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
    
    private let desc: UITextView = {
        let view = UITextView()
        view.toAutoLayout()
        view.isEditable = false
        view.isSelectable = false
        view.font = .systemFont(ofSize: 14, weight: .regular)
        view.textColor = .black
        return view
    }()
    
    let addToCartButton: UIButton = {
        let button = UIButton()
        button.setTitle("Добавить в корзину", for: .normal)
        button.layer.cornerRadius = 15
        button.backgroundColor = UIColor(red: 0.2, green: 0.39, blue: 0.88, alpha: 1)
        button.toAutoLayout()
        return button
    }()
    
    private let addToFaves: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "heart"), for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = .white
        button.toAutoLayout()
        return button
    }()
    
    let dismissButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "cross"), for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = .white
        button.toAutoLayout()
        return button
    }()
    
    private func setupViews() {
        self.layer.cornerRadius = 15
        self.toAutoLayout()
        self.backgroundColor = .white
        self.addSubviews(image, title, price, weight, desc, addToCartButton, addToFaves, dismissButton )
        let constraints = [
            
            image.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            image.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            image.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            image.heightAnchor.constraint(equalToConstant: 232),
            
            dismissButton.heightAnchor.constraint(equalToConstant: 40),
            dismissButton.widthAnchor.constraint(equalToConstant: 40),
            dismissButton.topAnchor.constraint(equalTo: image.topAnchor, constant: 8),
            dismissButton.trailingAnchor.constraint(equalTo: image.trailingAnchor, constant: -8),
            
            addToFaves.heightAnchor.constraint(equalToConstant: 40),
            addToFaves.widthAnchor.constraint(equalToConstant: 40),
            addToFaves.topAnchor.constraint(equalTo: image.topAnchor, constant: 8),
            addToFaves.trailingAnchor.constraint(equalTo: dismissButton.leadingAnchor, constant: -8),
            
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            title.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 8),
            title.heightAnchor.constraint(equalToConstant: 17),
            
            price.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            price.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 8),
            price.heightAnchor.constraint(equalToConstant: 17),
            
            weight.leadingAnchor.constraint(equalTo: price.trailingAnchor, constant: 0),
            weight.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 8),
            weight.heightAnchor.constraint(equalToConstant: 17),
            
            desc.topAnchor.constraint(equalTo: weight.bottomAnchor, constant: 8),
            desc.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            desc.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            desc.heightAnchor.constraint(equalToConstant: 62),
            
            addToCartButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            addToCartButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            addToCartButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            addToCartButton.heightAnchor.constraint(equalToConstant: 48),
            
        ]
        NSLayoutConstraint.activate(constraints)
        
      

    }

    init() {
        super.init(frame: .zero)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



