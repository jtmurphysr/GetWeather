//
//  Tools.swift
//  GetWeather
//
//  Created by John Murphy on 3/31/17.
//  Copyright © 2017 John Murphy. All rights reserved.
//

import Foundation
import UIKit

class Tools {
    
    class func getFarenheitFromKelvin(kelvin: Double) -> Double {
        
        let kelvinToFarenheitPreDivision = (kelvin * (9/5) - 459.67)
        
        let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDivision/10))
        
        return kelvinToFarenheit
    }
    
    class func getWeatherIcon(iconURL: String) {
        
    }
}



