//
//  WebService.swift
//  CoffeOrdering
//
//  Created by Marcus Vinicius Vieira Badiale on 01/12/20.
//

import Foundation

enum NetworkError: Error {
    case decodingeRROR
    case domainError
    case urlError
}

struct Resource<T: Codable> {
    let url: URL
}

class WebService {
    
    func load<T>(resource: Resource<T>, completion: @escaping (Result<T, NetworkError>) -> Void) {
        
    
        
    }
}
