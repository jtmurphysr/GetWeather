//
//  Location.swift
//  GetWeather
//
//  Created by John Murphy on 3/31/17.
//  Copyright © 2017 John Murphy. All rights reserved.
//

import Foundation
import CoreLocation

class Location {
    
    static var sharedInstance = Location()
    private init() { }

    var latitude: Double!
    var longitude: Double!
    
}
