//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Kislov Vadim on 15.06.2022.
//

import UIKit

class WeatherViewController: UIViewController {
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var extendedWeatherLabel: UILabel!
    @IBOutlet var seasonImage: UIImageView!
    @IBOutlet var winterLabel: UILabel!
    @IBOutlet var pressureLabel: UILabel!
    @IBOutlet var humidityLabel: UILabel!
    
    public var city: City!
    
    private let spinnerVC = SpinnerViewController()
    
    private let networkManager = NetworkManager.shared
    private let weatherCondition = WeatherCondition.shared
    
    private var weather: Weather?
    private var currentTime: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        spinnerVC.activateFor(parent: self)

        fetchWeather()
    }
    
    func fetchWeather() {
        networkManager.fetchWeatherBy(
            latitude: city.latitude,
            longitude: city.longitude,
            completion: { response in
                self.spinnerVC.deactivate()
                self.setWeather(response: response)
            },
            errorHandler: { title, message in
                self.showAlert(title: title, message: message)
            })
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let repeatAction = UIAlertAction(title: "Повторить", style: .default) { _ in
            self.fetchWeather()
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .default) { _ in
            self.navigationController?.popViewController(animated: true)
        }
        
        alert.addAction(repeatAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    
    private func setWeather(response: WeatherResponse) {
        currentTime = response.now
        weather = response.fact
        
        if let weather = weather {
            timeLabel.text = getFormattedDate(currentTime)
            cityLabel.text = city.name
            tempLabel.text = "\(weather.temp ?? 0)°C"
            extendedWeatherLabel.text =
                weather.getExtendedWeather(weatherCondition: weatherCondition)
            
            if let season = weather.season {
                seasonImage.image = UIImage(named: season)
            }
            
            winterLabel.text = "\(weather.windSpeed ?? 0) м/с"
            
            let windDirection = weatherCondition.getWind(direction:
                                                            weather.windDir ?? "")
            
            winterLabel.text = windDirection.isEmpty ?
                winterLabel.text :
                (winterLabel.text ?? "") + ", \(windDirection)"
            
            pressureLabel.text = "\(weather.pressureMm ?? 0) мм рт.ст."
            humidityLabel.text = "\(weather.humidity ?? 0) %"
        }
    }
}

extension WeatherViewController {
    private func getFormattedDate(_ currentTime: Int?) -> String {
       let dateFormatter = DateFormatter()
       
       dateFormatter.dateStyle = .medium
       dateFormatter.timeStyle = .short
       dateFormatter.locale = Locale(identifier: "ru_RU")
        
       let date = Date(timeIntervalSince1970: TimeInterval(currentTime ?? 0))
       
       return dateFormatter.string(from: date)
   }
}
