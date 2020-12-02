//
//  Order.swift
//  CoffeOrdering
//
//  Created by Marcus Vinicius Vieira Badiale on 01/12/20.
//

import Foundation

enum CoffeeType: String, Codable, CaseIterable {
    case cappuccino
    case latte
    case espressino
    case cortado
}

enum CoffeeSize: String, Codable, CaseIterable {
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

extension Order {
    
    static var all: Resource<[Order]> = {
        guard let url = URL(string: "http://guarded-retreat-82533.herokuapp.com/orders") else {
            fatalError("URL was incorrect")
        }
        
        return Resource<[Order]>(url: url)
    }()
    
    static func create(vm: AddOrderViewModel) -> Resource<Order?> {
        let order = Order(vm)
        
        guard let url = URL(string: "http://guarded-retreat-82533.herokuapp.com/orders") else {
            fatalError("URL was incorrect")
        }
        
        guard let data = try? JSONEncoder().encode(order) else {
            fatalError("Error encoding order")
        }
        
        var resource = Resource<Order?>(url: url)
        resource.httpMethod = .post
        resource.body = data
        
        return resource
    }
}

extension Order {
    
    init?(_ viewModel: AddOrderViewModel) {
        
        guard let name = viewModel.name,
              let email = viewModel.email,
              let type = CoffeeType(rawValue: viewModel.selectedType!.lowercased()),
              let size = CoffeeSize(rawValue: viewModel.selectedSize!.lowercased())
        else {
            return nil
        }
        
        self.name = name
        self.email = email
        self.type = type
        self.size = size
    }
}
