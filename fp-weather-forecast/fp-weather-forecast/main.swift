//
//  main.swift
//  fp-weather-forecast
//
//  Created by Jaedoo Ko on 2020/05/11.
//  Copyright © 2020 jko. All rights reserved.
//

import Foundation

struct Location: Codable {
    let title: String
    let location_type: String
    let woeid: Int
    let latt_long: String
}

struct WeatherInfo: Codable {
    let consolidated_weather: [Weather]
}

struct Weather: Codable {
    let weather_state_name: String
    let wind_direction_compass: String
    let applicable_date: String
    let min_temp: Float
    let max_temp: Float
    let the_temp: Float
    let wind_speed: Float
    let wind_direction: Float
    let air_pressure: Float
    let humidity: Float
    let visibility: Float
    let predictability: Float
}

func getData(url: URL, completion: @escaping (Data) -> ()) {
    DispatchQueue.global().async {
        if let data = try? Data(contentsOf: url) {
            completion(data)
        }
    }
}

func getLocations(query: String, completion: @escaping ([Location]) -> ()) {
    let url = URL(string: "https://www.metaweather.com/api/location/search?query=\(query)")!
    getData(url: url) { data in
        if let locations = try? JSONDecoder().decode([Location].self, from: data) {
            completion(locations)
        }
    }
}

func getWeathers(woeid: Int, completion: @escaping ([Weather]) -> ()) {
    let url = URL(string: "https://www.metaweather.com/api/location/\(woeid)")!
    getData(url: url) { data in
        if let weatherInfo = try? JSONDecoder().decode(WeatherInfo.self, from: data) {
            completion(weatherInfo.consolidated_weather)
        }
    }
}

func printWeather(_ weather: Weather) {
    let state = weather.weather_state_name.padding(toLength: 15,
                                                   withPad: " ",
                                                   startingAt: 0)
    let forecast = String(format: "%@: %@ %2.2f°C ~ %2.2f°C",
                          weather.applicable_date,
                          state,
                          weather.max_temp,
                          weather.min_temp)
    print(forecast)
}

let query = "san"
getLocations(query: query) { locations in
    locations.forEach { location in
        getWeathers(woeid: location.woeid) { weathers in
            print("[\(location.title)]-------------------------")
            weathers.forEach { weather in
                printWeather(weather)
            }
            print("--------------------------------------------")
        }
    }
}

RunLoop.main.run()
