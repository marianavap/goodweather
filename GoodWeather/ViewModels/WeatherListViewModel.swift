//
//  WeatherListViewModel.swift
//  GoodWeather
//
//  Created by Smiles on 12/06/19.
//  Copyright © 2019 Mariana. All rights reserved.
//

import Foundation

struct WeatherListViewModel {
    private var weatherViewModel = [WeatherViewModel]()
}

struct WeatherViewModel: Decodable {
    let name: String
    let currentTemperature: TemperatureViewModel
    
    private enum CodingKeys: String, CodingKey {
        case name
        case currentTemperature = "main"
    }
}

struct TemperatureViewModel: Decodable {
    let temperature: Double
    let temperatureMin: Double
    let temperatureMax: Double
    
    private enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case temperatureMin = "temp_min"
        case temperatureMax = "temp_max"
    }
}
