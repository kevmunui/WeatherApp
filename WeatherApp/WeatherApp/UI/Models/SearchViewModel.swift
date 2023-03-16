//
//  SearchViewModel.swift
//  WeatherApp
//
//  Created by Kevin Munui on 3/15/23.
//

import Foundation

class SearchViewModel {
    
    let weatherManager:WeatherManager?
    
    init() {
        self.weatherManager = WeatherManager.shared
    }
    
    
    // MARK: - Handle fetch last city
    func handleFetchWeatherLastCity(completion: @escaping (WeatherResponse?, Error?) -> Void) {
        if let manager = self.weatherManager, let city = manager.lastSearchCity {
            manager.fetchWeatherData(forCity: city) { result in
                switch result {
                case .success(let data):
                    // Handle the weather data
                    completion(data, nil)
                case .failure(let error):
                    // Handle the error
                    completion(nil, error)
                }
            }
        }
    }
    
    // MARK: - Handle fetch call
    func handleFetchWeatherByCity(_ city: String, completion: @escaping (WeatherResponse?, Error?) -> Void) {
        if let manager = self.weatherManager {
            manager.fetchWeatherData(forCity: city) { result in
                switch result {
                case .success(let data):
                    // Handle the weather data
                    if let searchCity = data.name {
                        // Store searchCity in UserDefaults
                        manager.setLastSearchCity(searchCity)
                    }
                    completion(data, nil)
                case .failure(let error):
                    // Handle the error
                    completion(nil, error)
                }
            }
        }
    }
    
}
