//
//  WeatherListViewModel.swift
//  GoodWeather
//
//  Created by Marcus Vinicius Vieira Badiale on 04/12/20.
//

import Foundation

struct WeatherListViewModel {
    
    private var weatherViewModels = [WeatherViewModel]()
    
    mutating func addWeather(_ vm: WeatherViewModel) {
        self.weatherViewModels.append(vm)
    }
    
    func getNumberOfRows() -> Int {
        return self.weatherViewModels.count
    }
    
    func getWeather(at index: Int) -> WeatherViewModel {
        return self.weatherViewModels[index]
    }
}

/// Weather Cell
struct WeatherViewModel: Decodable {
    
    let currentTemperature: TemperatureViewModel
    let name: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case currentTemperature = "main"
    }
}

struct TemperatureViewModel: Decodable {
    
    let temperature: Double
    let temperatureMin: Double
    let temperatureMax: Double
    
    private enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case temperatureMin = "temp_min"
        case temperatureMax = "temp_max"
    }
}
