//
//  SettingsViewModel.swift
//  GoodWeather
//
//  Created by Marcus Vinicius Vieira Badiale on 04/12/20.
//

import Foundation

enum Unit: String, CaseIterable {
    case celcius = "metric"
    case fahrenheit = "imperial"
    
    var degreeString: String {
        switch self {
            case .celcius:
                return "C"
            case .fahrenheit:
                return "F"
        }
    }
    
    var displayName: String {
        switch self {
            case .celcius:
                return "Celcius"
            case .fahrenheit:
                return "Fahrenheit"
        }
    }
}

struct SettingsViewModel {
    
    let unitis = Unit.allCases
}
