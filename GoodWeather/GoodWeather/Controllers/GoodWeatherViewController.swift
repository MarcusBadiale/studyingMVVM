//
//  GoodWeatherViewController.swift
//  GoodWeather
//
//  Created by Marcus Vinicius Vieira Badiale on 03/12/20.
//

import Foundation
import UIKit

class GoodWeatherViewController: UITableViewController {
    
    //MARK: - Variables
    var weatherListViewModel = WeatherListViewModel()
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    //MARK: - Auxiliares Funcitons
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
            case "goToAddCity":
                prepareSegueForAddCity(segue: segue)
            case "goToSettings":
                prepareSegueForSettings(segue: segue)
            default:
                break
        }
    }

    private func prepareSegueForAddCity(segue: UIStoryboardSegue) {
        
        guard let navController = segue.destination as? UINavigationController else {
            fatalError("NavigationController not found")
        }
        
        guard let nextVc = navController.children.first as? AddCityViewController else {
            fatalError("ViewController not found")
        }
        nextVc.delegate = self
    }
    
    private func prepareSegueForSettings(segue: UIStoryboardSegue) {
        
        guard let navController = segue.destination as? UINavigationController else {
            fatalError("NavigationController not found")
        }
        
        guard let nextVc = navController.children.first as? SettingsTableViewController else {
            fatalError("ViewController not found")
        }
    }
}

extension GoodWeatherViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weatherListViewModel.getNumberOfRows()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as! WeatherCell
        
        let currentWeatherCell = weatherListViewModel.getWeather(at: indexPath.row)
        cell.setCell(cityName: currentWeatherCell.name, temperature: currentWeatherCell.currentTemperature.temperature)
        
        return cell
    }
}

//MARK: - Protocol
extension GoodWeatherViewController: AddWeatherDelegate {
    
    func addWeatherDidSave(viewModel: WeatherViewModel) {
        
        self.weatherListViewModel.addWeather(viewModel)
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
