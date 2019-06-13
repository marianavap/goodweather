//
//  Webservice.swift
//  GoodWeather
//
//  Created by Smiles on 12/06/19.
//  Copyright © 2019 Mariana. All rights reserved.
//

import Foundation

struct Resource <T> {
    let url: URL
    let parse: (Data) -> T?
}

final class Webservice {
    
    func load<T>(resource: Resource <T>, completion: @escaping (T?) -> ()) {
        
        URLSession.shared.dataTask(with: resource.url) { data, response, error  in
                        
            if let data = data {
                DispatchQueue.main.async {
                    completion(resource.parse(data))
                }
            } else {
                completion(nil)
            }
            
            
        }.resume()
    }
}
