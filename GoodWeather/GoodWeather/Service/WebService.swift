//
//  WebService.swift
//  GoodWeather
//
//  Created by Marcus Vinicius Vieira Badiale on 04/12/20.
//

import Foundation

enum NetworkError: Error {
    case decodingError
    case domainError
    case urlError
}

struct Resource<T> {
    let url: URL
    let parse: (Data) -> T?
}

final class WebService {
    
    func load<T>(resource: Resource<T>, completion: @escaping (Result<T?, NetworkError>) -> ()) {
        
        URLSession.shared.dataTask(with: resource.url) { data, result, error in
            
            if let data = data {
                DispatchQueue.main.async {
                    completion(.success(resource.parse(data)))
                }
            } else {
                completion(.failure(.domainError))
            }
            
        }.resume()
    }
}
