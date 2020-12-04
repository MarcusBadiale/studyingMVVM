//
//  Double+Extensions.swift
//  GoodWeather
//
//  Created by Marcus Vinicius Vieira Badiale on 04/12/20.
//

import Foundation

extension Double {
    
    var formatAsDegree: String {
        
        return String(format: "%.0f°", self)
    }
}
