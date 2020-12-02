//
//  Order.swift
//  CoffeOrdering
//
//  Created by Marcus Vinicius Vieira Badiale on 01/12/20.
//

import Foundation

enum CoffeeType: String, Codable {
    case cappuccino
    case lattee
    case espressino
    case cortado
    case mocaccino
}

enum CoffeeSize: String, Codable {
    case small
    case medium
    case large
}

struct Order: Codable {
    
    let name: String
    let email: String
    let type: CoffeeType
    let size: CoffeeSize
}
