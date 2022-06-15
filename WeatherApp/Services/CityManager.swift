//
//  CityManager.swift
//  WeatherApp
//
//  Created by Kislov Vadim on 14.06.2022.
//

class CityManager {
    static let shared = CityManager()
    
    let cities = [
        City(name: "Абакан", latitude: 53.720976, longitude: 91.442423),
        City(name: "Архангельск", latitude: 64.539304, longitude: 40.518735),
        City(name: "Астрахань", latitude: 46.347869, longitude: 48.033574),
        City(name: "Барнаул", latitude: 53.356132, longitude: 83.74961999999999),
        City(name: "Белгород", latitude: 50.597467, longitude: 36.588849),
        City(name: "Бийск", latitude: 52.541444, longitude: 85.219686),
        City(name: "Благовещенск", latitude: 50.290658, longitude: 127.527173),
        City(name: "Братск", latitude: 56.151382, longitude: 101.634152),
        City(name: "Брянск", latitude: 53.2434, longitude: 34.364198),
        City(name: "Великий Новгород", latitude: 58.521475, longitude: 31.275475),
        City(name: "Владивосток", latitude: 43.134019, longitude: 131.928379),
        City(name: "Владикавказ", latitude: 43.024122, longitude: 44.690476),
        City(name: "Владимир", latitude: 56.129042, longitude: 40.40703),
        City(name: "Волгоград", latitude: 48.707103, longitude: 44.516939),
        City(name: "Вологда", latitude: 59.220492, longitude: 39.891568),
        City(name: "Воронеж", latitude: 51.661535, longitude: 39.200287),
        City(name: "Грозный", latitude: 43.317992, longitude: 45.698197),
        City(name: "Екатеринбург", latitude: 56.838002, longitude: 60.597295),
        City(name: "Иваново", latitude: 57.000348, longitude: 40.973921),
        City(name: "Ижевск", latitude: 56.852775, longitude: 53.211463),
        City(name: "Иркутск", latitude: 52.286387, longitude: 104.28066),
        City(name: "Казань", latitude: 55.795793, longitude: 49.106585),
        City(name: "Калининград", latitude: 55.916229, longitude: 37.854467),
        City(name: "Калуга", latitude: 54.507014, longitude: 36.252277),
        City(name: "Кемерово", latitude: 55.359594, longitude: 86.087781),
        City(name: "Киров", latitude: 54.079033, longitude: 34.323163),
        City(name: "Кострома", latitude: 57.767683, longitude: 40.926418),
        City(name: "Краснодар", latitude: 45.023877, longitude: 38.970157),
        City(name: "Красноярск", latitude: 56.008691, longitude: 92.870529),
        City(name: "Курск", latitude: 51.730361, longitude: 36.192647),
        City(name: "Липецк", latitude: 52.61022, longitude: 39.594719),
        City(name: "Махачкала", latitude: 42.984913, longitude: 47.504646),
        City(name: "Москва", latitude: 55.755773, longitude: 37.617761),
        City(name: "Мурманск", latitude: 68.9695629, longitude: 33.07454),
        City(name: "Нижний Новгород", latitude: 56.323902, longitude: 44.002267),
        City(name: "Новороссийск", latitude: 44.723489, longitude: 37.76866),
        City(name: "Новосибирск", latitude: 55.028739, longitude: 82.9069279),
        City(name: "Норильск", latitude: 69.349039, longitude: 88.201014),
        City(name: "Омск", latitude: 54.989342, longitude: 73.368212),
        City(name: "Орел", latitude: 52.970306, longitude: 36.063514),
        City(name: "Оренбург", latitude: 51.76806, longitude: 55.097449),
        City(name: "Пенза", latitude: 53.194546, longitude: 45.019529),
        City(name: "Пермь", latitude: 58.004785, longitude: 56.237654),
        City(name: "Псков", latitude: 57.819365, longitude: 28.331786),
        City(name: "Ростов-на-Дону", latitude: 47.227151, longitude: 39.744972),
        City(name: "Рязань", latitude: 54.619886, longitude: 39.744954),
        City(name: "Самара", latitude: 53.195533, longitude: 50.101801),
        City(name: "Санкт-Петербург", latitude: 59.938806, longitude: 30.314278),
        City(name: "Саратов", latitude: 51.531528, longitude: 46.03582),
        City(name: "Севастополь", latitude: 44.616649, longitude: 33.52536),
        City(name: "Ставрополь", latitude: 45.044502, longitude: 41.969065),
        City(name: "Тамбов", latitude: 52.721246, longitude: 41.452238),
        City(name: "Тверь", latitude: 56.859611, longitude: 35.911896),
        City(name: "Томск", latitude: 56.495116, longitude: 84.972128),
        City(name: "Тула", latitude: 54.193033, longitude: 37.617752),
        City(name: "Уфа", latitude: 54.734768, longitude: 55.957838),
        City(name: "Хабаровск", latitude: 48.472584, longitude: 135.057732),
        City(name: "Челябинск", latitude: 55.159774, longitude: 61.402455),
        City(name: "Якутск", latitude: 62.027833, longitude: 129.704151),
        City(name: "Ярославль", latitude: 57.626569, longitude: 39.893822)
    ]
    
    private init() {}
}


