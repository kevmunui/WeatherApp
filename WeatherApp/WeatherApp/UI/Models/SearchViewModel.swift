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
    
    
    // MARK: - Handle fetch call
    func handleFetchWeatherBtCity(_ city:String, completion: @escaping(Error?) -> Void) {
        if let manager = self.weatherManager {
            manager.fetchWeatherData(forCity: city) { result in
                switch result {
                case .success(let data):
                    // Handle the weather data
                    print("Weather data: \(data)")
                    completion(nil)
                case .failure(let error):
                    // Handle the error
                    print("Error: \(error.localizedDescription)")
                    completion(error)
                }
            }
        }
    }
    
}
