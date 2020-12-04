//
//  WeatherCell.swift
//  GoodWeather
//
//  Created by Marcus Vinicius Vieira Badiale on 03/12/20.
//

import Foundation
import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    func setCell(cityName: String, temperature: Double) {
        
        self.cityNameLabel.text = cityName
        self.temperatureLabel.text = temperature.formatAsDegree
    }
}
