//
//  MenuCell.swift
//  DeliveryDemo
//
//  Created by Марк Пушкарь on 29.06.2023.
//

import UIKit

class MenuCell: UICollectionViewCell {
    
    var model: DishModel? {
        willSet {
            if let text = newValue?.name {
                label.text = text
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
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        label.toAutoLayout()
        label.layer.masksToBounds = true
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
       
        contentView.addSubviews(image, label)

        let constrains = [
            
            image.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            image.topAnchor.constraint(equalTo: self.topAnchor),
            image.heightAnchor.constraint(equalToConstant: 119),
           
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            label.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 2),
            label.widthAnchor.constraint(equalToConstant: 119),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
        ]
        NSLayoutConstraint.activate(constrains)
    }
}

