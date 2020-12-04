//
//  AddCityViewController.swift
//  GoodWeather
//
//  Created by Marcus Vinicius Vieira Badiale on 03/12/20.
//

import Foundation
import UIKit

protocol AddWeatherDelegate {
    func addWeatherDidSave(viewModel: WeatherViewModel)
}

class AddCityViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var cityNameTextField: UITextField!
    
    //MARK: - Variables
    var delegate: AddWeatherDelegate?
    
    //MARK: - Actions
    @IBAction func saveCityAction(_ sender: Any) {
        
        if let city = cityNameTextField.text {
            
            let weatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(Constants.myApiKey)&units=imperial")!
            
            let weatherResource = Resource<WeatherViewModel>(url: weatherURL) { data in
                
                let weatherVM = try? JSONDecoder().decode(WeatherViewModel.self, from: data)
                
                return weatherVM
            }
            
            WebService().load(resource: weatherResource) { [weak self] result in
                
                switch result {
                    case .success(let weather):
                        if let weather = weather {
                            if let delegate = self?.delegate {
                                delegate.addWeatherDidSave(viewModel: weather)
                                self?.dismiss(animated: true, completion: nil)
                            }
                        }
                    case .failure(let error):
                        print(error)
                }
            }
            
        }
    }
    
    @IBAction func closeAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: - View did load
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
