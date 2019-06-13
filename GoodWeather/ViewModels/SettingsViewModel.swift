//
//  SettingsViewModel.swift
//  GoodWeather
//
//  Created by Smiles on 13/06/19.
//  Copyright © 2019 Mariana. All rights reserved.
//

import Foundation

enum Unit: String, CaseIterable {
    case celsius = "metric"
    case fahrenheit = "imperial"
}

extension Unit {
    var displayName: String {
        get {
            switch(self) {
            case .celsius:
                return "Celsius"
            case .fahrenheit:
                return "Fahrenheit"
            }
        }
    }
}

struct SettingViewModel {
    let units = Unit.allCases
}
