//
//  WeatherCell.swift
//  GoodWeather
//
//  Created by Smiles on 11/06/19.
//  Copyright © 2019 Mariana. All rights reserved.
//

import Foundation
import UIKit


class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    func configure(_ vm: WeatherViewModel) {
        self.cityNameLabel.text = vm.name.value
        self.temperatureLabel.text = "\(vm.currentTemperature.temperature.value.formatAsDegree)"
    }
    
}
