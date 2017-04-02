//
//  Constants.swift
//  GetWeather
//
//  Created by John Murphy on 3/30/17.
//  Copyright © 2017 John Murphy. All rights reserved.
//


import Foundation
import UIKit

let BG_Color = "51A4FF"


let API_Key = "6f5397581175f1da3751fe8dd105e47c"
let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?"
let FORECAST_COUNT = "&cnt=10"
let ICON_URL_HEAD = "http://openweathermap.org/img/w/"
let ICON_URL_TAIL = ".png"



/*
"http://samples.openweathermap.org/data/2.5/forecast/daily?lat=35&lon=139&cnt=10&appid=b1b15e88fa797225412429c1c50c122a1"
*/

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)\(Location.sharedInstance.latitude!)\(LONGITUDE)\(Location.sharedInstance.longitude!)\(APP_ID)\(API_Key)"

let WEATHER_FORECAST_URL = "\(FORECAST_URL)\(LATITUDE)\(Location.sharedInstance.latitude!)\(LONGITUDE)\(Location.sharedInstance.longitude!)\(FORECAST_COUNT)\(APP_ID)\(API_Key)"



let ICON_URL = "\(ICON_URL_HEAD)\(Icon.sharedInstance.icon!)\(ICON_URL_TAIL)"

typealias DownloadComplete = () -> ()

