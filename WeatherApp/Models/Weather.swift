//
//  Weather.swift
//  WeatherApp
//
//  Created by Isha Nailwal on 16/03/25.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
}

struct Weather: Decodable {
    let temp: Double
}
