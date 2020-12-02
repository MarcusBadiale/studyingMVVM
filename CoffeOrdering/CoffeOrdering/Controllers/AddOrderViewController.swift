//
//  AddOrderViewController.swift
//  CoffeOrdering
//
//  Created by Marcus Vinicius Vieira Badiale on 01/12/20.
//

import Foundation
import UIKit

protocol AddOrderDelegate {
    func addCoffeeOrderDidSave(order: Order, controller: UIViewController)
    func addCoffeOrderViewControllerDidClose(controller: UIViewController)
}

class AddOrderViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var coffeeSizesSegmentedControl: UISegmentedControl!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    //MARK: - Variables
    private var viewModel = AddOrderViewModel()
    var delegate: AddOrderDelegate?
    
    //MARK: - DidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupOutlets()
    }
    
    //MARK: - Actions
    @IBAction func closeView(_ sender: Any) {
        delegate?.addCoffeOrderViewControllerDidClose(controller: self)
    }
    
    @IBAction func SaveOrder(_ sender: Any) {
        
        let name = self.nameTextField.text
        let email = self.emailTextField.text
        
        let selectedCoffeeSize = self.coffeeSizesSegmentedControl.titleForSegment(at: self.coffeeSizesSegmentedControl.selectedSegmentIndex)
        
        guard let indexPath = self.tableView.indexPathForSelectedRow else {
            fatalError("Error in selecting coffee!")
        }
        
        self.viewModel.name = name
        self.viewModel.email = email
        
        self.viewModel.selectedSize = selectedCoffeeSize
        self.viewModel.selectedType = viewModel.types[indexPath.row]
        
        WebService().load(resource: Order.create(vm: self.viewModel)) { result in
            switch result {
                case .success(let order):
                    
                    if let order = order, let delegate = self.delegate {
                        DispatchQueue.main.async {
                            self.dismiss(animated: true, completion: nil)
                            delegate.addCoffeeOrderDidSave(order: order, controller: self)
                        }
                    }
                    
                case .failure(let error):
                    print(error)
            }
        }
    }
    
    //MARK: - Auxiliares functions
    
    private func setupOutlets() {
        //TableView
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        //SegmentedControl
        setupSegmentedControl()
    }
    
    private func setupSegmentedControl() {
        
        for index in 0..<viewModel.sizes.count {
            self.coffeeSizesSegmentedControl.setTitle(viewModel.sizes[index], forSegmentAt: index)
        }
    }
}

//MARK: - TableView delegate and datasource

extension AddOrderViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.types.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "CoffeeTypeTableViewCell", for: indexPath)
        
        cell.selectionStyle = .none
        cell.textLabel?.text = self.viewModel.types[indexPath.row]
        
        return cell
    }
}
