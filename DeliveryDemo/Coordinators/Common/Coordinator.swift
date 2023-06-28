//
//  Coordinator.swift
//  DeliveryDemo
//
//  Created by Марк Пушкарь on 28.06.2023.
//

import Foundation

import Foundation

protocol Coordinator: AnyObject {
    var coordinators: [Coordinator] { get set }
}
