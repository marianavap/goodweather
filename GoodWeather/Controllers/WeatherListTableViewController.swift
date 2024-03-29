//
//  WeatherListTableViewController.swift
//  GoodWeather
//
//  Created by Smiles on 10/06/19.
//  Copyright © 2019 Mariana. All rights reserved.
//

import Foundation
import UIKit

class WeatherListTableViewController: UITableViewController, AddWeatherDelegate {
    
    private var weatherListViewModel = WeatherListViewModel()
    private var dataSource: TableViewDataSource<WeatherCell, WeatherViewModel>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.dataSource = TableViewDataSource(cellIdentifier: "WeatherCell", items: self.weatherListViewModel.weatherViewModels) { cell, vm in
            
            cell.cityNameLabel.text = vm.name.value
            cell.temperatureLabel.text = vm.currentTemperature.temperature.value.formatAsDegree
        }
        
        self.tableView.dataSource = self.dataSource
    }
    
    func addWeatherDidSave(vm: WeatherViewModel) {
        self.weatherListViewModel.addWeatherViewModel(vm)
        self.dataSource.updateItems(self.weatherListViewModel.weatherViewModels)
        self.tableView.reloadData()
    }
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.weatherListViewModel.numberOfRows(section)
//    }
//
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddWeatherCityViewController" {
            prepareSegueForAddWeatherCityViewController(segue: segue)
        } else if segue.identifier == "SettingsTableViewController" {
            prepareSegueForSettingsTableViewController(segue: segue)
        } else if segue.identifier == "WeatherDetailsViewController" {
            prepareSegueForWeatherDetailViewController(segue: segue)
        }
    }
    
    func prepareSegueForWeatherDetailViewController (segue: UIStoryboardSegue) {
        
        guard let weatherDetailsVC = segue.destination as? WeatherDetailsViewController,
            let indexPath = self.tableView.indexPathForSelectedRow else {
                return
        }
        
        let weatherVM = self.weatherListViewModel.modelAt(indexPath.row)
        weatherDetailsVC.weatherViewModel = weatherVM
        
    }
    
    private func prepareSegueForAddWeatherCityViewController (segue: UIStoryboardSegue) {
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("NavigationController not found")
        }
        
        guard let addWeatherCityVC = nav.viewControllers.first as? AddWeatherCityViewController else {
            fatalError("AddWeatherViewController not found")
        }
        
        addWeatherCityVC.delegate = self
    }
    
    private func prepareSegueForSettingsTableViewController (segue: UIStoryboardSegue) {
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("NavigationController not found")
        }
        
        guard let settingVC = nav.viewControllers.first as? SettingTableViewController else {
            fatalError("SettingTableViewController not found")
        }
        
        settingVC.delegate = self
    }
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
//        
//        let weatherVM = self.weatherListViewModel.modelAt(indexPath.row)
//        
//        cell.configure(weatherVM)
//        
//        return cell
//    }
}

extension WeatherListTableViewController: SettingsDelegate {
    
    func settingsDone(vm: SettingViewModel) {
        self.weatherListViewModel.updateUnit(to: vm.selectedUnit)
        self.tableView.reloadData()
    }
    
}
