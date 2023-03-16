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
    var lastSearchCity:String?
    // var lastCityUpdatedByUser
    
    private init() {
        fetchLastSearchCity()
    } // Private initializer to ensure only one instance is created
    
    func fetchLastSearchCity() {
        if let storedCity = UserDefaults.standard.value(forKey: "searchCity") as? String {
            self.lastSearchCity = storedCity
        }
    }
    
    func setLastSearchCity(_ searchCity:String) {
        UserDefaults.standard.setValue(searchCity, forKey: "searchCity")
        self.lastSearchCity = searchCity
    }
    
    func fetchWeatherData(forCity cityName: String, completion: @escaping (Result<WeatherResponse, Error>) -> Void) {
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
                let decoder = JSONDecoder()
                do {
                    let weatherResponse = try decoder.decode(WeatherResponse.self, from: data)
                    completion(.success(weatherResponse))
                } catch let decodingError as DecodingError {
                    // Handle parsing error here
                    print("Parsing error: \(decodingError)")
                    completion(.failure(decodingError))
                } catch {
                    // Handle other errors here
                    completion(.failure(error))
                }
            } else {
                completion(.failure(NSError(domain: "No data received", code: -1, userInfo: nil)))
            }
        }
        
        task.resume()
    }

}
