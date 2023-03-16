//
//  SearchViewModelTests.swift
//  WeatherAppTests
//
//  Created by Kevin Munui on 3/16/23.
//

import XCTest
@testable import WeatherApp

class SearchViewModelTests: XCTestCase {
    
    var searchViewModel: SearchViewModel!

    override func setUp() {
        super.setUp()
        searchViewModel = SearchViewModel()
    }

    override func tearDown() {
        searchViewModel = nil
        super.tearDown()
    }

    func testHandleFetchWeatherInCurrentLocation() {
        let expectation = self.expectation(description: "Fetch current location weather data")

        searchViewModel.handleFetchWeatherInCurrentLocation(-73.99, 40.73) { weatherCoodResponse, error in
            XCTAssertNotNil(weatherCoodResponse)
            XCTAssertNil(error)
            expectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)
    }

    func testHandleFetchWeatherLastCity() {
        let expectation = self.expectation(description: "Fetch last searched city weather data")

        searchViewModel.handleFetchWeatherLastCity { weatherResponse, error in
            XCTAssertNotNil(weatherResponse)
            XCTAssertNil(error)
            expectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)
    }

    func testHandleFetchWeatherByCity() {
        let expectation = self.expectation(description: "Fetch weather data for a city")

        searchViewModel.handleFetchWeatherByCity("New York") { weatherResponse, error in
            XCTAssertNotNil(weatherResponse)
            XCTAssertNil(error)
            expectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)
    }
}
