//
//  TagCell.swift
//  DeliveryDemo
//
//  Created by Марк Пушкарь on 29.06.2023.
//

import UIKit

class TagCell: UICollectionViewCell {
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                self.backgroundColor = UIColor(red: 0.2, green: 0.39, blue: 0.88, alpha: 1)
                label.textColor = .white
            } else {
                self.backgroundColor = UIColor(red: 0.97, green: 0.97, blue: 0.96, alpha: 1)
                label.textColor = .black

            }
        }
    }
    
    var tagLabelText: String? {
        willSet {
            label.text = newValue
        }
    }
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textAlignment = .center
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
       
        self.backgroundColor = UIColor(red: 0.97, green: 0.97, blue: 0.96, alpha: 1)
        contentView.addSubviews(label)
        self.layer.cornerRadius = 10

        let constrains = [
            
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor),
         
        ]
        NSLayoutConstraint.activate(constrains)
    }
}

