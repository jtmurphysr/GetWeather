//
//  Forecast.swift
//  GetWeather
//
//  Created by John Murphy on 3/30/17.
//  Copyright © 2017 John Murphy. All rights reserved.
//

import UIKit
import Alamofire

class Forecast {
    
    var forecasts = [Forecast]()
    
    var _date: String!
    var _weatherType: String!
    var _highTemp: String!
    var _lowTemp: String!
    var _doubleDate: Double!
    
    
    var date:String {
        if _date == nil {
            _date = ""
        }
        return _date
    }
    
    var weatherType:String{
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var highTemp:String {
        if _highTemp == nil {
            _highTemp = ""
        }
        return _highTemp
    }
    
    var lowTemp:String {
        if _lowTemp == nil {
            _lowTemp = ""
        }
        return _lowTemp
    }
    
    var doubleDate:Double {
        if _doubleDate == nil {
            _doubleDate = 0.0
        }
        return _doubleDate
    }
    
    init(weatherDict: Dictionary<String, AnyObject>) {
        
        if let temp = weatherDict["temp"] as? Dictionary<String, AnyObject> {
            
            if let min = temp["min"] as? Double {
                
//                let kelvinToFarenheitPreDivision = (min * (9/5) - 459.67)
//                
//                let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDivision/10))
                
                self._lowTemp = String(Tools.getFarenheitFromKelvin(kelvin: min))
            }
            
            if let max = temp["max"] as? Double {
                
//                let kelvinToFarenheitPreDivision = (max * (9/5) - 459.67)
//                
//                let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDivision/10))
                
                self._highTemp = String(Tools.getFarenheitFromKelvin(kelvin: max))
                
            }
            
        }
        
        if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>] {
            
            if let main = weather[0]["main"] as? String {
                self._weatherType = main
            }
        }
        
        if let date = weatherDict["dt"] as? Double {
            
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            self._date = unixConvertedDate.dayOfTheWeek()
            self._doubleDate = date
        }
        
    }
    
    
    func downloadForecastData(completed: @escaping DownloadComplete){
        
        Alamofire.request(WEATHER_FORECAST_URL).responseJSON{response in
            let result = response.result
            print(result)
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
                    
                    for obj in list {
                        let forecast = Forecast(weatherDict: obj)
                        print(obj)
                        self.forecasts.append(forecast)
                        
                    }
                }
                
            }
            completed()
    }
    
    }
}


extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
