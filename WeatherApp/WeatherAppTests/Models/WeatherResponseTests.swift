//
//  WeatherResponseTests.swift
//  WeatherAppTests
//
//  Created by Kevin Munui on 3/16/23.
//

import XCTest
@testable import WeatherApp

class WeatherResponseTests: XCTestCase {

    func testWeatherResponseDecoding() throws {
        let json = """
        {
            "coord": {
                "lon": -73.99,
                "lat": 40.73
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "base": "stations",
            "main": {
                "temp": 281.74,
                "pressure": 1020,
                "humidity": 60,
                "temp_min": 280.93,
                "temp_max": 282.59
            },
            "visibility": 10000,
            "wind": {
                "speed": 4.6,
                "deg": 280
            },
            "clouds": {
                "all": 1
            },
            "dt": 1589244203,
            "sys": {
                "type": 1,
                "id": 5141,
                "country": "US",
                "sunrise": 1589189494,
                "sunset": 1589239459
            },
            "timezone": -14400,
            "id": 5128581,
            "name": "New York",
            "cod": 200
        }
        """.data(using: .utf8)!

        let decoder = JSONDecoder()
        let weatherResponse = try decoder.decode(WeatherResponse.self, from: json)

        XCTAssertEqual(weatherResponse.name, "New York")
        XCTAssertNotNil(weatherResponse.coord)
        XCTAssertNotNil(weatherResponse.weather)
        XCTAssertNotNil(weatherResponse.main)
        XCTAssertNotNil(weatherResponse.wind)
        XCTAssertNotNil(weatherResponse.clouds)
        XCTAssertNotNil(weatherResponse.sys)
    }

}
