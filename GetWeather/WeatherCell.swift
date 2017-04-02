//
//  WeatherCell.swift
//  GetWeather
//
//  Created by John Murphy on 3/31/17.
//  Copyright © 2017 John Murphy. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var highTemp: UILabel!
    @IBOutlet weak var lowTemp: UILabel!
    
    func configureCell(forecast: Forecast) {
        
 
        if ipRow.sharedInstance.value == 0 {
            //set Day Label to Today if it's the first instance, else use the forecast.date
            dayLabel.text = "Today"
            } else {
            dayLabel.text = forecast.date
            }
        
        lowTemp.text = "\(forecast.lowTemp)"
        highTemp.text = "\(forecast.highTemp)"
        weatherType.text = forecast.weatherType
        weatherIcon.image = UIImage(named: forecast.weatherType)
        
        
    }
    

}
