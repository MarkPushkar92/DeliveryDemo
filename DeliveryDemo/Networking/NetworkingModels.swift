//
//  NetworkingModels.swift
//  DeliveryDemo
//
//  Created by Марк Пушкарь on 28.06.2023.
//

import Foundation

// MARK: - Categories
struct Categories: Decodable {
    let сategories: [Сategory]?
}

// MARK: - Сategory
struct Сategory: Decodable {
    let id: Int?
    let name: String?
    let imageURL: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case imageURL = "image_url"
    }
}
