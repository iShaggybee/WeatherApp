//
//  WeatherCondition.swift
//  WeatherApp
//
//  Created by Kislov Vadim on 15.06.2022.
//

class WeatherCondition {
    static let shared = WeatherCondition()
    
    private var conditions = [
        "clear": "Ясно", "partly-cloudy": "Малооблачно",
        "cloudy": "Облачно с прояснениями", "overcast": "Пасмурно",
        "drizzle": "Морось", "light-rain": "Небольшой дождь",
        "rain": "Дождь", "moderate-rain": "Умеренно сильный дождь",
        "heavy-rain": "Сильный дождь", "showers": "Ливень",
        "wet-snow": "Дождь со снегом", "light-snow": "Небольшой снег",
        "snow-showers": "Снегопад", "snow": "Снег",
        "hail": "Град", "thunderstorm": "Ясно",
        "thunderstorm-with-rain": "Дождь с грозой",
        "thunderstorm-with-hail": "Гроза с градом",
        "continuous-heavy-rain": "Длительный сильный дождь",
    ]

    private var windDirections = [
        "nw": "северо-западный", "n": "северный",
        "ne": "северо-восточный", "e": "восточный",
        "se": "юго-восточный", "s": "южный",
        "sw": "юго-западный", "w": "западный",
        "с": "штиль"
    ]
    
    private init() {}
    
    func getWeather(condition: String) -> String {
        conditions[condition] ?? ""
    }
    
    func getWind(direction: String) -> String {
        windDirections[direction] ?? "-"
    }
}
