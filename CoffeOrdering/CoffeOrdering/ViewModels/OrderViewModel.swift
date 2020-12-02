//
//  OrderViewModel.swift
//  CoffeOrdering
//
//  Created by Marcus Vinicius Vieira Badiale on 02/12/20.
//

import Foundation

//MARK: - OrderListViewModel

class OrderListViewModel {
    
    var orders: [OrderViewModel]
    
    init() {
        self.orders = [OrderViewModel]()
    }
}

extension OrderListViewModel {
    
    func orderViewModel(at index: Int) -> OrderViewModel {
        return self.orders[index]
    }
}

//MARK: - OrderViewModel

struct OrderViewModel {
    
    let order: Order
}

extension OrderViewModel {
    
    var name: String {
        return self.order.name
    }
    
    var email: String {
        return self.order.email
    }
    
    var type: String {
        return self.order.type.rawValue.capitalized
    }
    
    var size: String {
        return self.order.size.rawValue.capitalized
    }
}
