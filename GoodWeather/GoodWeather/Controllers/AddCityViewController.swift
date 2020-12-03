//
//  AddCityViewController.swift
//  GoodWeather
//
//  Created by Marcus Vinicius Vieira Badiale on 03/12/20.
//

import Foundation
import UIKit

class AddCityViewController: UIViewController {
    
    
    @IBOutlet weak var cityNameTextField: UITextField!
    
    
    
    @IBAction func saveCityAction(_ sender: Any) {
    }
    
    @IBAction func closeAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
