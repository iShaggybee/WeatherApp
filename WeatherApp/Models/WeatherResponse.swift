//
//  WeatherResponse.swift
//  WeatherApp
//
//  Created by Kislov Vadim on 15.06.2022.
//

import Foundation

struct WeatherResponse: Decodable {
    let now: Int?
    let fact: Weather?
}

struct Weather: Decodable {
    let temp: Int?
    let feelsLike: Int?
    let condition: String?
    let windSpeed: Double?
    let windDir: String?
    let pressureMm: Int?
    let humidity: Int?
    let season: String?
    
    func getExtendedWeather(weatherCondition: WeatherCondition) -> String {
        var info = ""
        
        if let feelsLike = feelsLike {
            info += "Ощущается как \(feelsLike)°C"
        }
        
        if let condition = condition {
            let description = weatherCondition.getWeather(condition: condition)
            
            info += ". \(description)"
        }
    
        return info
    }
}
