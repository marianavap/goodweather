//
//  AddWeatherCityViewController.swift
//  GoodWeather
//
//  Created by Smiles on 10/06/19.
//  Copyright © 2019 Mariana. All rights reserved.
//

import Foundation
import UIKit

protocol AddWeatherDelegate {
    func addWeatherDidSave(vm: WeatherViewModel)
}

class AddWeatherCityViewController: UIViewController {
    
    @IBOutlet weak var cityNameTextField: UITextField!
    
    var delegate: AddWeatherDelegate?
    
    @IBAction func saveCityButtonPressed() {
        
        if let city = cityNameTextField.text {
            let weatherURL = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city)&APPID=5bf4b4147a2beb2013e625aac2be0c70&units=imperial")!
            
            let weatherResource = Resource<WeatherViewModel>(url: weatherURL) { data in
                
                let weatherVM = try? JSONDecoder().decode(WeatherViewModel.self, from: data)
                
                return weatherVM
            }
            
            Webservice().load(resource: weatherResource) { [weak self] result in
             
                if let weatherVM = result {
                    
                    if let delegate = self?.delegate {
                        delegate.addWeatherDidSave(vm: weatherVM)
                        self?.dismiss(animated: true, completion: nil)
                    }
                }
            }
        }
    }
    
    @IBAction func close () {
        self.dismiss(animated: true, completion: nil)
    }
    
}
