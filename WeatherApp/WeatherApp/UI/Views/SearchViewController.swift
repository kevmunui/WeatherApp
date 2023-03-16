//
//  SearchViewController.swift
//  WeatherApp
//
//  Created by Kevin Munui on 3/15/23.
//

import Foundation
import UIKit

class SearchViewController: UIViewController {
    
    // MARK: - variables
    var viewModel:SearchViewModel?
    
    // MARK: - Initialization
    init(_ vm: SearchViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = vm
        self.initializeUI()
    }
    
    func initializeUI() {
        self.view.backgroundColor = .white
        self.setupSearchBar()
        self.view.addSubview(spinnerView)
        self.view.addSubview(errorLabel)
        self.view.addSubview(cityNameLabel)
        self.view.addSubview(temperatureLabel)
        self.view.addSubview(descritionLabel)
        self.view.addSubview(highTempLabel)
        self.view.addSubview(lowTempLabel)
        self.view.addSubview(cloudCoverLabel)
        self.view.addSubview(coordLabel)
        self.view.addSubview(longLabel)
        self.view.addSubview(latLabel)
        self.view.addSubview(searchAgainButton)
        self.spinnerView.addSubview(spinnerViewLabel)
        self.errorLabel.alpha = 0
        self.searchAgainButton.alpha = 0
        self.errorLabel.text = ""
        self.hideLabels()
        
        errorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        errorLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        errorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -30).isActive = true
        errorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 30).isActive = true
        
        spinnerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinnerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        spinnerView.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        spinnerView.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        
        
        cityNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cityNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 35).isActive = true
        
        temperatureLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        temperatureLabel.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor, constant: 15).isActive = true
        
        descritionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        descritionLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 15).isActive = true
        descritionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -30).isActive = true
        descritionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 30).isActive = true
        
        highTempLabel.topAnchor.constraint(equalTo: descritionLabel.bottomAnchor, constant: 15).isActive = true
        highTempLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 30).isActive = true
        
        lowTempLabel.topAnchor.constraint(equalTo: descritionLabel.bottomAnchor, constant: 15).isActive = true
        lowTempLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30).isActive = true
        
        cloudCoverLabel.topAnchor.constraint(equalTo: lowTempLabel.bottomAnchor, constant: 15).isActive = true
        cloudCoverLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        searchAgainButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        searchAgainButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30).isActive = true
    }
    
    private func setupSearchBar() {
       searchBar.delegate = self // Set the delegate for the search bar
       
       self.view.addSubview(searchBar) // Add the search bar to the view hierarchy
       
       // Set up Auto Layout constraints
       NSLayoutConstraint.activate([
           searchBar.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
           searchBar.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
           searchBar.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
       ])
   }
    
    // MARK: - De-initialization
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life-cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - UI Components
    var cityNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    var temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    var descritionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    var highTempLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    var lowTempLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    var spinnerViewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    var cloudCoverLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    var coordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    var longLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    var latLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "Search"
        searchBar.showsSearchResultsButton = true
        if let searchTextField = searchBar.value(forKey: "searchField") as? UITextField {
            let borderImage = UIImage() // Create an empty UIImage
            searchTextField.borderStyle = .none // Remove the border
            searchTextField.background = borderImage // Set the background image to the empty UIImage
        }
        return searchBar
    }()
    
    var errorLabel: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        lb.textColor = UIColor.systemRed.withAlphaComponent(0.7)
        lb.numberOfLines = 0
        lb.textAlignment = .center
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
   
    
    var spinnerView: UIActivityIndicatorView = {
       let atv = UIActivityIndicatorView()
        atv.translatesAutoresizingMaskIntoConstraints = false
        atv.backgroundColor = .systemTeal.withAlphaComponent(0.7)
        atv.tintColor = .white
        atv.layer.cornerRadius  = 10
       return atv
    }()
    
    var searchAgainButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.systemTeal.withAlphaComponent(0.5)
        let attributedTitle = NSAttributedString(string: "Search Again", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor(red: 255, green: 255, blue: 255, alpha: 100)])
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.isEnabled = true
        button.addTarget(self, action: #selector(searchAgainButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Action
    
    @objc private func searchButtonTapped() {
        searchBar.resignFirstResponder() // Dismiss the keyboard
        self.fetchWeatherData()
    }
    
    @objc private func searchAgainButtonTapped() {
        searchBar.resignFirstResponder() // Dismiss the keyboard
        self.searchBar.alpha = 1
        self.searchAgainButton.alpha = 0
        self.hideLabels()
    }
    
    // MARK: - Business Logic
    
    func showLabels() {
        self.cityNameLabel.alpha = 1
        self.temperatureLabel.alpha = 1
        self.descritionLabel.alpha = 1
        self.highTempLabel.alpha = 1
        self.lowTempLabel.alpha = 1
        self.cloudCoverLabel.alpha = 1
        self.coordLabel.alpha = 1
        self.longLabel.alpha = 1
        self.latLabel.alpha = 1
    }
    
    func hideLabels() {
        self.cityNameLabel.alpha = 0
        self.temperatureLabel.alpha = 0
        self.descritionLabel.alpha = 0
        self.highTempLabel.alpha = 0
        self.lowTempLabel.alpha = 0
        self.cloudCoverLabel.alpha = 0
        self.coordLabel.alpha = 0
        self.longLabel.alpha = 0
        self.latLabel.alpha = 0
    }
    
    func fetchWeatherData() {
        if let searchText = self.searchBar.text, let vm = self.viewModel {
            if searchText != "" {
                self.errorLabel.alpha = 0
                self.searchAgainButton.alpha = 1
                self.spinnerView.startAnimating()
                vm.handleFetchWeatherBtCity(searchText) { cityData, error  in
                    if let error = error {
                        // Change label in the main thread
                        DispatchQueue.main.async {
                            self.spinnerView.stopAnimating()
                            self.errorLabel.alpha = 1
                            self.searchBar.alpha = 1
                            self.errorLabel.text = error.localizedDescription.description
                        }
                    } else {
                        DispatchQueue.main.async {
                            // display data
                            if let newCityData = cityData {
                                self.spinnerView.stopAnimating()
                                self.searchAgainButton.alpha = 1
                                self.searchBar.alpha = 0
                                self.showLabels()
                                self.cityNameLabel.text = newCityData.name
                                self.temperatureLabel.text = "\(String(describing: newCityData.main?.temp))"
                                self.descritionLabel.text = newCityData.weather?.description
                                self.highTempLabel.text = "H:\(String(describing: newCityData.main?.temp_max))"
                                self.lowTempLabel.text = "L:\(String(describing: newCityData.main?.temp_min))"
                                self.cloudCoverLabel.text = "Cloud cover is \(String(describing: newCityData.clouds?.all))%"
                                self.longLabel.text = "\(String(describing: newCityData.coord?.lon))"
                                self.latLabel.text = "\(String(describing: newCityData.coord?.lat))"
                                
                            }
                        }
                    }
                }
            }
        }
    }
}

// MARK: - UISearchBarDelegate
extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder() // Dismiss the keyboard
        // Perform search action here
        self.fetchWeatherData()
    }
}
