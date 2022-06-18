//
//  WeatherResponse.swift
//  WeatherApp
//
//  Created by Kislov Vadim on 15.06.2022.
//

import Foundation

struct WeatherResponse: Decodable {
    let time: Int?
    let weather: Weather?
    
    enum CodingKeys: String, CodingKey {
        case time = "now"
        case weather = "fact"
    }
    
    init(time: Int, weather: Weather) {
        self.time = time
        self.weather = weather
    }
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
    
    enum CodingKeys: String, CodingKey {
        case temp = "temp"
        case feelsLike = "feels_like"
        case condition = "condition"
        case windSpeed = "wind_speed"
        case windDir = "wind_dir"
        case pressureMm = "pressure_mm"
        case humidity = "humidity"
        case season = "season"
    }
    
    init(temp: Int, feelsLike: Int, condition: String, windSpeed: Double, windDir: String, pressureMm: Int, humidity: Int, season: String) {
        self.temp = temp
        self.feelsLike = feelsLike
        self.condition = condition
        self.windSpeed = windSpeed
        self.windDir = windDir
        self.pressureMm = pressureMm
        self.humidity = humidity
        self.season = season
    }
    
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
