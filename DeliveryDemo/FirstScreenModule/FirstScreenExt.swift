//
//  FirstScreenExt.swift
//  DeliveryDemo
//
//  Created by Марк Пушкарь on 28.06.2023.
//


import UIKit

extension ViewController {
    
    func setupNavigation() {
        
        let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            imageView.image = UIImage(named: "userImage")
            imageView.layer.cornerRadius = 44/2
            imageView.layer.masksToBounds = true
            imageView.toAutoLayout()
            return imageView
        }()
        
        let locationImg: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "location")
            imageView.toAutoLayout()
            return imageView
        }()
        
        let locationLabel: UILabel = {
            let view = UILabel()
            view.textColor = .label
            view.font = .systemFont(ofSize: 18, weight: .medium)
            view.textAlignment = .left
            view.text = "Санкт-Петербург"
            view.toAutoLayout()
            return view
        }()
        
        let dateLabel: UILabel = {
            let view = UILabel()
            view.textColor = .gray
            view.font = .systemFont(ofSize: 14, weight: .regular)
            view.textAlignment = .left
            view.text = Date().getFormattedDate()
            view.toAutoLayout()
            return view
        }()
        
        
        let leftView: UIView = {
            let view = UIView()
            view.toAutoLayout()
            return view
        }()
        
        leftView.addSubviews(locationLabel, locationImg, dateLabel)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: imageView)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftView)
        let constrains = [

            imageView.widthAnchor.constraint(equalToConstant: 44),
            imageView.heightAnchor.constraint(equalToConstant: 44),
            
            leftView.widthAnchor.constraint(equalToConstant: 220),
            
            

            
            locationImg.widthAnchor.constraint(equalToConstant: 24),
            locationImg.heightAnchor.constraint(equalToConstant: 24),
            locationImg.topAnchor.constraint(equalTo: locationLabel.topAnchor),
            locationImg.leadingAnchor.constraint(equalTo: leftView.leadingAnchor),
            
            locationLabel.widthAnchor.constraint(equalToConstant: 200),
            locationLabel.heightAnchor.constraint(equalToConstant: 22),
            locationLabel.bottomAnchor.constraint(equalTo: leftView.centerYAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: locationImg.trailingAnchor, constant: 4),
            
            dateLabel.widthAnchor.constraint(equalToConstant: 106),
            dateLabel.heightAnchor.constraint(equalToConstant: 16),
            dateLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: locationLabel.leadingAnchor),
            
            
     
        ]
        NSLayoutConstraint.activate(constrains)
    }
}
