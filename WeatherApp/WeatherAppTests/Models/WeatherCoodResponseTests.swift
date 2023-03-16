//
//  WeatherCoodResponseTests.swift
//  WeatherAppTests
//
//  Created by Kevin Munui on 3/16/23.
//

import XCTest
@testable import WeatherApp

class WeatherCoodResponseTests: XCTestCase {

    func testWeatherCoodResponseDecoding() throws {
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
                "feels_like": 277.44,
                "temp_min": 280.93,
                "temp_max": 282.59,
                "pressure": 1020,
                "humidity": 60
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
        let weatherCoodResponse = try decoder.decode(WeatherCoodResponse.self, from: json)

        XCTAssertEqual(weatherCoodResponse.name, "New York")
        XCTAssertNotNil(weatherCoodResponse.coord)
        XCTAssertNotNil(weatherCoodResponse.weather)
        XCTAssertNotNil(weatherCoodResponse.main)
        XCTAssertNotNil(weatherCoodResponse.wind)
        XCTAssertNotNil(weatherCoodResponse.clouds)
        XCTAssertNotNil(weatherCoodResponse.sys)
    }

}
