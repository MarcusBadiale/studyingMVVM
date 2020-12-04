//
//  GoodWeatherViewController.swift
//  GoodWeather
//
//  Created by Marcus Vinicius Vieira Badiale on 03/12/20.
//

import Foundation
import UIKit

class GoodWeatherViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension GoodWeatherViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as! WeatherCell
        
        cell.setCell(cityName: "Denver", temperature: "50°")
        
        return cell
    }
}

extension GoodWeatherViewController: AddWeatherDelegate {
    
    func addWeatherDidSave(viewModel: WeatherViewModel) {
        <#code#>
    }
}
