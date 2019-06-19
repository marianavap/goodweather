//
//  WeatherDetailsViewController.swift
//  GoodWeather
//
//  Created by Smiles on 18/06/19.
//  Copyright © 2019 Mariana. All rights reserved.
//

import Foundation
import UIKit

class WeatherDetailsViewController: UIViewController {
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    
    var weatherViewModel : WeatherViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupVMBindings()
        
        //Old way
//        if let weatherVM = self.weatherViewModel {
//            self.cityNameLabel.text = weatherVM.name.value
//            self.currentTemperatureLabel.text =
//                weatherVM.currentTemperature.temperature.value.formatAsDegree
//        }
    
    }
    
    private func setupVMBindings () {
        
        if let weatherVM = self.weatherViewModel {
            weatherVM.name.bind { self.cityNameLabel.text = $0 }
            weatherVM.currentTemperature.temperature.bind { self.currentTemperatureLabel.text = $0.formatAsDegree }
            weatherVM.currentTemperature.temperatureMax.bind { self.maxTempLabel.text = $0.formatAsDegree }
            weatherVM.currentTemperature.temperatureMin.bind { self.minTempLabel.text = $0.formatAsDegree }
        }
        
        //change the value after few seconds
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.weatherViewModel?.name.value = "Boston"
        }
        
    }
}
