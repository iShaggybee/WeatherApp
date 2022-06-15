//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by Kislov Vadim on 14.06.2022.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private var url = "https://api.weather.yandex.ru/v2/forecast"
    private var apiKey = "a1971634-ffdb-4b40-9acd-76c0d32ae1b5"
    
    private init() {}
    
    func fetchWeatherBy(latitude lat: Double,
                        longitude lon: Double,
                        completion:  @escaping (WeatherResponse) -> (),
                        errorHandler: @escaping (String, String) -> ()
    ) {
        guard let request = getURLRequest(latitude: lat, longitude: lon) else {
            errorHandler("Ошибка", "Что-то пошло не так :(")
            
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data else {
                DispatchQueue.main.async {
                    errorHandler("Ошибка", error?.localizedDescription ?? "Что-то пошло не так :(")
                }
                
                return
            }
            
            let decoder = JSONDecoder()
            
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do {
               let weather = try decoder.decode(WeatherResponse.self, from: data)
                
                DispatchQueue.main.async {
                    completion(weather)
                }
                
            } catch _ {
                DispatchQueue.main.async {
                    errorHandler("Ошибка", "Получены некорректные данные" )
                }
            }
            
        }.resume()
    }
}

extension NetworkManager {
    private func getURLRequest(latitude lat: Double, longitude lon: Double) -> URLRequest? {
        guard var urlComponents = URLComponents(string: url) else { return nil }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "lat", value: String(lat)),
            URLQueryItem(name: "lon", value: String(lon)),
            URLQueryItem(name: "lang", value: "ru_RU"),
            URLQueryItem(name: "limit", value: "1"),
            URLQueryItem(name: "hours", value: "false"),
            URLQueryItem(name: "extra", value: "true")
        ]

        var request = URLRequest(url: urlComponents.url!)
    
        request.httpMethod = "GET"
        request.timeoutInterval = 15
        request.setValue("\(apiKey)", forHTTPHeaderField: "X-Yandex-API-Key")
        
        return request
    }
}
