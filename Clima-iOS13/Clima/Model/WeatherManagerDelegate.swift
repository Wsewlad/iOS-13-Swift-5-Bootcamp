//
//  WeatherManagerDelegate.swift
//  Clima
//
//  Created by  Vladyslav Fil on 24.06.2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}
