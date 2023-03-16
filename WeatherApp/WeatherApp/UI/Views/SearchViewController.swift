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
        self.spinnerView.addSubview(spinnerViewLabel)
        self.errorLabel.alpha = 0
        self.errorLabel.text = ""
        
        
        errorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        errorLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        errorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -30).isActive = true
        errorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 30).isActive = true
        
        spinnerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinnerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        spinnerView.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        spinnerView.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
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
    
    let errorLabel : UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        lb.textColor = UIColor.systemRed.withAlphaComponent(0.7)
        lb.numberOfLines = 0
        lb.textAlignment = .center
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let spinnerViewLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 26, y:55, width: 100, height: 30))
        label.text = "Searching"
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    let spinnerView: UIActivityIndicatorView = {
       let atv = UIActivityIndicatorView()
        atv.translatesAutoresizingMaskIntoConstraints = false
        atv.backgroundColor = .systemTeal.withAlphaComponent(0.7)
        atv.tintColor = .white
        atv.layer.cornerRadius  = 10
       return atv
    }()
    
    // MARK: - Action
    
    @objc private func searchButtonTapped() {
        searchBar.resignFirstResponder() // Dismiss the keyboard
        self.fetchWeatherData()
    }
    
    // MARK: - Business Logic
    
    func fetchWeatherData() {
        if let searchText = self.searchBar.text, let vm = self.viewModel {
            if searchText != "" {
                self.errorLabel.alpha = 0
                self.spinnerView.startAnimating()
                vm.handleFetchWeatherBtCity(searchText) { cityData, error  in
                    if let error = error {
                        // Change label in the main thread
                        DispatchQueue.main.async {
                            self.spinnerView.stopAnimating()
                            self.errorLabel.alpha = 1
                            self.errorLabel.text = error.localizedDescription.description
                        }
                    } else {
                        DispatchQueue.main.async {
                            // display data
                            self.spinnerView.stopAnimating()
                            print(cityData)
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
