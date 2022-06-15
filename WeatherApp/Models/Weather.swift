//
//  Weather.swift
//  WeatherApp
//
//  Created by Kislov Vadim on 15.06.2022.
//

import Foundation

struct Weather: Decodable {
    let temp: Int?
    let feelsLike: Int?
    let condition: String?
    let windSpeed: Int?
    let windDir: String?
    let pressureMm: Int?
    let humidity: Int?
    let season: String?
    let cloudness: Double?
}

