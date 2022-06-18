//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by Kislov Vadim on 14.06.2022.
//

import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    
    private var url = "https://api.weather.yandex.ru/v2/forecast"
    private var apiKey = "8ba506be-25ea-48be-a374-2405b38114b5"
    
    private init() {}
    
    func fetchWeatherBy(latitude lat: Double, longitude lon: Double, completion: @escaping (Result<WeatherResponse, AFError>) -> Void) {
        let params = [
            "lat": String(lat),
            "lon": String(lon),
            "lang": "ru_RU",
            "limit": "1",
            "hours": "false",
            "extra": "true"
        ]
        
        AF.request(url,
                   method: .get,
                   parameters: params,
                   headers: ["X-Yandex-API-Key": "\(apiKey)"])
            .validate()
            .responseDecodable(of: WeatherResponse.self) { response in
                switch response.result {
                case .success(let weatherResponse):
                    let weather = Weather(temp: weatherResponse.weather?.temp ?? 0,
                                          feelsLike: weatherResponse.weather?.feelsLike ?? 0,
                                          condition: weatherResponse.weather?.condition ?? "",
                                          windSpeed: weatherResponse.weather?.windSpeed ?? 0,
                                          windDir: weatherResponse.weather?.windDir ?? "",
                                          pressureMm: weatherResponse.weather?.pressureMm ?? 0,
                                          humidity: weatherResponse.weather?.humidity ?? 0,
                                          season: weatherResponse.weather?.season ?? "")
                    
                    completion(.success(WeatherResponse(time: weatherResponse.time ?? 0, weather: weather)))
                case .failure(let error):
                    completion(.failure(error))
                }
            }.resume()
    }
}

