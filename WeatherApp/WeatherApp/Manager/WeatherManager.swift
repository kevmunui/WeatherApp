//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Kevin Munui on 3/15/23.
//

import Foundation

class WeatherManager {
    
    // Singleton instance
    static let shared = WeatherManager()
    
    private let apiKey = "0b672e355f8ab3bf7a35fe4ede42b180"
    private let baseURL = "https://api.openweathermap.org/data/2.5/weather?q="
    
    private init() {} // Private initializer to ensure only one instance is created
    
    func fetchWeatherData(forCity cityName: String, completion: @escaping (Result<Data, Error>) -> Void) {
        let escapedCityName = cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? cityName
        let urlString = "\(baseURL)\(escapedCityName)&appid=\(apiKey)"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                completion(.success(data))
            } else {
                completion(.failure(NSError(domain: "No data received", code: -1, userInfo: nil)))
            }
        }
        
        task.resume()
    }
}
