//
//  SelectCategoryCell.swift
//  DeliveryDemo
//
//  Created by Марк Пушкарь on 28.06.2023.
//

import Foundation

import UIKit

class SelectCategoryCell: UICollectionViewCell {
    
    var model: CategoryModel? {
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
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .medium)
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
       
        contentView.addSubviews(image)
        image.addSubviews(label)
        self.layer.cornerRadius = 10

        let constrains = [
            
            image.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            image.topAnchor.constraint(equalTo: self.topAnchor),
            image.bottomAnchor.constraint(equalTo: self.bottomAnchor),
           
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            label.widthAnchor.constraint(equalToConstant: 190),
            label.heightAnchor.constraint(equalToConstant: 50)
            
        ]
        NSLayoutConstraint.activate(constrains)
    }
}

