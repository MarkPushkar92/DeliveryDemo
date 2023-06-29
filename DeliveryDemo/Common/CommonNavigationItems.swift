//
//  CommonNavigationItems.swift
//  DeliveryDemo
//
//  Created by Марк Пушкарь on 29.06.2023.
//

import UIKit

class CommonNavigationItems {
        
    static let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "userImage")
        imageView.layer.cornerRadius = 44/2
        imageView.layer.masksToBounds = true
        imageView.toAutoLayout()
        return imageView
    }()
         
}
