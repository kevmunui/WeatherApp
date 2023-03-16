//
//  WeatherManagerTests.swift
//  WeatherAppTests
//
//  Created by Kevin Munui on 3/16/23.
//

import XCTest
@testable import WeatherApp

class WeatherManagerTests: XCTestCase {

    var weatherManager: WeatherManager!

    override func setUpWithError() throws {
        weatherManager = WeatherManager.shared
    }

    func testFetchWeatherDataForCity() {
        let expectation = XCTestExpectation(description: "Fetch weather data for city")
        
        weatherManager.fetchWeatherData(forCity: "New York") { result in
            switch result {
            case .success(let weatherResponse):
                XCTAssertEqual(weatherResponse.name, "New York")
                XCTAssertNotNil(weatherResponse.main)
                XCTAssertNotNil(weatherResponse.weather)
                XCTAssertNotNil(weatherResponse.wind)
            case .failure(let error):
                XCTFail("Fetching weather data for city failed with error: \(error.localizedDescription)")
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }

    func testFetchWeatherDataForInvalidCity() {
        let expectation = XCTestExpectation(description: "Fetch weather data for invalid city")
        
        weatherManager.fetchWeatherData(forCity: "Invalid City") { result in
            switch result {
            case .success(_):
                XCTFail("Fetching weather data for invalid city should fail")
            case .failure(let error):
                XCTAssertNotNil(error)
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }

    func testFetchWeatherDataForCoordinates() {
        let expectation = XCTestExpectation(description: "Fetch weather data for coordinates")
        
        weatherManager.fetchWeatherData(latitude: 40.7128, longitude: -74.0060) { result in
            switch result {
            case .success(let weatherCoodResponse):
                XCTAssertEqual(weatherCoodResponse.name, "New York")
                XCTAssertNotNil(weatherCoodResponse.main)
                XCTAssertNotNil(weatherCoodResponse.weather)
                XCTAssertNotNil(weatherCoodResponse.wind)
            case .failure(let error):
                XCTFail("Fetching weather data for coordinates failed with error: \(error.localizedDescription)")
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }

    func testFetchWeatherDataForInvalidCoordinates() {
        let expectation = XCTestExpectation(description: "Fetch weather data for invalid coordinates")
        
        weatherManager.fetchWeatherData(latitude: 1000, longitude: 1000) { result in
            switch result {
            case .success(_):
                XCTFail("Fetching weather data for invalid coordinates should fail")
            case .failure(let error):
                XCTAssertNotNil(error)
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }

}
