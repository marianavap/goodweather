//
//  Double+Extensions.swift
//  GoodWeather
//
//  Created by Smiles on 13/06/19.
//  Copyright © 2019 Mariana. All rights reserved.
//

import Foundation

extension Double {
    var formatAsDegree: String {
        return String(format: "%.0f°", self)
    }
}
