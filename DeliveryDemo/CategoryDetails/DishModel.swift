//
//  DishModel.swift
//  DeliveryDemo
//
//  Created by Марк Пушкарь on 28.06.2023.
//

import Foundation

struct DishModel: Hashable {
    let id: Int?
    let name: String?
    let price, weight: Int?
    let description: String?
    let imageURL: String?
    let tegs: [Teg]?

}
